int numImg = 23;  //24 images
PImage[] images = new PImage[numImg]; //New array of PImage


void setup() {
  size(426, 276);
  frameRate(1);
  for(int i = 0; i < images.length; i++){
  images[i]=loadImage(str(i) + ".jpg");
}
}

void draw() {
  float r = random(0, numImg); //Random array index
  int i = int(r);
  PImage img = images[i]; //Image at array index r
  image(img, 0, 0, 426, 276);
}