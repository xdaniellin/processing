class Cloud{
  int x, speed, direction, floatCounter, floatRest, cloudWidth, cloudHeight, tempY;
  PImage cloud, hover;
  float multiplier;
  float yTargetUp, yTargetDown, yCurrentTarget;
  float y, easing;
  float tintValue;
  float lastTime;
  float hoverTint;
  
  public int getX(){
    return this.x;
  }
  public int getY(){
    return round(this.y);
  }
  public int getCloudWidth(){
    return this.cloudWidth;
  }
  public int getCloudHeight(){
    return this.cloudHeight;
  }
  
  Cloud(int xin, int yin, int floatCounterin, String fileName)
    {
    x = xin;
    y = yin;
    floatCounter = floatCounterin;
    cloud = loadImage(fileName);
    multiplier = 1.0;
    //floatCounter = 50;
    easing = 0.03;
    floatRest = 3;
    float rand = random(0,1);
    println(rand);
    yTargetUp = y - floatCounter;
    yTargetDown = y + floatCounter;
    if (rand < 0.5)
    {
      yCurrentTarget = yTargetUp;
    }
    else 
    {
      yCurrentTarget = yTargetDown;
    }
    cloudWidth = round(cloud.width*multiplier);
    cloudHeight = round(cloud.height*multiplier);
    }
  void tintz(float tintValuein)
  {
    tintValue = tintValuein;
  }
  
  void resize(float multiplierin)
    {
    multiplier = multiplierin;
    cloudWidth = round(cloud.width*multiplier);
    cloudHeight = round(cloud.height*multiplier);
    }
  
  void display()
    {
    if (overImage(x, round(y), cloudWidth, cloudHeight) == true) 
    {
      tint(255,255);
      }
      
    image(cloud, x, y, cloud.width*multiplier, cloud.height*multiplier);
 
    if ((millis() - lastTime) > 40) 
    {
    y += (yCurrentTarget - y) * easing;
    lastTime = millis();
    }

    if (abs(yTargetUp - y) < 10)
      {
      yCurrentTarget = yTargetDown;
      }
    if (abs(yTargetDown - y) < 10)
      {
      yCurrentTarget = yTargetUp;
      } 
      
    tint(255,tintValue);

    }
  boolean overImage(int x, int y, int w, int h) 
    {
    if ((mouseX > x) && (mouseX < x+w) && (mouseY > y) && (mouseY < y+h)) 
      {
      return true;
      }   
    else 
      {
      return false;
      }
    }
 
}
//make a cloud given an image.jpeg, random float speed, position
//take an image
//put white blur 
//crop it within cloud border (pimage? mask?)
//take float speed and make it bounce up and down 
//ON HOVER
  //Lights up
  //Border around cloud
  //other clouds transparency
  
//mic input to increase frame rate

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
      String imageName = aniName + "-" + nf(i, 2) + ".gif";
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
