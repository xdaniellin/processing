void keyPressed() {
  println(counter);
  if (key == 'p') {counter = 1;yourScore = int(random(80,130));oppScore = yourScore + 2;heShoots = false;}
  
    if (counter == 1){
      if (key == ' '){
        if (rollTwo(50,50) == 1) {counter = 2;}
        else {yourScore++; counter = 3;}
      }
    }
    else if (counter == 2){
      if (key == ' '){counter = 26;}
    }
    else if (counter == 3){
      if (key == ' '){counter = 26;}
    }
    else if (counter == 26){
      if (key == ' '){
        if (rollTwo(50,50) == 1)
          {counter = 4;}
        else 
          {yourScore++; counter = 5;}
      }
    }
    else if (counter == 4){
      if (key == ' '){
        if (rollTwo(50,50) == 1){counter = 6;}
        else {yourScore++; counter = 27;}
      }
    }
    else if (counter == 5){
      if (key == ' '){counter = 19;}
    }
    else if (counter == 6){
      if (key == ' '){counter = 7;}
    }
    else if (counter == 7){
      if (key == 'a'){counter = 8;}
      else if (key == 'b'){counter = 9;}
      else if (key == 'c'){counter = 10;}
    }
    else if (counter == 8){
      if (key == ' '){
        if (heShoots = false){text("HE SHOOTS! ...", width/2, height/2 + 60);}
        else {
          if (rollTwo(33,66) == 0){counter = 12; heShoots=false; longRange=true;}
          else {counter = 13; yourScore += 3; heShoots=false;}
        }
      }
    }
    else if (counter == 9){
      if (key == ' '){
        if (heShoots = false){text("HE SHOOTS! ...", width/2, height/2 + 60);}
        else  {  
          if (rollTwo(40,60) == 0){counter = 12; heShoots=false; midRange=true;}
          else {counter = 13; yourScore += 2; heShoots=false;}
        }
      }
    }
    else if (counter == 10){
      if (key == ' '){
        if (heShoots = false){text("HE SHOOTS! ...", width/2, height/2 + 60);}
        else {
          if (rollTwo(50,50) == 0){counter = 12; heShoots=false; shortRange=true;}
          else {counter = 13; yourScore += 2; heShoots=false;}
        }  
      }
    }
    /*else if (counter == 11){
      if (key == ' '){
      }
    }*/
    else if (counter == 12){
      if (key == ' '){
        /*
        if (longRange == true){
        }
        else if (midRange == true){
        }
        else if (shortRange == true){
        }        // TIPPPPPPPPPPPS PROBABILITY
        */
        if (rollTwo(50,50) == 0){counter = 14;}
        else {counter = 17;}
      }
    }
    else if (counter == 13 || counter == 15 || counter == 16 || counter == 17 || counter == 22){
      if (key == ' '){counter = 50;}
    }
    /*else if (counter == 15){
      if (key == ' '){
        // TO DO ODTO DOTOD TODO TODTO DOT O
         if (longRange == true){text("Such a long shot causes it to bounce far away", width/2, height/2); longRange=false;}
         else if (midRange == true){text("It rattles around, and bounces off the top of the rim", width/2, height/2); midRange=false;}
         else if (shortRange == true){text("It kisses the side of the rim, and bumps just to the side", width/2, height/2); shortRange=false;}
         tipMake = longRangeTip;
         tipMiss = 100 - longRangeTip;
         tipValue = rollTwo(tipMake,tipMiss);
         if (tipValue == 1){counter = 15;}
         else {counter = 16; yourScore += 2;}
      }
    }*/
    else if (counter == 18){
      if (key == ' '){
        if (rollTwo(50,50) == 1) {counter = 15;}
        else {counter = 16; yourScore += 2;}
      }
    }
    else if (counter == 14){
      if (key == ' '){counter = 18;}
    }
    else if (counter == 19){
      if (key == ' '){
        if (rollTwo(50,50) == 1) {counter = 20;}
        else {counter = 23;}
      }
    }
    else if (counter == 20){
      if (key == ' '){
        if (rollTwo(50,50) == 1){counter = 21;}
        else {counter = 22;}
      }
    }
    else if (counter == 21){
      if (key == ' '){counter = 7;}
    }
    //22 goes to 50
    else if (counter == 23){
      if (key == ' '){counter = 24;}
    }
    else if (counter == 24){
      if (key == ' '){counter = 25;}
    }
    else if (counter == 25){
      if (key == ' '){counter = 7;}
      }
//moved up after 4
    else if (counter == 27){
      if (key == ' '){counter = 50;}
    }
    else if (counter == 50){
      if (key == ' '){counter = 1;yourScore = int(random(80,130));oppScore = yourScore + 2;heShoots = false;}
    }
}

