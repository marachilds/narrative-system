int numImg = 23;  // 24 images
PImage[] images = new PImage[numImg]; // New array of PImage
int colorsNum = 0; // White

void setup() {
  size(426, 276); // Base proportions are 142:92
  frameRate(0.2); // 5 seconds per image
  
  //Load in each image
  for(int i = 0; i < images.length; i++){
  images[i]=loadImage(str(i) + ".jpg");
  }
}

void draw() {
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
      colorsNum = 4; // Green
      break;
    case 3:
    case 4:
    case 8:
      colorsNum = 5; // Blue
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
      colorsNum = 1; // Red
      break;
    case 16:
    case 21:
    case 22:
      colorsNum = 0; // White
      break;
  }
  
  println(colorsNum + " " + i); // Print to test switch case
}