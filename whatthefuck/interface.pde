boolean targetSwitch = false;
boolean displayText = false;
boolean snap = false;
boolean waiting = false;
boolean waiting2 = true;
boolean waiting3 = true;
boolean readyScreen = false;
boolean firstAni = true;
boolean secondAni = false;
float targetY_top = 0;
float targetY_bot;
float snapEasing = .8;
float saveImg_width, saveImg_height;
float saveEasing = .4;
float targetW, targetH, imgX, imgY, targetX, targetY;
int count = 0;
float lastTime_save;


  //PImage tempFrame = cam.get(); (make it global)
  //image(tempFrame,
  //make new Pgraphics, load image flipped into pgraphics, then save as a pgraphics instead of saving as an image


  

  
void snapAnimation()
{

  if(waiting==true)
  {
   if ((millis() - lastTime) > 1400) 
    {
      saveNow = true;
      waiting = false;
    }
  }
    if(saveNow == true)
    {
      saveImg = createGraphics(width, height);

      saveImg.beginDraw();
      saveImg.image(camFrame,0,0);   

  //    saveNow = false;
    }
    
        
  if( ((0 - snapY_top) * snapEasing) < 0.05)
  {
    pauseRec = true;   
    targetSwitch = true;
    displayCourt = false;
    displayText = true;
  }

  if (displayText == true)
  {
    textSize(50);
    textAlign(CENTER);
    if(p1_win == true)
    {
      text("Winner!", width/4, height/2+250);
      text("Loser", width*3/4, height/2+250);
    }
    else if(p2_win == true)
    {
      text("Winner!", width*3/4, height/2+250);
      text("Loser", width/4, height/2+250);
    }
    textSize(20);
    text("Logo_here", 65, 25);

    
    
    if(waiting2 == true)
    {
    lastTime = millis();
    waiting = true;
    waiting2 = false;
    }
  }
  if(saveNow == true)
  {
    saveImg.textSize(50);
    saveImg.textAlign(CENTER);
    if(p1_win == true)
    {
      saveImg.text("Winner!", width/4, height/2+250);
      saveImg.text("Loser", width*3/4, height/2+250);
    }
    else if(p2_win == true)
    {
      saveImg.text("Winner!", width*3/4, height/2+250);
      saveImg.text("Loser", width/4, height/2+250);
    }
    saveImg.textSize(20);
    saveImg.text("Logo_here", 65, 25);
    saveImg.endDraw();
    saveFrame("Orby-" + nf(count,3) +".tif");
    count++;
    saveNow = false;
    snap = false;
    saveAni = true;
    pauseRec = false;
    displayText = false;
    firstAni = true;
  }
  
  fill(255,255,255);
  if(targetSwitch == true)
  {
    targetY_bot = height;
    targetY_top = -height/2;
  }
  snapY_bot += (targetY_bot - snapY_bot) * snapEasing;
  snapY_top += (targetY_top - snapY_top) * snapEasing;
  rect(0,snapY_bot,width,height/2);
  rect(0,snapY_top,width,height/2);
}


void saveAnimation()
{
  imageMode(CENTER);
  image(saveImg,imgX,imgY,saveImg_width, saveImg_height);
  if(firstAni == true)
  {
    println("entering firstAni");
    displayCourt = true;
    startScreen = true;
    targetW = saveImg_width * .7;
    targetH = saveImg_height * .7;
    targetX = imgX;
    targetY = imgY;
    lastTime_save = millis();
    waiting3 = true;
    firstAni = false;
  }
  saveImg_width+= (targetW - saveImg_width) * saveEasing;
  saveImg_height+= (targetH - saveImg_height) * saveEasing;
  imgX += (targetX - imgX) * saveEasing;
  imgY += (targetY - imgY) * saveEasing;
  
 if(waiting3 == true)
 {
   println("entering waiting3");
    if( (millis()-lastTime_save) > 800)
    {
         println("this is fucking triggering?");
      secondAni = true;
      waiting3 = false;
    }
 }
  
  if(secondAni == true)
  {
    println("secondAni");
    targetW = saveImg_width* .05;
    targetH = saveImg_height * .05;
    targetX = width - (targetW/2) - 10;
    targetY = height - (targetH/2) - 10;
    secondAni = false;
    strokeFadeEase = 255;
    readyScreen = true;
    resetEndFlow = true;
  }
  
  
  
  imageMode(CORNER);
}


class Button
{
   int buttonX;
   int buttonY;
   int buttonWidth;
   int buttonLength;
   float hoverIncrement = .60;
   float circleR;
   float saved_circleR;
   float activateProgress;
   color defaultColor = 255;
   color selectedColor, hoverColor, activateColor, returnColor;
   float buttonEasing = 0.35;
   boolean circleAni = false;
   float tempCircleR;
   float tempFill = 0;
   
   //rect Button
   Button(int X, int Y, int W, int L, color defaultC, color hoverC, color activateC)
   {
    buttonX = X;
   buttonY = Y; 
   buttonWidth = W;
   buttonLength = L;
   defaultColor = defaultC;
   hoverColor = hoverC;
   activateColor = activateC;
   }
  
  Button(int X, int Y, float radius)
  {
   buttonX = X;
   buttonY = Y;
   circleR = radius;
      saved_circleR = radius;

   tempCircleR = circleR;
  }

  Button(int X, int Y, float radius, color defaultC)
  {
   buttonX = X;
   buttonY = Y;
   circleR = radius;
   saved_circleR = radius;
   defaultColor = defaultC;
   selectedColor = defaultColor;
   tempCircleR = circleR;
   returnColor = color(red(defaultC), green(defaultC), blue(defaultC));
  }  

  Button(int X, int Y, float radius, color defaultC, color selectedC)
  {
   buttonX = X;
   buttonY = Y;
   circleR = radius;
      saved_circleR = radius;

   defaultColor = defaultC;
   selectedColor = selectedC;
  }
  
  boolean rectDisplay(float cursorX, float cursorY, float cursorR)
  {
    fill(defaultColor);
    rectMode(CENTER);
    rect(buttonX, buttonY, buttonWidth, buttonLength, 7);
    rectMode(CORNER);
    fill(activateColor);
    rect(buttonX-buttonWidth/2, buttonY-buttonLength/2, buttonWidth*activateProgress , buttonLength);
    if(rectCircleIntersect(buttonX, buttonY, buttonWidth, buttonLength, cursorX, cursorY, cursorR)==true)
    {
      activateProgress += .05;
    }
    else 
    {
      activateProgress -= .10;
      if(activateProgress < 0)
      {
        activateProgress = 0;
      }
    }
    if(activateProgress>=1)
    {
      activateProgress=1;
      return true;
    }
    else 
    {
      return false;
    }
  }
  
  
  boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {
 
  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);
 
  if (circleDistanceX > (rw/2 + cr)) { return false; }
  if (circleDistanceY > (rh/2 + cr)) { return false; }
  if (circleDistanceX <= rw/2) { return true; }
  if (circleDistanceY <= rh/2) { return true; }
 
  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
}

  boolean circleDisplay(float cursorX, float cursorY, float cursorR)
  {
    fill(defaultColor);
    stroke(0);
    strokeWeight(2);
    if(circleAni==true)
    {
      noStroke();
    }
    ellipse(buttonX, buttonY, circleR, circleR);
    fill(selectedColor);
    arc(buttonX, buttonY, circleR, circleR, PI*3/2, PI*3/2+activateProgress, PIE);
    if (coverBall(cursorX, cursorY, cursorR/2,buttonX, buttonY, circleR/4) == true)
    {
      activateProgress += hoverIncrement;
    }
    else 
    {
      activateProgress = 0;
    }
      if( activateProgress >= 2*PI )
       { 
         circleAni = true; 
       }
       if( circleAni == true)
       {
         circleR += (0 - circleR) * buttonEasing;
         tempFill += 15;
         fill(255,tempFill);
         stroke(0);
         strokeWeight(2);
         ellipse(buttonX, buttonY, tempCircleR, tempCircleR);
         activateProgress = 0;
         
         if(circleR < 4)
         {
           circleR = saved_circleR;
           circleAni = false;
           return true;
         }
         else
         {
           return false;
         }

       }
       else return false;
  }

boolean coverBall(float cx1, float cy1, float cr1, float cx2, float cy2, float cr2) {
  if (dist(cx1, cy1, cx2, cy2) < cr1 + cr2) {
      return true;
    } 
    else
    {
      return false;
    }
  }
 color getColor()
 {
   return returnColor;
 }
}

//    println(sketchPath(""));

