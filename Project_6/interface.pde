boolean targetSwitch = false;
boolean displayText = false;
float targetY_top = 0;
float targetY_bot;
float snapEasing = 0.73;

  //PImage tempFrame = cam.get(); (make it global)
  //image(tempFrame,
  //make new Pgraphics, load image flipped into pgraphics, then save as a pgraphics instead of saving as an image
  
void snapAnimation()
{
  
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
    lastTime = millis();
  }
    
   if ((millis() - lastTime) > 2000) 
    {
       if(saveNow == true)
          {
           saveFrame("Orby-#####.png");
           saveNow = false;
          }
      //Save image
      //Shrink & move
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

class Interface
{
 void intro_1()
 {
   
 } 
 
 void intro_2()
 {
 }
}

//    println(sketchPath(""));

