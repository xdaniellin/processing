class Player{
  int paddleX, paddleY;
  color orb, paddle; 
  int[] orbXY = new int[2];
  float easing = 1;

  
  void setOrbXY(int[] webcamXY)
  {
    orbXY[0] += (webcamXY[0] - orbXY[0]) * easing;
    orbXY[1] += (webcamXY[1] - orbXY[1]) * easing;
  }
  
  int[] orbXY()
  {
    return orbXY;
  }
  
}

class Webcam{
  int skipScanValue = 20;
  int[] brightestXY_Left = new int[2];
  int[] brightestXY_Right = new int[2];
  /*PImage cam;
  
  Player{PImage in)
  {
    cam = in;
  }*/
  
  int[] brightestXY_Left()
  {
    return brightestXY_Left;
  }
  
  int[] brightestXY_Right()
  {
    return brightestXY_Right;
  }
  
  void scanLeft(int x1, int x2, int y1, int y2)
  {
    float brightestValue = 0;
    cam.loadPixels();
    int index = 0;
    for (int y = 0; y < cam.height; y++) 
    {
      for (int x = 0; x < cam.width; x+=skipScanValue) 
      {
        int pixelValue = cam.pixels[index];
        float pixelBrightness = brightness(pixelValue);
        if( x>x2 || x<x1 )
        { 
          pixelBrightness = 0;
        }
        if (pixelBrightness > brightestValue) {
          brightestValue = pixelBrightness;
          brightestXY_Left[1] = y;
          brightestXY_Left[0] = x;
        }
        index+=skipScanValue;
      }
    }
    if(brightestValue < 210)
    {
      missingLight_R = true;
    }
    else
    {
      missingLight_R = false;
    }
  }
  
  
  void scanRight(int x1, int x2, int y1, int y2)
  {
    float brightestValue = 0;
    cam.loadPixels();
    int index = 0;
    for (int y = 0; y < cam.height; y++) 
    {
      for (int x = 0; x < cam.width; x+=skipScanValue) 
      {
        int pixelValue = cam.pixels[index];
        float pixelBrightness = brightness(pixelValue);
        if( x>x2 || x<x1 )
        { 
          pixelBrightness = 0;
        }
        if (pixelBrightness > brightestValue) {
          brightestValue = pixelBrightness;
          brightestXY_Right[1] = y;
          brightestXY_Right[0] = x;

        }
        index+=skipScanValue;
      }
    }
    if(brightestValue < 210)
    {
      missingLight_L = true;
    }
    else
    {
      missingLight_L = false;
    }
  }

}



void camSetup() {
   String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    cam = new Capture(this, cameras[25]); //WINDOWS
    //cam = new Capture(this, cameras[0]); //MAC
    cam.start();
    webcam = new Webcam();
  } 
}

void mirrorVideoDisplay(){
      cam.read();
    
    /*beginShape();
    texture(cam);
    vertex(0, 0, width, 0);
    vertex(width,0,0,0);
    vertex(width,height,0,height);
    vertex(0,height,width,height);
    endShape();*/
     if(pauseRec == false)
      {  
      camFrame.beginDraw();
      
      camFrame.scale(-1.0,1.0);
      camFrame.image(cam, -width,0);
      
      camFrame.endDraw();
      }
    image(camFrame,0,0);   
 
       
}
