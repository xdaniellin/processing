import processing.video.*;
import processing.pdf.*;

Capture cam;
Webcam webcam;
Player player1, player2;
Paddle paddle1, paddle2;
Ball ball;
Button player1_start, player2_start, backTo_start;
Button p1_intro1, p2_intro1;
Button p1_1x1, p2_1x1;
Button p1_1x2, p2_1x2;
Button p1_2x1, p2_2x1;
Button p1_2x2, p2_2x2;
Button p1_3x1, p2_3x1;
Button p1_3x2, p2_3x2;
Button startOver;
Intro player1_intro, player2_intro;
PGraphics camFrame, saveImg; 
PFont font;

int[] webcamLeft_XY, webcamRight_XY;
int fromEdge = 20;
int paddle1_Y, paddle2_Y;
int paddle1_H, paddle2_H;
int paddle1_X = fromEdge;
int paddle2_X;
float player1_X, player1_Y, player2_X, player2_Y;
float orb1_X, orb1_Y, orb2_X, orb2_Y;
float easing = .4; //.3
int orbStartSize = 200;
int paddleStartSize = 140;
int orb1_Size = orbStartSize;
int orb2_Size = orbStartSize;
float player1_progress = 0;
float player2_progress = 0;
float paddleLengthIncrement = 50;
float orbSizeIncrement = 15;
float progressIncrement = .12; //.12;
float lastTime=9999999;
boolean orbShrink = false;
boolean paddleGrow = false;
boolean levelUp_1 = false;
boolean levelUp_2 = false;
boolean startScreen = false;
float changeFrames = 12;
float iter=0;
float orb1Shadow_Size = orb1_Size;
float orb2Shadow_Size = orb2_Size;
float temp_orb1_Size = 0;
float temp_orb2_Size = 0;
float temp_paddle2_H;
int strokeFade = 255;
float temp_paddle1_H = 0;
int strokeFadeEase; //=100;

boolean missingLight_L = false;
boolean missingLight_R = false;

boolean startFlow = true;
boolean endFlow = false;
boolean resetEndFlow = true;

boolean gameStart = false;

boolean p1_win = false;
boolean p2_win = false;
boolean displayCourt = true;
boolean saveNow = false;
float snapY_bot, snapY_top;
boolean pauseRec = false;
boolean saveAni = false;   
boolean blinkRed = true;
boolean setTime = true;

boolean p1_ready, p2_ready;

color c_1x1 = color(229,58,93,128); color s_1x1 = color(241,255,170);
color c_1x2 = color(120,198,242,128); color s_1x2 = color(255,181,170);
color c_2x1 = color(181,135,252,128); color s_2x1 = color(255,226,170);
color c_2x2 = color(146,255,0,128); color s_2x2 = color(65,64,255);
color c_3x1 = color(252,151,89,128); color s_3x1 = color(64,255,97);
color c_3x2 = color(242,228,84,128); color s_3x2 = color(64,168,255);

color p1_color, p2_color;
color p1_colorSupplement, p2_colorSupplement;
float savedBoxAlpha = 0;
boolean fadeAway;


void setup() {
  //Setup
  //size(1280, 720, PDF, "Orby.pdf");
  size(1280, 720);
  targetY_bot = height/2;
  paddle2_X = width - (fromEdge*2);
  snapY_bot = height;
  snapY_top = -height/2;
  saveImg_width = width;
  saveImg_height = height;
  imgX = width/2;
  imgY = height/2;
  camSetup();
  font = createFont("SWANSE__.TTF",20);
  textFont(font, 30);

  frameRate(200);

  //Class initializations
  player1 = new Player(); 
  player2 = new Player();
  paddle1 = new Paddle(paddle1_X); 
  paddle2 = new Paddle(paddle2_X);
  ball = new Ball(paddle1.getW(), paddle1.getH(),0);
  //player1_start = new Button(width/4, height/2, 250);
  //player2_start = new Button(width*3/4, height/2, 250);
  backTo_start = new Button(width/2, height-300, 300);
  player1_intro = new Intro(1);
  player2_intro = new Intro(2);
  startOver = new Button(width/2, 60, 500,100, color(0,0,0,128), color(#93dbda), color(42,1168,40,250));

  p1_intro1 = new Button(width/4, height/2+250, 200);
  p2_intro1 = new Button(width*3/4, height/2+250,200);
  
  p1_1x1 = new Button((width/6)*1,(height/5)*1,125,c_1x1,s_1x1);
  p1_1x2 = new Button((width/6)*2,(height/5)*1,125,c_1x2,s_1x2);
  p1_2x1 = new Button((width/6)*1,(height/5)*2,125,c_2x1,s_2x1);
  p1_2x2 = new Button((width/6)*2,(height/5)*2,125,c_2x2,s_2x2);
  p1_3x1 = new Button((width/6)*1,(height/5)*3,125,c_3x1,s_3x1);
  p1_3x2 = new Button((width/6)*2,(height/5)*3,125,c_3x2,s_3x2);
  p2_1x1 = new Button((width/6)*1+width/2,(height/5)*1,125,c_1x1,s_1x1);
  p2_1x2 = new Button((width/6)*2+width/2,(height/5)*1,125,c_1x2,s_1x1);
  p2_2x1 = new Button((width/6)*1+width/2,(height/5)*2,125,c_2x1,s_2x1);
  p2_2x2 = new Button((width/6)*2+width/2,(height/5)*2,125,c_2x2,s_2x2);
  p2_3x1 = new Button((width/6)*1+width/2,(height/5)*3,125,c_3x1,s_3x1);
  p2_3x2 = new Button((width/6)*2+width/2,(height/5)*3,125,c_3x2,s_3x2);

  //p1_1x2 = new Button(


  //Global variable initializations
  paddle1_H = paddle1.getH();
  paddle2_H = paddle2.getH();
  camFrame = createGraphics(width, height);
  saveImg = createGraphics(width, height);
}

void draw() {
  if (cam.available()) 
  {
    //Display Webcam Video

    //Scan for brightest pixel on both halves of the screen
    webcam.scanLeft(0, cam.width/2, 0, cam.height);
    webcamLeft_XY = webcam.brightestXY_Left(); 
    player2.setOrbXY(webcamLeft_XY);
    webcam.scanRight(cam.width/2, cam.width, 0, cam.height);
    webcamRight_XY = webcam.brightestXY_Right();
    player1.setOrbXY(webcamRight_XY);





    //Draw Orbs
    fill(255, 204, 0, 128);

    player1_X = width - player1.orbXY[0];
    player1_Y = player1.orbXY[1];
    player2_X = width - player2.orbXY[0];
    player2_Y = player2.orbXY[1];

    orb1_X += (player1_X - orb1_X) * easing;
    orb1_Y += (player1_Y - orb1_Y) * easing;
    orb2_X += (player2_X - orb2_X) * easing;
    orb2_Y += (player2_Y - orb2_Y) * easing;

    if(gameStart == false)
    {
        mirrorVideoDisplay();
      if(startFlow == true)
      {
        textAlign(CENTER);
        stroke(20);
        strokeWeight(4);
        line(width/2, 0, width/2, height);
        player1_intro.display();
        player2_intro.display();
      }
      if(endFlow == true)
      {
           noStroke();
              if (strokeFadeEase < 30)
              {
                snap = true;
                blinkRed = false;
              }
      
              if (snap == true)
              {
                snapAnimation();
              }
              if (displayCourt == true)
              {
                strokeWeight(2);
                stroke(255);
                line(0, 4, width, 4);
                line(width/2, 0, width/2, height);
                line(0, height-4, width, height-4);
                stroke(0);
                strokeWeight(0);
              }
                            if (startScreen == true)
              {
                player1_intro.display();
                player2_intro.display();
                /* fill(255,255);
                text("Start Screen", width/4, 50, 650,50) ;
                if (startOver.rectDisplay(orb1_X, orb1_Y, orb1_Size-100) == true || startOver.rectDisplay(orb2_X, orb2_Y, orb2_Size-100) == true)
                {
                  player1_intro.setCounter(0);
                  player2_intro.setCounter(0);
                  startScreen = false;
                  startFlow = true;
                }*/
                /*if(setTime == true)
                {
                  lastTime = millis();
                  setTime = false;
                }

                
                fill(p1_color);
                ellipse(orb1_X, orb1_Y, orb1_Size-100, orb1_Size-100);
                fill(p2_color);
                ellipse(orb2_X, orb2_Y, orb2_Size-100, orb2_Size-100);
                fill(0);
                if (backTo_start.circleDisplay(orb1_X, orb1_Y, orb1_Size-100) == true || backTo_start.circleDisplay(orb2_X, orb2_Y, orb2_Size-100) == true)
                {
                  startScreen = false;
                  startFlow = true;
                  displayCourt = false;
                }
                if (player1_start.circleDisplay(orb1_X, orb1_Y, orb1_Size-100) == true)
                {
                  p1_ready = true;
                  if(p2_ready == true)
                  {
                    gameStart = true;
                    startScreen= false;
                    resetEndFlow = true;
                    targetY_bot = height/2;
                    targetY_top = 0;     
                    savedBoxAlpha = 0;
                    p2_ready = false;
                    p1_ready = false;
                    setTime = true;
                    fadeAway = false;

                  }       
                }
                if (player2_start.circleDisplay(orb2_X, orb2_Y, orb2_Size-100) == true)
                {
                  p2_ready = true;
                  if(p1_ready == true)
                  {
                    gameStart = true;
                    startScreen= false;
                    resetEndFlow = true;
                    targetY_bot = height/2;
                    setTime = true;
                    targetY_top = 0;     
                    savedBoxAlpha = 0;
                    p2_ready = false;
                    p1_ready = false;
                    fadeAway = false;
                    
                  }       
                }*/
              }

              if (saveAni == true)
              {
                saveAnimation();
                if(millis() - lastTime > 1200)
                {
                  if(savedBoxAlpha > 250)
                  {
                    fadeAway = true;
                  }
                  if(fadeAway == true)
                  {
                    savedBoxAlpha -= 25;
                  }
                  savedBoxAlpha += 15;
                  fill(20,savedBoxAlpha);
                  stroke(0,savedBoxAlpha);
                  strokeWeight(3);
                  rect(width-260, height-120, 250, 100,7);
                  fill(255,savedBoxAlpha);
               
                  textLeading(24);
                  text(".png saved in \"" + sketchPath("") + "\"", width-255, height-115,240,100);
                  stroke(0);
                }
                
              }
              if (blinkRed == true)
              {
                strokeFadeEase += (0 - strokeFadeEase) * .20;  
                fill(254, 46, 46, strokeFadeEase);
                if (p1_win == false)
                {
                  rect(0, 0, width/2, height);
                }
                if (p2_win == false)
                {
                  rect(width/2, 0, width/2, height);
                }
              }
        }
      }
      
    




    if (gameStart == true)
    { 
      println("entering GameStart");
      println(saveAni);
      if (resetEndFlow == true)
        {
                println("entering resetEndFlow");
          targetSwitch = false;
          displayText = false;
          waiting = false;
          waiting2 = true;
           //waiting3 = true;
          waiting3 = false;
          readyScreen = false;
          firstAni = true;
          secondAni = false;
          saveImg_width = width;
          saveImg_height = height;
          imgX = width/2;
          imgY = height/2;
          resetEndFlow = false;
          endFlow = false;
          snap = false;
          saveAni = false;
        }   
      mirrorVideoDisplay();        
      if (displayCourt == true)
      {
        strokeWeight(15);
        stroke(255);
        line(0, 4, width, 4);
        line(width/2, 0, width/2, height);
        line(0, height-4, width, height-4);
        stroke(0);
        strokeWeight(2);
      }

      //ellipse(orb1_X, orb1_Y, orb1_Size, orb1_Size);
      if (levelUp_1 == false)
      {
        if (missingLight_L == true)
        {
          textSize(200);
          text("?", width/4, height/2);
        } else
        {
          fill(p1_color,128);
          ellipse(orb1_X, orb1_Y, orb1_Size, orb1_Size);
          arc(orb1_X, orb1_Y, orb1_Size, orb1_Size, PI*3/2, PI*3/2+player1_progress, PIE);
        }
      }
      if ( coverBall(orb1_X, orb1_Y, orb1_Size/2, ball.getX(), ball.getY(), ball.getSize()/2  ) == true && levelUp_1 == false)
        //if ( coverBall(orb1_X, orb1_Y, orb1_Size/2, ball.getX(), ball.getY(), ball.getSize()/2  ) == true)
      {
        player1_progress += progressIncrement;
        if ( player1_progress >= 2*PI )
        {
          //orbShrink == true;
          //paddleGrow == true;
          levelUp_1 = true;
          player1_progress = 0;
          //paddle1_H += paddleLengthIncrement;
          temp_orb1_Size = orb1_Size;
          temp_paddle1_H = paddle1_H;
          //orb1_Size -= orbSizeIncrement;  
          paddle1.setH(round(paddle1_H + paddleLengthIncrement));
        }
      }

      if (levelUp_1 == true)
      {
        noFill();
        stroke(0, strokeFade);
        ellipse(orb1_X, orb1_Y, temp_orb1_Size, temp_orb1_Size);
        strokeFade -= 255 / changeFrames;

        noStroke();
        strokeFadeEase += (0 - strokeFadeEase) * .20;  
        fill(42, 168, 40, strokeFadeEase);
        rect(0, 0, width/2, height);


        fill(p1_color,128);
        ellipse(orb1_X, orb1_Y, orb1Shadow_Size, orb1Shadow_Size);
        //orb1Shadow_Size -= (orb1Shadow_Size*2 / changeFrames);
        orb1Shadow_Size -= (orb1Shadow_Size*2) / changeFrames;
        orb1_Size +=((orb1_Size - orbSizeIncrement) - orb1_Size) * .10;// / changeFrames);
        //      orb1_Size -= (orbSizeIncrement / changeFrames);
        paddle1_H += ((paddle1_H + paddleLengthIncrement) - paddle1_H) * .10;
        
        iter++;

        stroke(0, 255-strokeFade);
        ellipse(orb1_X, orb1_Y, orb1_Size, orb1_Size);
        stroke(0);


        if (iter > changeFrames)
        {
          iter = 0;
          levelUp_1 = false;
          orb1Shadow_Size = orb1_Size;
          strokeFade = 255;
          strokeFadeEase = 100;
        }
      }
      //arc(orb1_X, orb1_Y, orb1_Size, orb1_Size, PI*3/2, PI*3/2+player1_progress, PIE);

     fill(p2_color);
      if ( coverBall(orb2_X, orb2_Y, orb2_Size/2, ball.getX(), ball.getY(), ball.getSize()/2) == true && levelUp_2 == false)
      {
        player2_progress += progressIncrement;
        if ( player2_progress >= 2*PI )
        {
          //orbShrink == true;
          //paddleGrow == true;
          levelUp_2 = true;
          player2_progress = 0;
          //paddle1_H += paddleLengthIncrement;
          temp_orb2_Size = orb2_Size;
          temp_paddle2_H = paddle2_H;
          //orb1_Size -= orbSizeIncrement;  
          paddle2.setH(round(paddle2_H + paddleLengthIncrement));
        }
      }
      if (levelUp_2 == false)
      {
        if (missingLight_R == true)
        {
          textSize(200);
          text("?", width*3/4, height/2);
        } 
        else
        {
          fill(p2_color,128);
          ellipse(orb2_X, orb2_Y, orb2_Size, orb2_Size);
          arc(orb2_X, orb2_Y, orb2_Size, orb2_Size, PI*3/2, PI*3/2+player2_progress, PIE);
        }
      }
      if (levelUp_2 == true)
      {
        noFill();
        stroke(0, strokeFade);
        ellipse(orb2_X, orb2_Y, temp_orb2_Size, temp_orb2_Size);
        strokeFade -= 255 / changeFrames;

        noStroke();
        strokeFadeEase += (0 - strokeFadeEase) * .20;  
        fill(42, 168, 40, strokeFadeEase);
        rect(width/2, 0, width/2, height);

        fill(p2_color,128);
        ellipse(orb2_X, orb2_Y, orb2Shadow_Size, orb2Shadow_Size);
        //orb1Shadow_Size -= (orb1Shadow_Size*2 / changeFrames);
        orb2Shadow_Size -= (orb2Shadow_Size*2) / changeFrames;
        orb2_Size +=((orb2_Size - orbSizeIncrement) - orb2_Size) * .10;// / changeFrames);
        //      orb1_Size -= (orbSizeIncrement / changeFrames);
        paddle2_H += ((paddle2_H + paddleLengthIncrement) - paddle2_H) * .10;
        iter++;
        stroke(0, 255-strokeFade);

        ellipse(orb2_X, orb2_Y, orb2_Size, orb2_Size);

        stroke(0);


        if (iter > changeFrames)
        {
          iter = 0;
          levelUp_2 = false;
          orb2Shadow_Size = orb2_Size;
          strokeFade = 255;
          strokeFadeEase = 100;
        }
      }

      //Draw paddles according to OrbsXY
      for (int i = 0; i<=20; i++) 
      {
        fill(p1_color);
        float x = lerp(orb1_X, paddle1.getX()+10, i/20.0);
        float y = lerp(orb1_Y, orb1_Y, i/20.0);
        stroke(p1_color,200);
        strokeWeight(4);
        point(x, y);
        strokeWeight(2);
      }
    for (int i = 0; i<=20; i++) 
      {
        fill(p2_color);
        float x = lerp(orb2_X, paddle2.getX()+10, i/20.0);
        float y = lerp(orb2_Y, orb2_Y, i/20.0);
        stroke(p2_color,200);
        strokeWeight(4);
        point(x, y);
        strokeWeight(2);
      }
      fill(p1_color);
      stroke(0);
      paddle1_Y = constrain(round(orb1_Y), paddle1_H/2, height-(paddle1_H/2));   
      paddle1.drawPaddle(paddle1_Y); 
      fill(p2_color);
      paddle2_Y = constrain(round(orb2_Y), paddle2_H/2, height-(paddle2_H/2));   
      paddle2.drawPaddle(paddle2_Y);

      //  boolean collision = hitPaddle(paddleX, paddleY, paddleWidth, paddleHeight, ballX, ballY, ballDiameter/2);
      if (ball.getX() < width/4)
      { 
        ball.updatePaddle(paddle1_Y, paddle1_X, paddle1_H);
      } else if (ball.getX() > width - (width/4))
      {
        ball.updatePaddle(paddle2_Y, paddle2_X, paddle2_H);
      }
      ball.display();
    }//GMAESTART
  }
}

boolean coverBall(float cx1, float cy1, float cr1, float cx2, float cy2, float cr2) {
  if (dist(cx1, cy1, cx2, cy2) < cr1 + cr2) {
    return true;
  } else {
    return false;
  }
}

//Easing                                          DONE
//Detected                                      DONE
//Orb                                           DONE
//Paddle                                        DONE
//Score Keeping Interface
//Interesting Twist                               DONE
//Charge when you hover over                    DONE
//when complete circle, "level up"              DONE
//ANIMATE PADDLE GROWING
//ANIMATE ORB SHRINKING                     DONE
//Loading Screen
//Start interface
//Center to start
//Sound
//On lose:
//Red animation
//Screenshot
//Caption: Winner, loser?
//play again
//SCAN SMALLER IMAGE, PLAY BIGGER ONE

//can upgrade:
//paddle length
//orb size
//ball doubler (TO EXPAND)


//Instructions
//Selecting Color
//Blurring

