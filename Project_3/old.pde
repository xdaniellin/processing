/*/*int counter = 1;
int yourScore = int(random(80,130));
int oppScore = yourScore + 2;
void setup() {
  size(400,400);
}

void draw() {
  textAlign(CENTER,BOTTOM);
  background(0);
  showScore();
  if(counter == 1) {
    //start_1();
    text("Press Space to shoot", width/2, height/2);
    //counter == 2 
    //counter == 3
  } 
  else if (counter == 2) {
    //firstFreeThrowMISS();
    text("You missed! The referee hands you the ball", width/2, height/2); 
    showSpaceContinue("shoot your second free throw");
    //counter == 26 "Press Space to shoot your second free throw"" ONLY
  } 
  else if (counter == 3) {
    //firstFreeThrowMAKE();
    text("It swishes in! The referee hands you the ball again", width/2, height/2);
    //yourScore++;
    //counter == 26 ONLY;
  } 
  else if (counter == 26) {
    //secondFreeThrow();
    text("You take a deep breath, look up, and shoot your second free throw...", width/2, height/2);
    showSpaceContinue("continue");
    //counter == 4;
    //counter == 5;
  }
  else if (counter == 4) {
    //secondFreeThrowMISS();
    text("You feel it leave your hands too abruptly...But WAIT, the ball rattles to the side...you and the defender reach for it...", width/2, height/2);
    showSpaceContinue("continue");
    //counter == 6
    //counter == 27
  } 
  else if (counter == 5) {
    //secondFreeThrowMAKE_3_2();
    text("It swishes in! Now the other team tries to inbound the ball...", width/2, height/2);
    showSpaceContinue("continue");
    //counter == 19 ONLY
  } 
  else if (counter == 6) {
    //grabRebound_PASSFLOW();
    showSpaceContinue("continue");
    text("You grabbed the rebound! But you're falling over...", width/2, height/2);
    //counter == 7 ONLY
  } 
  else if (counter == 7) {
    //PASSFLOW();
    text("Who do you pass it to? Click the teammate (Display percentages)", width/2, height/2);
    //counter == 8
    //counter == 9
    //counter == 10
  } 
}
/*
  else if (counter == 4) {
    secondFreeThrowMISS();
    "You feel it leave your hands too abruptly...But WAIT, the ball rattles to the side...you and the defender reach for it..."
    //counter == 6
    //counter == 27
  } 
  else if (counter == 5) {
    secondFreeThrowMAKE_3_2();
    "It swishes in! Now the other team tries to inbound the ball..."
    //counter == 19 ONLY
  } 
  else if (counter == 6) {
    grabRebound_PASSFLOW();
    "You grabbed the rebound! But you're falling over...(Space to continue)"
    //counter == 7 ONLY
  } 
  else if (counter == 7) {
    PASSFLOW();
    "Who do you pass it to? Click the teammate (Display percentages)"
    //counter == 8
    //counter == 9
    //counter == 10
  } 
  else if (counter == 8) {
    PASSFLOW_3pt();
    "He catches it at the 3pt line...he gets a sliver of daylight"
    //PASS IN POINT VALUE == 3
    //Pass in probabilities (30/70)?
    //Tip prob? (20/80)
    //counter == 11 ONLY
  } 
  else if (counter == 9) {
    PASSFLOW_mid();
    "He catches it near the free throw line...spots up and shoots it"
    //PASS IN POINT VALUE == 2
    //Pass in probabilities (40/60)?
    //Pass in tip probabilities?
    //counter == 11 ONLY
  } 
  else if (counter == 10) {
    PASSFLOW_big();
  } 
  else if (counter == 11) {
    SHOOTFLOW();
    "HE SHOOTS! ... "
    //counter == 12
    //counter == 13 
  } 
  else if (counter == 12) {
    SHOOTFLOW_miss();
    //3pt
    "Such a long shot causes it to bounce far away"
    //mid
    "It rattles around, and bounces off the top of the rim"
    //big
    "It kisses the side of the rim, and bumps just to the side"
    
    //all
    "he reaches for the rebound..."
    
    //counter == 14 
    //counter == 17
  } 
  else if (counter == 13) {
    SHOOTFLOW_make();
    "IT GOES IN!"
    //reference shot value and add to YOURSCORE
    //AUDIO: cheering
    //counter == 50 ONLY
  } 
  else if (counter == 14) {
    TIPFLOW();
    "He extends his fingers, tries to tip the ball back in!"
    
    //counter == 18 ONLY
  } 
  else if (counter == 15) {
    TIPFLOW()_miss();
    "Rolls around and falls to the floor..."
    //counter == 50 ONLY
  } 
  else if (counter == 16) {
    TIPFLOW()_make();
    "Kisses the back of the rim and it goes in! Score!!"
    //YOURSCORE +2
    //counter == 50 ONLY
  } 
  else if (counter == 17) {
    NOTIP();
    "The ball is out of reach..."
    //counter == 50 ONLY
  }
  else if (counter == 18) {
    TIPFLOW_suspense();
    "It bounces from the top of the rim and inches towards the net..."
    //references passed in tip values
    //counter == 15
    //counter == 16
  }
  else if (counter == 19) {
    INBOUNDFLOW();
    "The defender looks around, desperately trying to find an open teammate to pass to..."
    //counter == 20
    //counter == 23
  }
  else if (counter == 20) {
    INBOUNDFLOW_pass();
    "The opponent finds the open man and throws tosses them the ball! It hangs in midair as both teams go for it...you extend your hand as far as you can..."
    //counter == 21
    //counter == 22
  }
  else if (counter == 21) {
    INBOUNDFLOW_steal();
    "You extend your hands and just barely grab the ball! It's a steal! You're off balance but you look around for a pass..."
    //counter == 7 ONLY
  }
  else if (counter == 22) {
    INBOUNDFLOW_lose();
    "You extend your hands and your fingers scrape the ball...but the opponent still catches it and cradles it to protect it"
    //counter == 50 ONLY
  }
  else if (counter == 23) {
    INBOUNDFLOW_violation_not_yet();
    "You aggresively pressure your opponent, he can't find any daylight to pass it out..."
    //counter == 24 ONLY
  }
  else if (counter == 24) {
    "Inbound violation! He couldn't inbound the ball in time!"
    //AUDIO: Whistle, cheer
    //counter == 25 ONLY  
  }
  else if (counter == 25) {
    "The referee hands you the ball as you stand on the sideline...you look for a teammate to pass it to..."
    //counter == 7 ONLY;
  }
  else if (counter == 26) {
    secondFreeThrow();
    "You take a deep breath, look up, and shoot your second free throw..."
    //counter == 4;
    //counter == 5;
  }
  else if (counter == 27) {
    missedRebound()
    "He grabs the rebound, lowers his body and desperately protects the ball as the clock runs out..."
    //counter == 50 ONLY;
  }
  else if (counter == 50) {
    finalscore();
    "   HOME         AWAY"
    "YOURSCORE vs THEIRSCORE"
    
    //if Home<Away
    "You lose..."
    //if Home==Away
    "Overtime!"
    //if Home>Away
    "You win!"
    
    "Press Space to Play Again"
    
    //counter 1
  }
}
*/



//ALL FUNCTIONS
/*void start_1() {
  text("2 Freethrows left (1.1)", width/2, height/2);
}
void room2() {
  text("1st FT: MISS (2.1)", width/2, height/2);
  //text("Press Y or N", width/2, height/2+50);
}
void room3() {
  text("2nd FT: MISS (3.1)", width/2, height/2);
}
void room4() {
  text("Grab rebound", width/2, height/2);
}

int rollTwo(int first, int second){
  float theRoll = random(0,100);
  if (theRoll <= first){
    return 1;
  }
  else
    return 0;
}

void rollThree(int first, int second, int third){
  
}

void showScore(){
  float scoreX = width/2;
  float scoreY = height/4;
  text(yourScore+ "   " + oppScore, scoreX, scoreY);
  text("HOME    AWAY", scoreX, scoreY + 20);
}

void changeScore(){
  //flash red, blink a bit? vibrate?
}

void showSpaceContinue(String dothis){
  float contX = width/2;
  float contY = height*7/8;
  text("Press SPACE to " + dothis + "...", contX, contY);
}
*/ 
