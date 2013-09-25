"""
Python script for the pi backend to curl post website after getting data xbee
"""

import urllib2
import urllib
import xbee
import serial

"""
doPost takes a int or string representing the carcount recived from the xbee, and a arduino id
and does a post to a specific webpage
returns the page for debuging and user convience
	
"""
def doPost(carCount, sensorID):
	data = [("%s" % (sensorID), "%s" % (carCount))]
	encodedData = urllib.urlencode(data)
	path = "http://lanfort.asuscomm.com/cgi-bin/env_dump_cli.cgi" #TODO make real webpage: currently webpage hosted by zach, this is not the permanent solution
	request = urllib2.Request(path, encodedData)
	request.add_header("Content-type", "application/x-www-form-urlencoded") #TODO may need to modify header. Currently for non binary data
	page = urllib2.urlopen(request)
	return page


"""
current frame work for getting data from the xbee
This function is not concrete at all, feel free to heavly modify it.

Currently get data will try to read from the serial port /dev/ttyS0 at 9600 rate, will also create an xbee class for contoling the xbee(not really required, in fact it should probably be removed
"""

def getData():
	serialPort = serial.Serial("/dev/ttyS0", 9600)
	xbee = Xbee(serialPort)
	while True:
		try:
			print xbee.wait_read_frame()
		except KeyboardInterrupt:
			break



print doPost(87, 0).read() #for debuging
