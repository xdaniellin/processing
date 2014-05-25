
class Horizon{
  //Fields
  float horizonLeftY, horizonRightY;
  int numLand = 40;
  int[] landColor = new int[numLand];
  float randAlpha = 50;
  int landHeight = (width/2) / numLand + 1;
  int newColor;
  //Methods
  //Constructor
  void display(){
  stroke(#2AA82A);
  strokeWeight(1);  
  noStroke();
    //line(0, horizonLeftY, width, horizonRightY );
    horizonLeftY = map(mouseX, 0, width, height/2 - 100, height/2 + 100);
    horizonRightY = map(abs(width-mouseX), 0, width, height/2 - 100, height/2 + 100);
    /*fill(42,168,42,200);
    quad(0, horizonLeftY,
         width, horizonRightY,
         width, height,
         0, height); */
    for (int i = 0; i<numLand; i++){
      randAlpha = random(0,100);
      //println(randAlpha);
      if (i == numLand-1){
      newColor = landColor[1] += round(random(-10,10));
      if (newColor > 50)
        {newColor = 50;}
      else if (newColor < 0)
        {newColor = 10;}
      landColor[0] = newColor;
        fill(42,168,40,20+landColor[numLand-1-i]);
        quad(0, horizonLeftY + i*landHeight,
             width, horizonRightY + i*landHeight,
             width, horizonRightY + (i+1)*landHeight,
             0, horizonLeftY + (i+1)*landHeight);
      }
      else {
        //println(landColor[i]);
        landColor[numLand-1-i] = landColor[numLand-2-i];
        //fill(42,168,landColor[numLand-i],landColor[numLand-i]);
        fill(42,168,40,155+landColor[numLand-1-i]);
        quad(0, horizonLeftY + i*landHeight,
             width, horizonRightY + i*landHeight,
             width, horizonRightY + (i+1)*landHeight,
             0, horizonLeftY + (i+1)*landHeight);
      }
    }
    fill(158,217,223,200);
    quad(0,0,
         width,0,
         width,horizonRightY,
         0,horizonLeftY);

     /* fill(42,168,randAlpha,randAlpha);
      quad(0, horizonLeftY,
           width, horizonRightY,
           width, height,
           0, height); */
    
  }
}



class Flyer{
  //Fields
  int faceCenterX, faceCenterY;
  int faceWidth = 400;
  int faceHeight = 500;
  int faceLeftX, faceRightX;
  int mouthCenterY, mouthWidth;
  float mouthScale, mouthHeightLeft, mouthHeightRight, mouthCenterX;
  float eyeCenterY;
  float bodyCenterX, bodyCenterX_mapped, bodyCenterY;
  int bg1, bg2, bg3;
  float easing = 0.10; 
  float targetX;
  float eyeWidth = 2;

  //   faceWidth = 400;
  //   faceHeight = 500;
  //Constructor
  Flyer(int tempmouthWidth){
   //setup
   eyeCenterY = height/2.5;
   faceCenterX = width/2;
   faceCenterY = height/2;
   faceLeftX = faceCenterX - faceWidth/2;
   faceRightX = faceCenterX + faceWidth/2;
   mouthCenterX = faceCenterX;
   mouthCenterY = faceCenterY + 150;
   bg1 = 255; bg2 = 255; bg3 = 255;
   bodyCenterY = faceCenterY + 170;
   //construct
   mouthWidth = tempmouthWidth;
  }
        
  float angle = map(mouseX, 0, width, -PI, PI);

          
  //Methods
  void displayBody(){
      rectMode(CENTER);
     //body
        noStroke();
        fill(#000000);
        rect(bodyCenterX_mapped, bodyCenterY,faceWidth+200,faceHeight-200,65);
        bodyCenterX += (targetX - bodyCenterX) * easing;
        //println(abs(targetX - bodyCenterX) * easing);
        bodyCenterX_mapped = map(abs(width-bodyCenterX), 0, width, faceCenterX-25, faceCenterX+25);
        //bodyCenterX_mapped = map(bodyCenterX, 0, width, faceCenterX-25, faceCenterX+25);
        targetX = mouseX;
        //arm  
          //left  
        triangle(bodyCenterX_mapped-(faceWidth+200)/2,bodyCenterY + (200)/2, 
                 bodyCenterX_mapped-400, (bodyCenterY - (faceHeight-200)/2 - 50)+ map(abs(width-bodyCenterX), 0, width, -50,50) + faceControl*30, 
                 bodyCenterX_mapped, bodyCenterY - (faceHeight-200)/2);
          //right
        triangle(bodyCenterX_mapped, bodyCenterY - (faceHeight-200)/2, 
                 bodyCenterX_mapped+400, (bodyCenterY - (faceHeight-200)/2 - 50)- map(abs(width-bodyCenterX), 0, width, -50,50) + faceControl*30, 
                 bodyCenterX_mapped+(faceWidth+200)/2,bodyCenterY + (200)/2);
    }
  void displayHead(){  
  //Head
      fill(#000000);
      stroke(#FFFFFF);
      strokeWeight(12);
      rect(faceCenterX,faceCenterY+faceControl*20,faceWidth,faceHeight,115);
    //Eyes
      //strokeWeight(5+map(faceControl,0,60,0,100));
      eyeWidth = 5+(abs(targetX - bodyCenterX) * (easing/5))*10;
      if (eyeWidth > 60)
      {eyeWidth = 60;}
      println(eyeWidth);
      strokeWeight(eyeWidth);
      stroke(#FFFFFF);
      //left
      line(faceLeftX, eyeCenterY, faceCenterX, eyeCenterY-(abs(targetX - bodyCenterX) * (easing/2)));
      //right
      line(faceCenterX, eyeCenterY-(abs(targetX - bodyCenterX) * (easing/2)), faceRightX, eyeCenterY);
      strokeWeight(5);
    //nose
      fill(#FFFFFF);
      rect(((mouthCenterX - (mouthWidth/2 * mouthScale)) + (mouthCenterX + (mouthWidth/2 * mouthScale))) / 2, 
            faceCenterY-50 ,faceWidth/5, faceHeight/2 - faceControl*50,5);
      line(((mouthCenterX - (mouthWidth/2 * mouthScale)) + (mouthCenterX + (mouthWidth/2 * mouthScale))) / 2,
            faceCenterY-50, ((mouthCenterX - (mouthWidth/2 * mouthScale)) + (mouthCenterX + (mouthWidth/2 * mouthScale))) / 2, ((mouthCenterY + ((mouthHeightLeft/2 * mouthScale)) + (mouthCenterY - (mouthHeightRight/2 * mouthScale)))/2));

    //mouth
    strokeCap(SQUARE);
    fill(#FFFFFF);
    quad(mouthCenterX - (mouthWidth/2 * mouthScale), mouthCenterY + (mouthHeightLeft/2 * mouthScale),
         mouthCenterX + (mouthWidth/2 * mouthScale), mouthCenterY + (mouthHeightRight/2 * mouthScale),
         mouthCenterX + (mouthWidth/2 * mouthScale), mouthCenterY - (mouthHeightRight/2 * mouthScale),
         mouthCenterX - (mouthWidth/2 * mouthScale), mouthCenterY - (mouthHeightLeft/2 * mouthScale));
    mouthScale = map(abs(width/2-mouseX), 0,width,1,1.5)  + faceControl/5;
    mouthHeightLeft = 40 - map((width-mouseX), 0,width,0,30);
    mouthHeightRight = 40- map(mouseX, 0,width,0,30);
    mouthCenterX = faceCenterX + map(mouseX, 0,width,-30,30);
  }
}  

  //flyer = new Flyer(int tempfaceWidth,
      //int tempfaceHeight, int tempmouthWidth, 
      //float eyeCenterY);
