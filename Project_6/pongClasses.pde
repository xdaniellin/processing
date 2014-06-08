class Paddle{
  int x;
  int w = 20;
  int h = 140;

  Paddle(int xin)
  {
    x = xin;
  }
  
  
  public int getH(){
    return h;
  }
  
  public int getW(){
    return w; 
  }
  
  void setH(int hin)
  {
    h = hin;
  }
  
  void drawPaddle(int yin) 
  {  
    //rect(mouseX-w/2, y, w, h);
    rect(x, yin - h/2, w, h);
  }
}

class Ball{
  float ballX = width/2;
  float ballY = height/2;
  float ballSpeedX = random(10, 20);
  float ballSpeedY = random(-20, 20);
  float ballDiameter = 20;
  
  float paddleX;
  float paddleY;
  float paddleHeight = 100;
  float paddleWidth = 20;
  
  int intro = 0;
  boolean flash = false;
  boolean paddleFlash = false;

  
  boolean hitPaddle(float rx, float ry, float rw, float rh, float cx, float cy, float cr) 
  {
    float ryUPDATED = ry -  rh/2;
    float circleDistanceX = abs(cx - rx - rw/2);
    float circleDistanceY = abs(cy - ry - rh/2);
   
    if (circleDistanceX > (rw/2 + cr)) { return false; }
    if (circleDistanceY > (rh/2 + cr)) { return false; }
    if (circleDistanceX <= rw/2) { return true; }
    if (circleDistanceY <= rh/2) { return true; }
   
    float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
    return cornerDistance <= pow(cr, 2);
  }
  
  void resetFlash()
  {
    if(flash==true)
    {
      flash = false;
    }
  }
  void resetPaddleFlash()
  {
    if(paddleFlash == true)
    {
      paddleFlash = false;
    }
  }
  Ball(float W_in, float H_in)
  {
    paddleWidth = W_in;
    paddleHeight = H_in;
  }
  
  Ball(float W_in, float H_in, int d_in)
  {
    paddleWidth = W_in;
    paddleHeight = H_in;
    intro = d_in;
    ballSpeedX = random(10, 20);
    ballSpeedY = random(-20, 20);
    if (intro == 1)
    {
      ballSpeedX *= -1;
    }
  }
  boolean getPaddleFlash()
  {
    return paddleFlash;
  }
  boolean getFlash(){
    return flash;
  }
  
  float getX(){
    return ballX;
  }
  
  float getY(){
    return ballY;
  }
  
  float getSize(){
    return ballDiameter;
  }
  
  void updatePaddle(float paddle_Y,float paddle_X, float paddle_H)
  {
    paddleY = paddle_Y;
    paddleX = paddle_X;
    paddleHeight = paddle_H;
  }

  
  void display()
  {
    // Draw ball
    stroke(random(0,255), random(0,255), random(0,255));
    fill(255);
    ellipse(ballX, ballY, ballDiameter, ballDiameter);
    stroke(0);
  
    // Update ball
      ballX += (ballSpeedX);
      ballY += (ballSpeedY);
      

    //ballX = ballX + ballSpeedX;
    //ballY = ballY + ballSpeedY;
    
    // Draw Paddle
    //fill(102);
    //rect(paddleX, paddleY, paddleWidth, paddleHeight);
    if(intro == 1 || intro == 2)
    {
      boolean collisionCenter = hitPaddle(width/2, height/2 - (height/2), 5, height, ballX, ballY, ballDiameter/2);
      if ( collisionCenter == true ) 
      {
      ballSpeedX *= -1;
      ballSpeedX *= 1.0;
      ballX += (ballSpeedX);
      }
      boolean collision = hitPaddle(paddleX, paddleY - (paddleHeight/2), paddleWidth, paddleHeight, ballX, ballY, ballDiameter/2);
      if ( collision == true ) 
      {
        println("OH SHIT");
        ballSpeedX *= -1;
        ballSpeedX *= 1.0;
        ballX += (ballSpeedX);
        paddleFlash = true;
      }
    }
    // If ball hits paddle, invert X direction and apply effects
    if(intro == 0)
    {
      boolean collision = hitPaddle(paddleX, paddleY - (paddleHeight/2), paddleWidth, paddleHeight, ballX, ballY, ballDiameter/2);
      if ( collision == true ) {
        println("OH SHIT");
        ballSpeedX *= -1;
        ballSpeedX *= 1.1;
        ballX += (ballSpeedX);
    }

      //ballX = paddleX-ballDiameter/2;
    }
  
    // Resets things if the ball leaves the screen
    if ((ballX > width + ballDiameter) || (ballX < -ballDiameter)) {
      strokeFadeEase = 200;
      ballX = width/2;
      ballY = height/2;
      ballSpeedX = random(10, 20);
      if(intro == 0)
      {
        endFlow = true;
        blinkRed = true;
        gameStart = false;
        if(ballX > width + ballDiameter)
        {//Player 1 Wins
          p1_win = true;
          p2_win = false;
        }
        if(ballX < -ballDiameter)
        {//Player 2 Wins
          p2_win = true;
          p1_win = false;
        }
        if(random(0,1) > 0.5)
        {ballSpeedX *= -1;}
      }
      else if(intro == 1)
      {
        println("do u hear me");
        flash = true;  
        println(flash);
        ballSpeedX *= -1;
      }
      else if(intro == 2)
      { 
        flash = true;
        ballSpeedX *= 1;
      }
        ballSpeedY = random(10, 30);
        if(random(0,1) > 0.5)
        {ballSpeedY *= -1;}
        
      paddle1.setH(paddleStartSize);
      paddle2.setH(paddleStartSize);
      orb1_Size = orbStartSize;
      orb2_Size = orbStartSize;
      paddle1_H = paddleStartSize;
      paddle2_H = paddleStartSize;
      player1_progress = 0;
      player2_progress = 0;
    }
  
    // If ball hits top or bottom, change direction of Y  
    if ( ballY > height-ballDiameter/2 ) {
      ballY = height-ballDiameter/2;
      ballSpeedY = ballSpeedY * -1;
      ballY = ballY + ballSpeedY;
    } 
    else if ( ballY < ballDiameter/2 ) {
      ballY = ballDiameter/2;
      ballSpeedY = ballSpeedY * -1;
      ballY = ballY + ballSpeedY;
    }
  }

}
