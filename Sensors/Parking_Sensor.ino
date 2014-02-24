/*
An Arduino code example for interfacing with the HMC5883

by: Jordan McConnell
 SparkFun Electronics
 created on: 6/30/11
 license: OSHW 1.0, http://freedomdefined.org/OSHW

Analog input 4 I2C SDA
Analog input 5 I2C SCL
*/

const float ALPHA = 0.2;
const float BASELINE_ALPHA = 0.001;
//const int THRESHOLD = 10; //original value
const int THRESHOLD = 1; //for indoor debugging
//const int WINDOW = 70; //original value
const int WINDOW = 10; //for indoor debugging
const int SEED_VALUES = 4;
const String ID = "0";

int count;
boolean upper;
boolean lower;
float baselineY;
float smoothY;
int calmCount;

#include <Wire.h> //I2C Arduino Library

#define address 0x1E //0011110b, I2C 7bit address of HMC5883

void setup(){
  count = 0;
  baselineY = 0;
  smoothY = 0;
  calmCount = 0;
  lower = upper = false;
  //Initialize Serial and I2C communications
  Serial.begin(57600);
  Wire.begin();
  Serial.println("starting operation");
  //Put the HMC5883 IC into the correct operating mode
  Wire.beginTransmission(address); //open communication with HMC5883
  Wire.write(0x02); //select mode register
  Wire.write(0x00); //continuous measurement mode
  Wire.endTransmission();
  
  // Initialize baseline
  int x, y, z;
  int n = 0;
  while (n < SEED_VALUES){
    Wire.beginTransmission(address);
    Wire.write(0x03); //select register 3, X MSB register
    Wire.endTransmission();
   //Read data from each axis, 2 registers per axis
    Wire.requestFrom(address, 6);
    if(6<=Wire.available()){
      x = Wire.read()<<8; //X msb
      x |= Wire.read(); //X lsb
      z = Wire.read()<<8; //Z msb
      z |= Wire.read(); //Z lsb
      y = Wire.read()<<8; //Y msb
      y |= Wire.read(); //Y lsb
      baselineY += y;
      n++;
    }
  }
  baselineY /= SEED_VALUES;
  Serial.println("setup finished");
}
void loop(){
  int x,y,z; //triple axis data

  //Tell the HMC5883 where to begin reading data
  Wire.beginTransmission(address);
  Wire.write(0x03); //select register 3, X MSB register
  Wire.endTransmission();
  
  
 
 //Read data from each axis, 2 registers per axis
  Wire.requestFrom(address, 6);
  if(6<=Wire.available()){
    x = Wire.read()<<8; //X msb
    x |= Wire.read(); //X lsb
    z = Wire.read()<<8; //Z msb
    z |= Wire.read(); //Z lsb
    y = Wire.read()<<8; //Y msb
    y |= Wire.read(); //Y lsb
  }
  
  baselineY = ((1 - BASELINE_ALPHA) * baselineY) + ((BASELINE_ALPHA) * y);
  smoothY = ((1 - ALPHA) * smoothY) + (ALPHA * y);
  
  if (smoothY > (baselineY + THRESHOLD) || smoothY < (baselineY - THRESHOLD)) {
    if ((!upper) && (!lower)) {
      if (smoothY > (baselineY + THRESHOLD)) {
        upper = true;
        count++;
      } else if (smoothY < (baselineY - THRESHOLD)) {
        lower = true;
        count--;
      }
      // Calculate checksum
      String output = ID + ":" + (String)count + ":" + (String)100;
      int sum = output.length();
      
      // PRINTING DONE HERE
      Serial.println(output + "!" + (String)sum + ";");
    }
  } else {
    calmCount++;
  }
  if (calmCount >= WINDOW) {
    calmCount = 0;
    upper = false;
    lower = false;
  }
  
  delay(10);
}

