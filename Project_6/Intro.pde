class Intro
{
  int counter;
  boolean lightMissing;
  boolean conditionMet;
  int[] orbXY;
  int player;
  int IntroX;
  float CenterX;
  Button intro_1;
  Button c_1x1;
  float orbX, orbY, orbR;
  Paddle paddle;
  int paddle_Y;
  int paddle_H;
  int paddle_X;
  color pColor;
  Ball pball;
  float strokeFadeEase = 255;
  int flash = 0;
  boolean flashRed=false, flashGreen=false;
  int trainingCounter = 0;
  int textFade = 255;
  int textFade2 = 0;
  int trainingCounter2 = 0;
  boolean hitTillZero = false;
  float progress;
  float orbSize = orbStartSize;
  boolean levelUp = false;
  float temp_orbSize, temp_paddle_H, orbShadow_Size;
  
  color getColor(){
   return pColor; 
  }
  void flashGreen(){
        noStroke();
        strokeFadeEase += (0 - strokeFadeEase) * .20;  
        fill(42, 168, 40, strokeFadeEase);
        rect(0, 0, width/2, height); 
  }
  void update()
  {
    if(player == 1)
    {
      lightMissing = missingLight_L;
      orbXY = webcam.brightestXY_Left(); 
      orbX = orb1_X;
      orbY = orb1_Y;
      orbR = orb1_Size - 100;
      c_1x1 = p1_1x1;
      intro_1 = p1_intro1;
      paddle = paddle1;
      paddle_Y = paddle1_Y;   
      paddle_H = paddle1_H;

    }
    else if(player == 2)
    {
      lightMissing = missingLight_R;
      orbXY = webcam.brightestXY_Right(); 
       orbX = orb2_X;
       orbY = orb2_Y;
       orbR = orb2_Size - 100;
      c_1x1 = p2_1x1;
      intro_1 = p2_intro1;
      paddle = paddle2;
      paddle_Y = paddle2_Y;   
      paddle_H = paddle2_H;
    }
  }
  
 Intro(int PlayerNumber)
 {
  if(PlayerNumber == 1)
   {
     counter = 0;
     player = 1;
     IntroX = 0;
     CenterX = IntroX + (width/4);
     intro_1 = p1_intro1;
      paddle = paddle1;
      paddle_X = paddle1_X;
      paddle_Y = paddle1_Y;   
      paddle_H = paddle1_H;
     pball = new Ball(paddle.getW(), paddle.getH(),1);
   }
  else if(PlayerNumber == 2)
   {
     counter = 0;
     player = 2;
     IntroX = width/2;
     CenterX = IntroX + (width/4);
      intro_1 = p2_intro1;
      paddle = paddle2;
      paddle_X = paddle2_X;
      paddle_Y = paddle2_Y;   
      paddle_H = paddle2_H;
     pball = new Ball(paddle.getW(), paddle.getH(),2);
   } 
 }

 void display()
 {
   rectMode(CENTER);
   textAlign(CENTER);
   if(counter == 0)
   {TitleScreen();}
   else if(counter == 1)
   {Intro_1();}
   else if(counter == 2)
   {Intro_2();}
   else if(counter == 3)
   {Intro_3();}
   else if(counter == 4)
   {Intro_4();}
   else if(counter == 5)
   {Intro_5();}
   rectMode(CORNER);
   textAlign(CORNER);
 } 
 
  void noLightDisplay()
 {
  textSize(200);
  text("?", IntroX+(width/4), height/2);
  textSize(30);
 }
 
 void TitleScreen()
 {
   update();
   rect(CenterX, height/2, 50, 100);
   textSize(30);
   text("Point your iPhone flash at the camera to begin!", IntroX+(width/4), height - 100,500,1000);
   if(lightMissing == false)
   {
     counter=1;   
     conditionMet=false;
   }
 }
 
 void Intro_1()
 {
   update();
   if(lightMissing == true)
   {
     counter=0;
     return;
   }
   
   rect(CenterX, height/2-170, 200,300);
   text("Step Away until your head can fit here", CenterX, height/2+200, 300,300);
   ellipse(orbX, orbY, orbR, orbR);
   if(intro_1.circleDisplay(orbX, orbY, orbR) == true)
   {
     counter=2;
     conditionMet = false;
   }
   text("Hover to continue", CenterX, height-50, 200,200);
 }
 
 void Intro_2()
 {
   update();
   ellipse(orbX, orbY, orbR, orbR);
   text("Select a color", CenterX, height-50, 200, 200);
   if(lightMissing == true)
   { 
     noLightDisplay();
   }
   else
   {
     if(c_1x1.circleDisplay(orbX, orbY, orbR) == true)
     {
       if(player ==1)
       {
       p1_color = p1_1x1.getColor();
       }
       else if(player == 2)
       {
         p2_color = p2_1x1.getColor();
       }
       counter=3;
       pColor = p1_1x1.getColor();
     }
   }
 }
 
 void Intro_3()
 {
   update();
   if(lightMissing == true)
   {
     noLightDisplay();
   }
   else
   {
     for(int i=0; i<3; i++)
     {
       fill(40,150);
       ellipse(((width/2-100)*(1+i))/3 +IntroX, height-50, 50, 50);
     }
     for(int i=0; i<trainingCounter; i++)
     {
       fill(42, 168, 40, textFade);
       ellipse(((width/2-100)*(1+i))/3 +IntroX, height-50, 50, 50);
     }
     rectMode(CORNER);
     paddle_Y = constrain(round(orbY), paddle_H/2, height-(paddle_H/2));   
     fill(pColor);
     paddle.drawPaddle(paddle_Y); 
     paddle.setH(paddle_H);
     ellipse(orbX, orbY, orbStartSize, orbStartSize);
     pball.display();
     fill(0,0);
       if(pball.getFlash() == true)
       {
        --trainingCounter;
        if(trainingCounter < 0)
        {
          trainingCounter = 0;
        }
        flash = 100;
        pball.resetFlash();
        flashRed = true;
        flashGreen = false;
       }
       if(pball.getPaddleFlash() == true)
       {
        ++trainingCounter;
         flash = 100;
         pball.resetPaddleFlash();
         flashGreen = true;
         flashRed = false;
         if(trainingCounter > 3)
        {
          trainingCounter = 3;
        }
       }
       if(flashRed == true)
       {
        fill(254, 46, 46, flash);
       }
       if(flashGreen == true)
       {
        fill(42, 168, 40, flash);
       }
        flash += (0 - flash) * .20;  
        
        rect(IntroX, 0, width/2, height);
        
      if (pball.getX() < width/4)
      { 
        pball.updatePaddle(paddle_Y, paddle_X, paddle_H);
      } else if (pball.getX() > width - (width/4))
      {
        pball.updatePaddle(paddle_Y, paddle_X, paddle_H);
      }
     
     if(trainingCounter == 3)
     {
       textFade -= 40;
     }
     fill(255,255,255,textFade);
     rectMode(CENTER);
     text("Use your Orb to control your paddle!", CenterX, height-50, 600, 200);
     text("Don't let the ball escape", CenterX, height-25, 400,200);
     if(textFade < 0)
     {
       counter = 4;
     }
   }
 }
 
 void Intro_4()
 {
   update();
   if(lightMissing == true)
   {
     noLightDisplay();
   }
   else
   {
     textFade += 40; 
     fill(255,255,255,textFade);
     rectMode(CENTER);
     text("Hover your Orb over the ball ", CenterX, height-50, 600, 200);
     text("to level up your paddle!", CenterX, height-25, 400,200);
     for(int i=0; i<3; i++)
     {
       fill(40,150);
       ellipse(((width/2-100)*(1+i))/3 +IntroX, height-50, 50, 50);
     }
     for(int i=0; i<3; i++)
     {
       //fill(42, 168, 40, 250);
       //ellipse(((width/2-100)*(1+i))/3, height-50, 50, 50);
     }
     fill(42, 168, 40, 250);
     if(trainingCounter2==0)
     {
          arc(((width/2-100)*(1+0))/3 +IntroX, height-50, 50, 50, PI*3/2, PI*3/2+progress, PIE);
     }
     else if(trainingCounter2 == 1)
     {
          ellipse(((width/2-100)*(1+0))/3 +IntroX, height-50, 50, 50);
          arc(((width/2-100)*(1+1))/3 +IntroX, height-50, 50, 50, PI*3/2, PI*3/2+progress, PIE);
     }
     else if(trainingCounter2 == 2)
     {
          ellipse(((width/2-100)*(1+0))/3 +IntroX, height-50, 50, 50);
          ellipse(((width/2-100)*(1+1))/3 +IntroX, height-50, 50, 50);  
          arc(((width/2-100)*(1+2))/3 +IntroX, height-50, 50, 50, PI*3/2, PI*3/2+progress, PIE);
     }


         

     rectMode(CORNER);
     paddle_Y = constrain(round(orbY), paddle_H/2, height-(paddle_H/2));   
     fill(pColor);
     paddle.drawPaddle(paddle_Y); 
     ellipse(orbX, orbY, orbSize, orbSize);
     arc(orbX, orbY, orbSize, orbSize, PI*3/2, PI*3/2+progress, PIE);
     if ( coverBall(orbX, orbY, orbSize/2, pball.getX(), pball.getY(), pball.getSize()/2) == true && levelUp == false)
      {
        progress += .5;
        if ( progress >= 2*PI )
        {
          levelUp = true;
          progress = 0;
          temp_orbSize = orbSize;
          temp_paddle_H = paddle_H;
          if(player == 1)
          {
            paddle1.setH(round(paddle_H + paddleLengthIncrement*1.5));
            paddle1_H += paddleLengthIncrement*1.5;
          }
          if(player == 2)
          {
            paddle2.setH(round(paddle_H + paddleLengthIncrement*1.5));
            paddle2_H += paddleLengthIncrement*1.5;
          }
          ++trainingCounter2;
        }
      }
     pball.display();


  if(levelUp == true)
      {
        noFill();
        stroke(0, strokeFade);
        ellipse(orbX, orbY, temp_orbSize, temp_orbSize);
        strokeFade -= 255 / changeFrames;

        noStroke();
        strokeFadeEase += (0 - strokeFadeEase) * .20;  
        fill(42, 168, 40, strokeFadeEase);
        rect(IntroX, 0, width/2, height);


        fill(red(pColor),green(pColor), blue(pColor), 128);
        ellipse(orbX, orbY, orbShadow_Size, orbShadow_Size);
        orbShadow_Size -= (orbShadow_Size*2) / changeFrames;
        orbSize +=((orbSize - orbSizeIncrement) - orbSize) * .10;// / changeFrames);
        //paddle_H += ((temp_paddle_H + paddleLengthIncrement*1.5) - paddle_H) * .10;
        iter++;
        stroke(0, 255-strokeFade);
        
        


        ellipse(orbX, orbY, orbSize, orbSize);

        stroke(0);


        if (iter > changeFrames)
        {
          iter = 0;
          levelUp = false;
          orbShadow_Size = orbSize;
          strokeFade = 255;
          strokeFadeEase = 100;
        }
      }
     
       if(pball.getFlash() == true)
       {
         orbSize += orbSizeIncrement;

        flash = 100;
        pball.resetFlash();
        flashRed = true;
        flashGreen = false;
        orbSize = orbStartSize;
       }
       
       fill(0,0);
       if(flashRed == true)
       {
        fill(254, 46, 46, flash);
        if(progress==0)
        {
          --trainingCounter2;
          if(trainingCounter2 < 0)
          {
            trainingCounter2 = 0;
          } 
          progress = 2*PI-.001;
        }
        hitTillZero = true;
       }
       if(hitTillZero == true)
       {
         progress -= .5;
         if(progress <= 0)
         {
           progress = 0;
           hitTillZero = false;
           flashRed = false;
         }
       }
       if(flashGreen == true)
       {
        fill(42, 168, 40, flash);
       }
        flash += (0 - flash) * .20;  
        
        rect(IntroX, 0, width/2, height);
        
      if (pball.getX() < width/4)
      { 
        pball.updatePaddle(paddle_Y, paddle_X, paddle_H);
      } else if (pball.getX() > width - (width/4))
      {
        pball.updatePaddle(paddle_Y, paddle_X, paddle_H);
      }
      
      if(trainingCounter2 == 3)
      {
        counter = 5;
      }
   }
 }
 void Intro_5()
 {
   update();
   if(lightMissing == true)
   {
     noLightDisplay();
   }
   else
   {
     if(player == 1)
     {
      if (player1_start.circleDisplay(orb1_X, orb1_Y, orb1_Size-100) == true)
      {
                  paddle1.setH(paddleStartSize);
                  paddle1_H = paddleStartSize;
                  paddle2.setH(paddleStartSize);
                  paddle2_H = paddleStartSize;
                  targetY_bot = height/2;
                  targetY_top = 0;   
        p1_ready = true;
        if(p2_ready == true)
          {
                  gameStart = true;
                  startScreen= false;
                  resetEndFlow = true;
                  targetY_bot = height/2;
                  targetY_top = 0;   
                  startFlow = false;
                  paddle1.setH(paddleStartSize);
                  paddle1_H += paddleStartSize;
          }
      }
      else 
        {
          p1_ready = true;
        }
      }
     }
     if(player == 2)
     {
      if (player2_start.circleDisplay(orb2_X, orb2_Y, orb2_Size-100) == true)
      {
                  paddle1.setH(paddleStartSize);
                  paddle1_H = paddleStartSize;
                  paddle2.setH(paddleStartSize);
                  paddle2_H = paddleStartSize;
                  targetY_bot = height/2;
                  targetY_top = 0;   
        p2_ready = true;
        if(p1_ready == true)
          {
                  gameStart = true;
                  startScreen= false;
                  resetEndFlow = true;
                  targetY_bot = height/2;
                  targetY_top = 0;   
                  startFlow = false;
                  paddle2.setH(paddleStartSize);
                  paddle2_H += paddleStartSize;
          }
      }
      else 
        {
          p1_ready = true;
        }
      }
  }

 }

