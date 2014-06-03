boolean targetSwitch = false;
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
