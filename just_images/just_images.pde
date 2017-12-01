int numImg = 23;  // 24 images
PImage[] images = new PImage[numImg]; // New array of PImage

void setup() {
  size(426, 276); // Base proportions are 142:92
  frameRate(0.2); // 5 seconds per image
  
  // Load in each image
  for(int i = 0; i < images.length; i++){
  images[i] = loadImage(str(i) + ".jpg");
  }
}

void draw() {
  float r = random(0, numImg); // Random array index
  int i = int(r);
  PImage img = images[i]; // Image at array index r
  image(img, 0, 0, 426, 276);
}