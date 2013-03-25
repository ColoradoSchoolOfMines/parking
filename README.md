parking
============

acmX real-time campus parking information.

Web
---
  - Austin Diviness
  - Andrew DeMaria

### Database Design 
#### Case 1:
The sensors just measure delta in cars
- Parking Lot
    - Location
    - Max_capacity
- Event
    - Car_delta
        - Positive | Car into parking lot
        - Negative | Car out of parking lot
    - Time
    - Day

Parking Lot has many Events

Do we need to clear the database every night to keep the size down?

If the events table gets large, would it make sense to keep a current_capacity
associated with each parking lot?

#### Case 2:
The sensors provide some sense of exact spaces being occupied/unoccupied
- Parking Lot
    - Lot_Location (in regards to campus)
    - Max_capacity
- Parking Space
    - Status
        - Occupied / Unoccupied
    - Space_Location (in regards to the lot)
        - Row
        - offset
<pre>
              r1    r2    r3  r4
              ---------  ---------
               0  | 0     0  |  0
              ---------  ---------
               1  | 1     1  |  1
              ---------  ---------
               2  | 2     2  |  2
              ---------  ---------
               3  | 3     3  |  3
              ---------  ---------
               4  | 4  
              --------- 
</pre>

Parking Lot has many Parking Spaces

Do we still need a sense of events for history tracking?

Hardware
---
CTLM lot to start?

Arduino hardware (or even an ATTiny85) to process sensor data and send via wireless xbee to Hub.
Waterproof case, solar panels, li-po batteries, ATTiny85, wireless xbee transmitters and receivers.  - Roy has these hardware items for immediate R&D

Sensors possiblities: 
- hardened rubber 'tubes' with conductors inside layed across ingress and egress areas for lots.
- lasers
- sonar range finders
- cameras

GPS chip for theft mitigation?

-Roy Stillwell


Hub
---
Some computing hardware with serial attached xbee capable of receiving two streams of data from sensors.  
Hub machine would post data to corresponding web service/app.  
Use statistical analysis w/ standard deviations to determine actual cars/motorcycles 
entering/leaving lots based on Case 1, or image data from specific lot sensors based on Case 2.

-Roy Stillwell

Mobile
---
Mobile app to tie into web service/app. iPhone or Android based.  There were at least two people interested in
doing this.


