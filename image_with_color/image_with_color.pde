import processing.serial.*; // Import Serial library to talk to Arduino

int numImg = 23;  // 24 images
PImage[] images = new PImage[numImg]; // New array of PImage
int colorsNum = 0; // White

int value1; // Create a variable to hold the data we are sending to the Arduino 
int value2;
int value;
int channel;
Serial myPort; // Send new DMX channel value to Arduino // 

void setDmxChannel(int channel, int value) { // Convert the parameters into a message of the form: 123c45w where 123 is the channel and 45 is the value // then send to the Arduino 
  myPort.write( str(channel) + "c" + str(value) + "w" );
}

void setup() {
  printArray(Serial.list()); // Shows available serial ports on the system 
  // Change 0 to select the appropriate port as required. 
  String portName = Serial.list()[3]; 
  myPort = new Serial(this, portName, 9600);
  
  size(426, 276); // Base proportions are 142:92
  frameRate(0.2); // 5 seconds per image
  
  // Bulb on FULL!
  setDmxChannel(5, 255);
  
  // Load in each image
  for(int i = 0; i < images.length; i++){
  images[i] = loadImage(str(i) + ".jpg");
  }
}

void draw() {
  value1 = (255 * mouseX / width); // Use cursor X position to get channel 1 value 
  value2 = (255 * mouseY / height);// Use cursor Y position to get channel 2 value
  
  float r = random(0, numImg); // Random array index
  int i = int(r);
  PImage img = images[i]; // Image at array index r
  image(img, 0, 0, 426, 276);
  
  switch(i) {
    case 0:
    case 2:
    case 7:
    case 12:
    case 19:
      colorsNum = 3; // Yellow
      break;
    case 1:
    case 11:
    case 13:
    case 15:
    case 17:
    case 18:
      //GREEN
      channel = 3;
      value = 150;
      println("THREE");
      break;
    case 3:
    case 4:
    case 8:
      //BLUE
      channel = 3;
      value = 100;
      println("FOUR");
      break;
    case 5:
    case 10:
    case 14:
    case 20:
      colorsNum = 2; // Orange
      break;
    case 6:
    case 9:
    case 23:
      //RED
      channel = 3;
      value = 255;
      println("RED");
      break;
    case 16:
    case 21:
    case 22:
      colorsNum = 0; // White
      break;
  }
  
  setDmxChannel(channel, value); // Send new channel values to Arduino 
  // You may have to set other channels. Some lamps have a shutter channel that should be set to 255. 
  // Set it here: setDmxChannel(4,255);
  
  delay(20); // Short pause before repeating
}