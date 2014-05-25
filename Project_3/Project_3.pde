//import ddf.minim.*;
//import ddf.minin.*;

int counter = 1;
int yourScore = int(random(80,130));
int oppScore = yourScore + 2;
boolean heShoots = false;

float theX, theY;

boolean shortRange = false;
boolean midRange = false;
boolean longRange = false;

  PFont theFont;

void setup() {
  rectMode(CENTER);
  theFont = createFont("SourceCodePro-Regular.otf",20);
   size(400,400);
  theX = width/2;
  theY = height/2;
}

void draw() {
  textFont(theFont, 15);
  textAlign(CENTER,TOP);
  background(0);
  showScore();
  if(counter == 1) {  
    fill(#FFFFFF);
    //start_1();
    text("With only seconds left in the fourth quarter, you have a chance to tie the game with two free throws.", theX, theY, 300, 100);
    text("Press SPACE to shoot.", theX, theY+100, 300, 100);
    //counter == 2 
    //counter == 3
  } 
  else if (counter == 2) {
    //firstFreeThrowMISS();
    text("You shoot your first free throw and you missed! The referee hands you the ball", theX, theY, 300, 100); 
    showSpaceContinue("shoot your second free throw");
    //counter == 26 "Press Space to shoot your second free throw"" ONLY
  } 
  else if (counter == 3) {
    //firstFreeThrowMAKE();
        showSpaceContinue("shoot your second free throw");

text("You shoot your first free throw and it swishes in! The referee hands you the ball again", theX, theY, 300, 100);
    //yourScore++;
    //counter == 26 ONLY;
  } 
  else if (counter == 26) {
    //secondFreeThrow();
    text("You take a deep breath, look up, and shoot your second free throw...", theX, theY, 300, 100);
    showSpaceContinue("continue");
    //counter == 4;
    //counter == 5;
  }
  else if (counter == 4) {
    //secondFreeThrowMISS();
    text("You feel it leave your hands too abruptly...the ball bounces of the rim to the side...you and the defender reach for it in midair...", theX, theY, 300, 100);
    showSpaceContinue("go for the rebound");
    //counter == 6
    //counter == 27
  } 
  else if (counter == 5) {
    //secondFreeThrowMAKE_3_2();
    text("It swishes in! Now the other team tries to inbound the ball...", theX, theY, 300, 100);
    showSpaceContinue("continue");
    //counter == 19 ONLY
  } 
  else if (counter == 6) {
    //grabRebound_PASSFLOW();
    showSpaceContinue("pass the ball out");
    text("You grabbed the rebound! But you're falling over...", theX, theY, 300, 100);
    //counter == 7 ONLY
  } 
  else if (counter == 7) {
    //PASSFLOW();
    text("Which open teammate do you pass it to?", theX, theY, 300, 100);
                 text("(Use your keyboard)", theX, theY + 40, 300, 100);
   rectMode(CORNER);
  stroke(#C4C4C4);
  strokeWeight(2);
  noFill();
  rect(width/2 - (96/2),height- 151 +50, 96,151);
  ellipse(width/2, height- 151 +50, 96, 96);
  line(width/2 - 180, height - 95 +50, width/2 - 180, height);
    line(width/2 + 179, height - 95 +50, width/2 + 179, height);
  arc(width/2, height - 32 +50, 380,380, PI+(PI/9), 2*PI-(PI/9), OPEN ); // TO DO TO DO DTODT ODOT DOTOD OTD OOTDO T
    // TOD OD OTDOT ODOT DO TODO TOD OTDO TODO TO
        textFont(theFont, 24);
        fill(#63CFF5);
  text("A", width/2+110, height/2+30   );
text("B", width/2-84, height/2+80   );
text("C", width/2+69, height/2+170   ); 
fill(#FFFFFF);
    //counter == 8
    //counter == 9
    //counter == 10
  rectMode(CENTER);
  } 
  else if (counter == 8) {
    //PASSFLOW_3pt();
    text("He catches it at the 3pt line...he gets a sliver of daylight", theX, theY, 300, 100);
    showSpaceContinue("continue");
    //PASS IN POINT VALUE == 3
    //Pass in probabilities (30/70)?
    //Tip prob? (20/80)
    //counter == 11 ONLY
  } 
  else if (counter == 9) {
    //PASSFLOW_mid();
    text("He catches it near the free throw line...spots up and shoots it", theX, theY, 300, 100);
    showSpaceContinue("continue");

    //PASS IN POINT VALUE == 2
    //Pass in probabilities (40/60)?
    //Pass in tip probabilities?
    //counter == 11 ONLY
  } 
  else if (counter == 10) {
    //PASSFLOW_big();
    text("He catches it in mid air for the alley-oop and inches it towards the hoop...", theX, theY, 300, 100);
    showSpaceContinue("continue");

    //PASS IN POINT VALUE == 2
    //Pass in probabilities (40/60)?
    //Pass in tip probabilities?
    //counter == 11 ONLY
  } 
  //11 was skipped
  else if (counter == 12) {
    //SHOOTFLOW_miss();
    //3pt
    if (longRange == true){text("Such a long shot causes it to bounce far away", theX, theY, 300, 100); longRange=false;}
    //mid
    else if (midRange == true){text("It rattles around, and bounces off the top of the rim", theX, theY, 300, 100); midRange=false;}
    //big
    else if (shortRange == true){text("It kisses the side of the rim, and bumps just to the side", theX, theY, 300, 100); shortRange=false;}
    
    //all
    text("You reach for the rebound...", theX, theY, 300, 100 + 60);
    showSpaceContinue("continue");

    //counter == 14 
    //counter == 17
  } 
  else if (counter == 13) {
    //SHOOTFLOW_make();
    text("IT GOES IN!", theX, theY, 300, 100);
    showSpaceContinue("continue");

    //reference shot value and add to YOURSCORE
    //AUDIO: cheering
    //counter == 50 ONLY
  } 
  else if (counter == 14) {
    //TIPFLOW();
    text("You extends your fingers, and try to tip the ball back in...", theX, theY, 300, 100);
    showSpaceContinue("continue");

    
    //counter == 18 ONLY
  } 
  else if (counter == 50) {
    //finalscore();

    //if Home<Away
    if (yourScore<oppScore){fill(#D60020);textFont(theFont, 23);text("You lose...", theX, theY, 300, 100);}
    else if (yourScore==oppScore){fill(#F0D800);textFont(theFont, 23);text("Overtime!", theX, theY, 300, 100); textFont(theFont, 15);text("Unfortunately the program ends here...", theX, theY+45, 300, 100);}
    else if (yourScore>oppScore){fill(#34C42D);textFont(theFont, 23);text("You Win!", theX, theY, 300, 100);}
    
    showSpaceContinue("play again");
    
    //counter 1
  }
    else if (counter == 18) {
    //TIPFLOW_suspense();
    text("It bounces from the top of the rim and inches towards the net...", theX, theY, 300, 100);
        showSpaceContinue("continue");

    //references passed in tip values
    //counter == 15
    //counter == 16
  }
  else if (counter == 15) {
    //TIPFLOW()_miss();
    text("Rolls around and falls to the floor...", theX, theY, 300, 100);
    showSpaceContinue("continue");

    //counter == 50 ONLY
  } 
  else if (counter == 16) {
    //TIPFLOW()_make();
    text("Kisses the back of the rim and it goes in! Score!!", theX, theY, 300, 100);
    showSpaceContinue("continue");

    //YOURSCORE +2
    //counter == 50 ONLY
  } 
  else if (counter == 17) {
    //NOTIP();
    text("The ball is out of reach...it falls to the floor.", theX, theY, 300, 100);
    showSpaceContinue("continue");

    //counter == 50 ONLY
  }
  else if (counter == 19) {
   // INBOUNDFLOW();
    text("The defender looks around, desperately trying to find an open teammate to pass to...", theX, theY, 300, 100);
    showSpaceContinue("continue");

    //counter == 20
    //counter == 23
  }
  else if (counter == 20) {
    //INBOUNDFLOW_pass();
    text("The opponent finds the open man and throws them the ball in their direction. Both teams go for it in midair...you extend your hand as far as you can...", theX, theY, 300, 100);
    showSpaceContinue("try to steal the ball");

    //counter == 21
    //counter == 22
  }
  else if (counter == 21) {
    //INBOUNDFLOW_steal();
    text("You extend your hands and just barely grab the ball! It's a steal! You're off balance so you look around for a pass...", theX, theY, 300, 100);
    showSpaceContinue("continue");

    //counter == 7 ONLY
  }
  else if (counter == 22) {
    //INBOUNDFLOW_lose();
    text("You extend your hands and your fingers scrape the ball...but the opponent still catches it and cradles it to protect it", theX, theY, 300, 100);
    showSpaceContinue("continue");

    //counter == 50 ONLY
  }
  else if (counter == 23) {
    //INBOUNDFLOW_violation_not_yet();
    text("You aggresively pressure your opponent, he can't find any daylight to pass it out...", theX, theY, 300, 100);
    showSpaceContinue("continue");

    //counter == 24 ONLY
  }
  else if (counter == 24) {
    text("Inbound violation! He couldn't inbound the ball in time!", theX, theY, 300, 100);
    showSpaceContinue("try to deny the pass");

    //AUDIO: Whistle, cheer
    //counter == 25 ONLY  
  }
   else if (counter == 25) {
    text("The referee hands you the ball as you stand on the sideline...you look for a teammate to pass it to...", theX, theY, 300, 100);
    showSpaceContinue("continue");

    //counter == 7 ONLY;
  }
   else if (counter == 27) {
    //missedRebound()
    text("Oh no! The opponent grabs the rebound, lowers his body and protects the ball as the clock runs out...", theX, theY, 300, 100);
    showSpaceContinue("continue");

    //counter == 50 ONLY;
  }
}
/*



  else if (counter == 50) {
    //finalscore();

    //if Home<Away
    if (yourScore<oppScore){text("You lose...", theX, theY, 300, 100);}
    else if (yourScore==oppScore{text("Overtime!", theX, theY, 300, 100);}
    else if (yourScore>oppScore{text("You Win!", theX, theY, 300, 100);}
    
    showSpaceContinue("play again");
    
    //counter 1
  }
}
*/



int rollTwo(int first, int second){
  float theRoll = random(0,100);
  if (theRoll <= first){
    return 1;
  }
  else
    return 0;
}

void showScore(){
  float scoreX = width/2;
  float scoreY = height/8;
    textFont(theFont, 25);

  text(yourScore+ "  " + oppScore, scoreX, scoreY);
    textFont(theFont, 15);

  text("HOME   AWAY", scoreX, scoreY + 30);
}

void changeScore(){
  //flash red, blink a bit? vibrate?
}

void showSpaceContinue(String dothis){
      textFont(theFont, 13);

  float contX = width/2;
  float contY = height*7/8;
  text("Press SPACE to " + dothis + "...", contX, contY);
      textFont(theFont, 15);

}

