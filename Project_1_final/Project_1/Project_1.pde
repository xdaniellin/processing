//import processing.pdf.*;

//PGraphics leftsurface;
//PGraphics rightsurface;

void setup(){
  size(600,600);//,PDF,"Project-1-Image-1.pdf");
  background(255,255,255);
  //leftsurface = createGraphics(centerX - leftX, topLeftY - 
}

void draw(){
  frameRate(0.5);
  //begRecord(PDF, "line-#####.pdf");
 //beginRecord(PDF, "line-#####.pdf");
  //cube
  int leftX = width/6; //special
  int rightX = width-leftX;  
  
  int centerX = width/2; //special
  int centerY = height/2;//height*8/24; //special
  
  int topLeftX = leftX;
  int topLeftY = height*2/6;//height/4; //special
  
  int botLeftX = leftX;
  int botLeftY = height*8/12;
  
  int botX = centerX;
  int botY = height*5/6; //special
  
  int botRightX = rightX;
  int botRightY = botLeftY;
  
  int topRightX = rightX;
  int topRightY = topLeftY;
  
  int topX = centerX;
  int topY = height - botY; //topLeftY + (topLeftY-centerY);
  
  float numLines = random(15,150);
  int startX, startY, endX, endY;
  float drawToX, drawToY;
  
  float randColor1_1 = random(0,255);
  float randColor1_2 = random(0,255);
  float randColor1_3 = random(0,255);
  
  float randColor2_1 = random(0,255);
  float randColor2_2 = random(0,255);
  float randColor2_3 = random(0,255);
  
  color color1 = color(randColor1_1, randColor1_2, randColor1_3);
  color color2 = color(randColor2_1, randColor2_2, randColor2_3);
  color color3 = color(abs(randColor1_1 - randColor2_1)/2, abs(randColor1_2 - randColor2_2)/2, abs(randColor1_3 - randColor2_3)/2);
    background(color3);

  int drawTo_startX, drawTo_startY, drawTo_endX, drawTo_endY;
  stroke(0,0,0);
  float corner = random(0,4);
  int cornerX=0, cornerY=0;    
  if (corner<4){
    cornerX = 0;
    cornerY = 0;
  }
  if (corner<3){
    cornerX = width;
    cornerY = 0;
  }
  if (corner<2){
    cornerX = width;
    cornerY = height;
  }
  if (corner<1){
    cornerX = 0;
    cornerY = height;
  }
    for(int i=0; i<numLines; i++){ //0,1,2
         startX = 0;
         startY = 0;
         endX = width;
         endY = 0;
         drawToX = cornerX;
         drawToY = cornerY;
         line(  (startX + i*( (endX-startX)/(numLines) )),(startY + i*( (endY-startY)/(numLines) )),drawToX,drawToY);
         startX = width;
         startY = 0;
         endX = width;
         endY = height;
         line(  (startX + i*( (endX-startX)/(numLines) )),(startY + i*( (endY-startY)/(numLines) )),drawToX,drawToY);
         startX = width;
         startY = height;
         endX = 0;
         endY = height;
         line(  (startX + i*( (endX-startX)/(numLines) )),(startY + i*( (endY-startY)/(numLines) )),drawToX,drawToY);
         startX = 0;
         startY = height;
         endX = 0;
         endY = 0;
         line(  (startX + i*( (endX-startX)/(numLines) )),(startY + i*( (endY-startY)/(numLines) )),drawToX,drawToY);
      }
      strokeWeight(15);

 
  
  //Draw Cube
   strokeWeight(1);
   fill(255,255,255);
  stroke(0,0,0);
    quad(topLeftX,topLeftY,centerX,centerY,botX,botY,botLeftX,botLeftY);
    quad(centerX,centerY,topRightX,topRightY,botRightX,botRightY,botX,botY);

 

  //Left Surface Point
    float leftSurfacePointX = leftX + random((centerX-leftX)/10, (centerX-leftX)*9/10);
    float leftSurfacePointY = centerY + random((botLeftY-centerY)/10, (botLeftY-centerY)*9/10);
    point(leftSurfacePointX,leftSurfacePointY);
    //lines
    strokeWeight(0.5);
    stroke(color1);
      for(int i=0; i<numLines; i++){ //0,1,2
         startX = topLeftX;
         startY = topLeftY;
         endX = centerX;
         endY = centerY;
         drawToX = leftSurfacePointX;
         drawToY = leftSurfacePointY;
         line(  (startX + i*( (endX-startX)/(numLines) )),(startY + i*( (endY-startY)/(numLines) )),drawToX,drawToY);
         startX = topLeftX;
         startY = topLeftY;
         endX = botLeftX;
         endY = botLeftY;
         line(  (startX + i*( (endX-startX)/(numLines) )),(startY + i*( (endY-startY)/(numLines) )),drawToX,drawToY);
         startX = centerX;
         startY = centerY;
         endX = botX;
         endY = botY;
         line(  (startX + i*( (endX-startX)/(numLines) )),(startY + i*( (endY-startY)/(numLines) )),drawToX,drawToY);
         startX = botLeftX;
         startY = botLeftY;
         endX = botX;
         endY = botY;
         line(  (startX + i*( (endX-startX)/(numLines) )),(startY + i*( (endY-startY)/(numLines) )),drawToX,drawToY);
      }
  //Right Surface Point
    float rightSurfacePointX = centerX + random((rightX-centerX)/10, (rightX-centerX)*9/10);
    float rightSurfacePointY = centerY + random((botLeftY-centerY)/10, (botLeftY-centerY)*9/10);
    point (rightSurfacePointX,rightSurfacePointY);
    stroke(color2);
      for(int i=0; i<numLines; i++){ //0,1,2
         startX = topRightX;
         startY = topRightY;
         endX = centerX;
         endY = centerY;
         drawToX = rightSurfacePointX;
         drawToY = rightSurfacePointY;
         line(  (startX + i*( (endX-startX)/(numLines) )),(startY + i*( (endY-startY)/(numLines) )),drawToX,drawToY);
         startX = topRightX;
         startY = topRightY;
         endX = botRightX;
         endY = botRightY;
         line(  (startX + i*( (endX-startX)/(numLines) )),(startY + i*( (endY-startY)/(numLines) )),drawToX,drawToY);
         startX = centerX;
         startY = centerY;
         endX = botX;
         endY = botY;
         line(  (startX + i*( (endX-startX)/(numLines) )),(startY + i*( (endY-startY)/(numLines) )),drawToX,drawToY);
         startX = botRightX;
         startY = botRightY;
         endX = botX;
         endY = botY;
         line(  (startX + i*( (endX-startX)/(numLines) )),(startY + i*( (endY-startY)/(numLines) )),drawToX,drawToY);
      }
   
     // fill(color3);
    quad(topLeftX,topLeftY,topX,topY,topRightX,topRightY,centerX,centerY);
    strokeWeight(1);
      for(int i=0; i<numLines; i++){ //0,1,2
      stroke(color2);
         startX = topRightX;
         startY = topRightY;
         endX = centerX;
         endY = centerY;
         drawTo_startX = topX;
         drawTo_startY = topY;
         drawTo_endX = topLeftX;
         drawTo_endY = topLeftY;
         line(  (startX + i*( (endX-startX)/(numLines) )),(startY + i*( (endY-startY)/(numLines) )),(drawTo_startX + i*( (drawTo_endX-drawTo_startX)/(numLines) )),(         drawTo_startY + i*( (drawTo_endY-drawTo_startY)/(numLines) )
));
    stroke(color1);
         startX = topLeftX;
         startY = topLeftY;
         endX = centerX;
         endY = centerY;
         drawTo_startX = topX;
         drawTo_startY = topY;
         drawTo_endX = topRightX;
         drawTo_endY = topRightY;
        line(  (startX + i*( (endX-startX)/(numLines) )),(startY + i*( (endY-startY)/(numLines) )),(drawTo_startX + i*( (drawTo_endX-drawTo_startX)/(numLines) )),(         drawTo_startY + i*( (drawTo_endY-drawTo_startY)/(numLines) )
));
         
      }
    
    
    
            strokeWeight(15);
  stroke(0,0,0);
  line(topLeftX,topLeftY,botLeftX,botLeftY); //L
  line(botLeftX,botLeftY,botX,botY); //botL
  line(botX,botY,botRightX,botRightY); //botR
  line(topRightX,topRightY,botRightX,botRightY); //R
  line(botLeftX,botLeftY,botX,botY); //botL
  line(topLeftX,topLeftY,topX,topY); //topL
  line(topX,topY,topRightX,topRightY); //topR
    strokeWeight(5);
  line(topLeftX,topRightY,centerX,centerY);//leftLine
  line(centerX,centerY,topRightX,topRightY);//rightLine
  line(centerX,centerY,botX,botY);
  
  strokeWeight(0.5);
  //everything else
  //int leftSurfacePointX = random(
  //leftSurfacePointY
  //For n (3) lines
    //for 


 //endRecord();
}
