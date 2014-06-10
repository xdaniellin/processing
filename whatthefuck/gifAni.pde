class Ani {

  PImage[] images;  // Image array
  int frameCounter = 0;
  int x;
  int y;
  int imageWidth;
  int imageHeight;
  int currentFrame;
  int lastTime;
  int milli;
  float multiplier;

  Ani(int xin, int yin, String aniName, int numFrames) {
    x = xin;
    y = yin;
    images = new PImage[numFrames];
    for (int i = 0; i < images.length; i++) {
      String imageName = aniName + "-" + nf(i, 2) + ".png";
      images[i] = loadImage(imageName);  // Load each image
    }
    imageWidth = images[0].width;
    imageHeight = images[0].height;
  }
  
  void resize(float multiplierin)
    {
    multiplier = multiplierin;
    imageWidth = round(imageWidth*multiplier);
    imageHeight = round(imageHeight*multiplier);
    }
  
  void display(int milliIn){
    milli=milliIn;
    currentFrame = frameCounter % images.length;  
    if ((millis() - lastTime) > milli) 
    {
    frameCounter++;
    lastTime = millis();
    }
  image(images[currentFrame], x, y,imageWidth,imageHeight);
  }

  void displayHover() {
    // If the mouse is over the animation, play it
    if (overImage(x, y, imageWidth, imageHeight) == true) {
      currentFrame = frameCounter % images.length;  
      frameCounter++;
    }
    image(images[currentFrame], x, y);
  }

  boolean overImage(int x, int y, int w, int h) {
    if ((mouseX > x) && (mouseX < x+w) && (mouseY > y) && (mouseY < y+h)) {
      return true;
    } 
    else {
      return false;
    }
  }
}
