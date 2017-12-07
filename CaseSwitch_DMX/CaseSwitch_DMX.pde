
/*
Chroma-Q™
Color Split™


Mode 8: RGB

Channel   Value 

1          Red #1: 0-255
2          Green #1: 0-255
3          Blue #1: 0-255
4          Amber #1: 0-255
      
*/

import processing.serial.*; // Import Serial library to talk to Arduino 


int value1; // create a variable to hold the data we are sending to the Arduino 
int value2;
int value;
int channel;
int num;
Serial myPort; // Send new DMX channel value to Arduino // 

void setDmxChannel(int channel, int value) { // Convert the parameters into a message of the form: 123c45w where 123 is the channel and 45 is the value // then send to the Arduino 
  myPort.write( str(channel) + "c" + str(value) + "w" );
}


void setup() { 
  printArray(Serial.list()); // shows available serial ports on the system 
  // Change 0 to select the appropriate port as required. 
  String portName = Serial.list()[3]; 
  myPort = new Serial(this, portName, 9600);

  size(256, 256); // Create a window
  
  //bulb on FULL!
  setDmxChannel(5, 255);
}

void draw() { 

  value1 = (255 * mouseX / width); // Use cursor X position to get channel 1 value 
  value2 = (255 * mouseY / height);// Use cursor Y position to get channel 2 value 

int range = num;

switch(range){
case 0:
channel=3;
value=50;
println("ONE");
break;
case 1:
//RED
channel=3;
value=255;
println("TWO");
break;
case 2:
//GREEN
channel=3;
value=150;
println("THREE");
break;
case 3:
//BLUE
channel=3;
value=100;
println("FOUR");
break;



}

  setDmxChannel(channel, value); // Send new channel values to Arduino 
  // You may have to set other channels. Some lamps have a shutter channel that should be set to 255. 
  // Set it here: setDmxChannel(4,255);

  delay(20); // Short pause before repeating
} 