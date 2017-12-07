import processing.serial.*; // Import Serial library to talk to Arduino

int numImg = 23;  // 24 images
PImage[] images = new PImage[numImg]; // New array of PImage
int colorsNum = 0; // White

int value1; // Create a variable to hold the data we are sending to the Arduino 
int value2;
int value;
int channel;
Serial myPort; // Send new DMX channel value to Arduino // 


int timer = 0;
int timerDelay = 5*1000;
int index = 0;


void setDmxChannel(int channel, int value) { // Convert the parameters into a message of the form: 123c45w where 123 is the channel and 45 is the value // then send to the Arduino 
  myPort.write( str(channel) + "c" + str(value) + "w" );
}

void setup() {
  //fullScreen();
  size(1667, 1080);

  printArray(Serial.list()); // Shows available serial ports on the system 
  // Change 0 to select the appropriate port as required. 
  String portName = Serial.list()[1]; 
  myPort = new Serial(this, portName, 9600);

  //size(426, 276); // Base proportions are 142:92
  // frameRate(0.2); // 5 seconds per image

  //Initialize lights
  setDmxChannel(123, 45);
  // Bulb on FULL!
  //setDmxChannel(5, 255);

  // Load in each image
  for (int i = 0; i < images.length; i++) {
    images[i] = loadImage(str(i) + ".jpg");
  }
  noCursor();
}

void draw() {
  value1 = (255 * mouseX / width); // Use cursor X position to get channel 1 value 
  value2 = (255 * mouseY / height);// Use cursor Y position to get channel 2 value

  if (millis() > timer) {
    timer = millis() + timerDelay;
    float r = random(0, numImg); // Random array index
    index = int(r);
  }

  PImage img = images[index]; // Image at array index r
  image(img, 0, 0, width, height);

  switch(index) {
  case 6:
  case 9:
  case 23:
    //RED
    colorRed();
    //println("RED");
    break;
  case 5:
  case 10:
  case 14:
    //ORANGE
    colorOrange();
    //println("ORANGE");
    break;
  case 0:
  case 2:
  case 7:
  case 12:
  case 19:
    //YELLOW
    colorYellow();
    //println("YELLOW");
    break;
  case 13:
  case 15:
    //GREEN
    colorGreen();
    //println("GREEN");
    break;
  case 1:
  case 11:
  case 17:
  case 18:
    //TEAL
    colorTeal();
    //println("TEAL");
    break;
  case 3:
  case 4:
  case 8:
  case 20:
    //BLUE
    colorBlue();
    //println("BLUE");
    break;
  case 16:
  case 21:
  case 22:
    //WHITE
    colorWhite();
    //println("WHITE");
    break;
  }
  
  //setDmxChannel(channel, value); // Send new channel values to Arduino 
  // You may have to set other channels. Some lamps have a shutter channel that should be set to 255. 
  // Set it here: setDmxChannel(4,255);

  // delay(20); // Short pause before repeating
  
}

void reset(){
  setDmxChannel(1, 0);
  setDmxChannel(2, 0);
  setDmxChannel(3, 0);
  setDmxChannel(4, 0);
}

// Still not the most efficient code; fast to write

void colorRed(){
  reset();
  setDmxChannel(1, 255);
  setDmxChannel(2, 51);
  setDmxChannel(3, 51);
}

void colorOrange(){
  reset();
  setDmxChannel(1, 255);
  setDmxChannel(2, 153);
  setDmxChannel(3, 51);
}

void colorYellow(){
  reset();
  setDmxChannel(1, 255);
  setDmxChannel(2, 255);
  setDmxChannel(3, 51);
}

void colorGreen(){
  reset();
  setDmxChannel(1, 178);
  setDmxChannel(2, 255);
  setDmxChannel(3, 102);
}
void colorTeal(){
  reset();
  setDmxChannel(1, 0);
  setDmxChannel(2, 204);
  setDmxChannel(3, 102);
}

void colorBlue(){
  reset();
  setDmxChannel(1, 0);
  setDmxChannel(2, 102);
  setDmxChannel(3, 204);
}

void colorWhite(){
  reset();
  setDmxChannel(1, 255);
  setDmxChannel(2, 255);
  setDmxChannel(3, 255);
  setDmxChannel(4, 255);
}
  