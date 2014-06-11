
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
  Button c_1x1, c_1x2, c_2x1, c_2x2, c_3x1, c_3x2;
  float orbX, orbY, orbR;
  Paddle paddle;
  int paddle_Y;
  int paddle_H;
  int paddle_X;
  boolean readyTrigger;
  color pColor, sColor;
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
  float transparentLevel = 50;
  Ani iphone;
  PImage faceOn, faceOff;
  boolean transition_counter2 = false;


  color getColor() {
    return pColor;
  }
  void flashGreen() {
    noStroke();
    strokeFadeEase += (0 - strokeFadeEase) * .20;  
    fill(42, 168, 40, strokeFadeEase);
    rect(0, 0, width/2, height);
  }
  void update()
  {
    if (player == 1)
    {
      lightMissing = missingLight_L;
      orbXY = webcam.brightestXY_Left(); 
      orbX = orb1_X;
      orbY = orb1_Y;
      orbR = orb1_Size - 100;
      paddle = paddle1;
      paddle_Y = constrain(round(orb1_Y), paddle1_H/2+10, height-85-75-10-(paddle1_H/2));   

      paddle_H = paddle1_H;
      c_1x1 = p1_1x1;
      c_1x2 = p1_1x2;
      c_2x1 = p1_2x1;
      c_2x2 = p1_2x2;
      c_3x1 = p1_3x1;
      c_3x2 = p1_3x2; 
    } else if (player == 2)
    {
      lightMissing = missingLight_R;
      orbXY = webcam.brightestXY_Right(); 
      orbX = orb2_X;
      orbY = orb2_Y;
      orbR = orb2_Size - 100;
      paddle = paddle2;
      paddle_Y = constrain(round(orb2_Y), paddle2_H/2+10, height-85-75-10-(paddle2_H/2));   
      paddle_H = paddle2_H;
      c_1x1 = p2_1x1;
      c_1x2 = p2_1x2;
      c_2x1 = p2_2x1;
      c_2x2 = p2_2x2;
      c_3x1 = p2_3x1;
      c_3x2 = p2_3x2; 
    }
  }

  Intro(int PlayerNumber)
  {
    if (PlayerNumber == 1)
    {
      counter = 0;
      player = 1;
      IntroX = 0;
      CenterX = IntroX + (width/4);
      //intro_1 = p1_intro1;
      paddle = paddle1;
      paddle_X = paddle1_X;
      paddle_Y = paddle1_Y;
   
      paddle_H = paddle1_H;

      pball = new Ball(paddle.getW(), paddle.getH(), 1);


      
    } else if (PlayerNumber == 2)
    {
      counter = 0;
      player = 2;
      IntroX = width/2;
      CenterX = IntroX + (width/4);
      //intro_1 = p2_intro1;
      paddle = paddle2;
      paddle_X = paddle2_X;
      paddle_Y = paddle2_Y;   
      paddle_H = paddle2_H;
      pball = new Ball(paddle.getW(), paddle.getH(), 2);

    } 
    intro_1 = new Button(round(CenterX), height-85, width/2-20, 150, color(0, 0, 0, 128), color(#93dbda), color(42, 168, 40, 250));
    iphone = new Ani(round(CenterX)-100, height/2-250, "iphone", 2);
    faceOn = loadImage("faceOn.png");
    faceOff = loadImage("faceOff.png");
  }

void setCounter(int in)
{
 counter = in; 
}
  void display()
  {
    rectMode(CENTER);
    textAlign(CENTER);
    if (counter == 0)
    {
      TitleScreen();
    } else if (counter == 1)
    {
      Intro_1();
    } else if (counter == 2)
    {
      Intro_2();
    } else if (counter == 3)
    {
      Intro_3();
    } else if (counter == 4)
    {
      Intro_4();
    } else if (counter == 5)
    {
      Intro_5();
    }
    rectMode(CORNER);
    textAlign(CORNER);
  } 

  void noLightDisplay()
  {
          fill(255, 204, 0, 128);
    textSize(160);
    iphone.display(200);

    text("?", IntroX+(width/4-20), height/2+60);
    textSize(30);
  }

  void TitleScreen()
  {
    update();
    iphone.display(200);
    textSize(30);
    rectMode(CENTER);
    fill(0, 128);
    stroke(0);
    strokeWeight(3);
    rect(CenterX, height-85, width/2-20, 150, 7);
    fill(255);
    text("Turn your iPhone flash on to begin!", CenterX, height-50, 800, 100);
    if (lightMissing == false)
    {
      counter=1;   
      conditionMet=false;
    }
  }

  float facetime= 0;
  void Intro_1()
  {
    update();
    if (lightMissing == true)
    {
      counter=0;
      return;
    }
    imageMode(CENTER);
    image(faceOff, CenterX, height/2-50);
    tint(255, map( sin(facetime), -1, 1, 30, 300));
    facetime+= .18;
    image(faceOn, CenterX, height/2-50);   

    //constrain( sin(second()); ,0,255);
    tint(255, 255);
    imageMode(CORNER);



    if (transition_counter2 == true)
    {
      rectMode(CENTER);
      fill(0, 128);
      stroke(0);
      strokeWeight(3);
      rect(CenterX, height-85, width/2-20, 150, 7);
      stroke(111, 204, 101, textFade);
      fill(111, 204, 101, textFade);
      rect(CenterX, height-85, width/2-20, 150);

      textFade -= 40;
      if (textFade <= -80)
      {
        counter=2;
        strokeWeight(2);
      }
    } else
    {
      stroke(255, 204, 0, 128);

      strokeWeight(map( sin(facetime*1.5), -1, 1, 1, 7));
      if (intro_1.rectDisplay(orbX, orbY, orbR) == true)
      {
        transition_counter2 = true;
      }
    }
    rectMode(CENTER);

    fill(255);
    if (transition_counter2 == true)
    {
      fill(111, 204, 101, textFade/2);
    }

    text("Step away until your head fits as shown", CenterX, height/2+380, 600, 300);
    textSize(26);
    fill(255, 204, 0, 255);
    if (transition_counter2 == true)
    {
      fill(111, 204, 101, textFade/2);
    }
    text("Hover over me to CONTINUE", CenterX, height-30, 500, 100);
    textSize(30);
    stroke(0);
    strokeWeight(2);
    fill(255);
    fill(255, 204, 0, 128);
    stroke(0);
    ellipse(orbX, orbY, orbR, orbR);
    fill(255);
  }
  void Intro_2()
  {
    transition_counter2= false;
    textFade = 250;
    update();
    rectMode(CENTER);
    fill(0, 128);
    stroke(0);
    strokeWeight(3);
    rect(CenterX, height-85, width/2-20, 150, 7);
    fill(255);
    text("Select a color", CenterX, height-50, 500, 100);
    if (lightMissing == true)
    { 
      noLightDisplay();
    } else
    {
          fill(255, 204, 0, 128);

          ellipse(orbX, orbY, orbR, orbR);
    fill(255);

      if (c_1x1.circleDisplay(orbX, orbY, orbR) == true)
      {
        if (player ==1)
        {
          p1_color = p1_1x1.getColor();
          p1_colorSupplement = p1_1x1.getS();
        } else if (player == 2)
        {
          p2_color = p2_1x1.getColor();
          p2_colorSupplement = p2_1x1.getS();
        }
        counter=3;
        pColor = p1_1x1.getColor();
        sColor = p1_1x1.getS();
      }
      else if (c_1x2.circleDisplay(orbX, orbY, orbR) == true)
      {
        if (player ==1)
        {
          p1_color = p1_1x2.getColor();
          p1_colorSupplement = p1_1x2.getS();
        } else if (player == 2)
        {
          p2_color = p2_1x2.getColor();
          p2_colorSupplement = p2_1x2.getS();
        }
        counter=3;
        pColor = p1_1x2.getColor();
        sColor = p1_1x2.getS();
      }
      else if (c_2x1.circleDisplay(orbX, orbY, orbR) == true)
      {
        if (player ==1)
        {
          p1_color = p1_2x1.getColor();
          p1_colorSupplement = p1_2x1.getS();
        } else if (player == 2)
        {
          p2_color = p2_2x1.getColor();
          p2_colorSupplement = p2_2x1.getS();
        }
        counter=3;
        pColor = p1_2x1.getColor();
        sColor = p1_2x1.getS();
      }
      else if (c_2x2.circleDisplay(orbX, orbY, orbR) == true)
      {
        if (player ==1)
        {
          p1_color = p1_2x2.getColor();
          p1_colorSupplement = p1_2x2.getS();
        } else if (player == 2)
        {
          p2_color = p2_2x2.getColor();
          p2_colorSupplement = p2_2x2.getS();
        }
        counter=3;
        pColor = p1_2x2.getColor();
        sColor = p1_2x2.getS();
      }
      else if (c_3x1.circleDisplay(orbX, orbY, orbR) == true)
      {
        if (player ==1)
        {
          p1_color = p1_3x1.getColor();
          p1_colorSupplement = p1_3x1.getS();
        } else if (player == 2)
        {
          p2_color = p2_3x1.getColor();
          p2_colorSupplement = p2_3x1.getS();
        }
        counter=3;
        pColor = p1_3x1.getColor();
        sColor = p1_3x1.getS();
      }
      else if (c_3x2.circleDisplay(orbX, orbY, orbR) == true)
      {
        if (player ==1)
        {
          p1_color = p1_3x2.getColor();
          p1_colorSupplement = p1_3x2.getS();
        } else if (player == 2)
        {
          p2_color = p2_3x2.getColor();
          p2_colorSupplement = p2_3x2.getS();
        }
        counter=3;
        pColor = p1_3x2.getColor();
        sColor = p1_3x2.getS();
      }
      if(player == 1)
      {
          player1_start = new Button(width/4, height/2, 250, color(red(p1_color), green(p1_color), blue(p1_color), 128), color(42, 168, 40, 250),1);
      }
      else if (player == 2)
      {

          player2_start = new Button(width*3/4, height/2, 250, color(red(p2_color), green(p2_color), blue(p2_color), 128), color(42, 168, 40, 250),1);
      }
    }
  }

  void Intro_3()
  {     
      rectMode(CORNER);
      noStroke();
    fill(sColor,40);
    rect(IntroX,0,width/2,height);
    
    stroke(0);
    strokeWeight(3);
      rectMode(CENTER);
      fill(0, 128);
      rect(CenterX, height-85, width/2-20, 150, 7);
      fill(0, 128);
      fill(255, 255, 255, textFade);
      text("Use your Orb to control your paddle!", CenterX, height-50, 600, 200);
      text("Don't let the ball escape", CenterX, height-15, 400, 200);
for (int i=0; i<3; i++)
      {
        fill(180, 150);
        ellipse(((width/2-100)*(1+1+i))/5 +IntroX , height-50, 50, 50);
      }
      for (int i=0; i<trainingCounter; i++)
      {
        fill(42, 168, 40, textFade);
        ellipse(((width/2-100)*(1+i+1))/5 +IntroX, height-50, 50, 50);
      }
    update();
    if (lightMissing == true)
    {
      noLightDisplay();
    } else
    {

      fill(255);
      stroke(0);
      
      rectMode(CORNER);
      for (int i = 0; i<=20; i++) 
      {
        float x = lerp(orbX, paddle.getX()+10, i/20.0);
        float y = lerp(orbY, paddle_Y, i/20.0);
        stroke(pColor);
        strokeWeight(4);
        point(x, y);
        strokeWeight(2);
      }
      stroke(0);
      fill(pColor);
      paddle.drawPaddle(paddle_Y); 
      paddle.setH(paddle_H);
      fill(pColor, transparentLevel);
      ellipse(orbX, orbY, orbStartSize, orbStartSize);

      pball.display();
      fill(0, 0);
      if (pball.getFlash() == true)
      {
        --trainingCounter;
        if (trainingCounter  < 0)
        {
          trainingCounter = 0;
        }
        flash = 100;
        pball.resetFlash();
        flashRed = true;
        flashGreen = false;
      }
      if (pball.getPaddleFlash() == true)
      {
        ++trainingCounter;
        flash = 100;
        pball.resetPaddleFlash();
        flashGreen = true;
        flashRed = false;
        if (trainingCounter > 3)
        {
          trainingCounter = 3;
        }
      }
      if (flashRed == true)
      {
        fill(254, 46, 46, flash);
      }
      if (flashGreen == true)
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

      if (trainingCounter == 3)
      {
        textFade -= 40;
      }
      rectMode(CENTER);

      if (textFade < 0)
      {
        counter = 4;
      }
    }
  }

  void Intro_4()
  {
      rectMode(CORNER);
      noStroke();
    fill(sColor,40);
    rect(IntroX,0,width/2,height);
    
          stroke(0);
    strokeWeight(3);
      rectMode(CENTER);
      fill(0, 128);
      rect(CenterX, height-85, width/2-20, 150, 7);

      textFade += 40; 
      fill(255, 255, 255, textFade);
      text("Hover your Orb over the ball ", CenterX, height-50, 600, 200);
      text("to level up your paddle!", CenterX, height-15, 400, 200);
      stroke(0);


    update();
    if (lightMissing == true)
    {
      noLightDisplay();
    } else
    {

      for (int i=0; i<3; i++)
      {
        fill(40, 150);
        ellipse(((width/2-100)*(1+1+i))/5 +IntroX , height-50, 50, 50);
      }
      for (int i=0; i<3; i++)
      {
        //fill(42, 168, 40, 250);
        //ellipse(((width/2-100)*(1+i))/3, height-50, 50, 50);
      }
      fill(42, 168, 40, 250);
      stroke(0);
      if (trainingCounter2==0)
      {
        arc(((width/2-100)*(1+1+0))/5 +IntroX , height-50, 50, 50, PI*3/2, PI*3/2+progress, PIE);
      } else if (trainingCounter2 == 1)
      {
        ellipse(((width/2-100)*(1+1+0))/5 +IntroX , height-50, 50, 50);
        arc(((width/2-100)*(1+1+1))/5 +IntroX , height-50, 50, 50, PI*3/2, PI*3/2+progress, PIE);
      } else if (trainingCounter2 == 2)
      {
        ellipse(((width/2-100)*(1+1+0))/5 +IntroX , height-50, 50, 50);
        ellipse(((width/2-100)*(1+1+1))/5 +IntroX , height-50, 50, 50);  
        arc(((width/2-100)*(1+1+2))/5 +IntroX , height-50, 50, 50, PI*3/2, PI*3/2+progress, PIE);
      }


stroke(0);

      rectMode(CORNER);
      paddle_Y = constrain(round(orbY), paddle_H/2, height-85-75-(paddle_H/2));   
      fill(pColor);
      for (int i = 0; i<=20; i++) 
      {
        float x = lerp(orbX, paddle.getX()+10, i/20.0);
        float y = lerp(orbY, paddle_Y, i/20.0);
        stroke(pColor,200);
        strokeWeight(4);
        point(x, y);
        strokeWeight(2);
      }
      stroke(0);
      paddle.drawPaddle(paddle_Y); 
      fill(pColor, transparentLevel);
      ellipse(orbX, orbY, orbSize, orbSize);
      fill(pColor, transparentLevel*2);
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
          if (player == 1)
          {
            paddle1.setH(round(paddle_H + paddleLengthIncrement*1.5));
            paddle1_H += paddleLengthIncrement*1.5;
          }
          if (player == 2)
          {
            paddle2.setH(round(paddle_H + paddleLengthIncrement*1.5));
            paddle2_H += paddleLengthIncrement*1.5;
          }
          ++trainingCounter2;
        }
      }
      pball.display();


      if (levelUp == true)
      {
        noFill();
        stroke(0, strokeFade);

        ellipse(orbX, orbY, temp_orbSize, temp_orbSize);
        strokeFade -= 255 / changeFrames;

        noStroke();
        strokeFadeEase += (0 - strokeFadeEase) * .20;  
        fill(42, 168, 40, strokeFadeEase);
        rect(IntroX, 0, width/2, height);


        fill(red(pColor), green(pColor), blue(pColor), 128);
        ellipse(orbX, orbY, orbShadow_Size, orbShadow_Size);
        orbShadow_Size -= (orbShadow_Size*2) / changeFrames;
        orbSize +=((orbSize - orbSizeIncrement) - orbSize) * .10;// / changeFrames);
        //paddle_H += ((temp_paddle_H + paddleLengthIncrement*1.5) - paddle_H) * .10;
        iter++;
        stroke(0, 255-strokeFade);



        fill(0,0);
        ellipse(orbX, orbY, orbSize, orbSize);

        stroke(0);
        fill(42, 168, 40, strokeFadeEase);


        if (iter > changeFrames)
        {
          iter = 0;
          levelUp = false;
          orbShadow_Size = orbSize;
          strokeFade = 255;
          strokeFadeEase = 100;
        }
      }

      if (pball.getFlash() == true)
      {
        orbSize += orbSizeIncrement;

        flash = 100;
        pball.resetFlash();
        flashRed = true;
        flashGreen = false;
        orbSize = orbStartSize;
      }

      fill(0, 0);
      if (flashRed == true)
      {
        fill(254, 46, 46, flash);
        if (progress==0)
        {
          --trainingCounter2;
          if (trainingCounter2 < 0)
          {
            trainingCounter2 = 0;
          } 
          progress = 2*PI-.001;
        }
        hitTillZero = true;
      }
      if (hitTillZero == true)
      {
        progress -= .5;
        if (progress <= 0)
        {
          progress = 0;
          hitTillZero = false;
          flashRed = false;
        }
      }
      if (flashGreen == true)
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

      if (trainingCounter2 == 3)
      {
        flashGreen = true;
        flash = 100;
        trainingCounter2 = 4;
      }
      if(trainingCounter2 == 4)
      {
        if(flash <=4)
        {
          counter = 5;
        }
      }
  }
  }
  void Intro_5()
  {


      rectMode(CORNER);
      noStroke();
    fill(sColor,40);
    rect(IntroX,0,width/2,height);
    
    stroke(0);
    strokeWeight(3);
      rectMode(CENTER);
      fill(0, 128);
      rect(CenterX, height-85, width/2-20, 150, 7);
      fill(0, 128);
      fill(255, 255, 255, textFade);
      if(readyTrigger == false)
      {
        text("May the best player win!", CenterX, height/2+380, 600, 300);
        text("Protect your side!", CenterX, height-30, 500, 100);

      }
      else
      {
        text("Waiting for opponent...", CenterX, height-50, 600, 100);
      }
    
    update();
      if(readyTrigger == true)
      {
                textAlign(CENTER,CENTER);
        fill(255,255);
        text("READY", CenterX, height/2, 300,300);
        textAlign(CENTER,TOP);
       fill(42, 168, 40, map( sin(facetime), -1, 1, 30, 300));
       facetime++;
       ellipse(CenterX, height/2, 250, 250);
      }

    
    {
      if (player == 1)
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
          readyTrigger = true;
        } 
      }
    
      else if (player == 2)
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
          readyTrigger = true;
        } 
      }
    
    
      if(readyTrigger == false)
      {
        textAlign(CENTER,CENTER);
        fill(255,255);
        text("START", CenterX, height/2, 300,300);
        textAlign(CENTER,TOP);
      }

      
                if (p2_ready == true && p1_ready == true)
          {
            gameStart = true;
            startScreen= false;
            resetEndFlow = true;
            targetY_bot = height/2;
            targetY_top = 0;   
            startFlow = false;
            readyTrigger = false;
            paddle1.setH(paddleStartSize);
            paddle1_H = paddleStartSize;
            paddle2.setH(paddleStartSize);
            paddle2_H = paddleStartSize;
            startScreen = false;
            counter = 0;
            p1_ready = false;
            p2_ready = false;
          }
    }
        fill(255, 204, 0, 128);
    stroke(0);
    ellipse(orbX, orbY, orbR, orbR);
    fill(255);
  }
  void setReadyTrigger()
  {
    readyTrigger = false;
  }
}

