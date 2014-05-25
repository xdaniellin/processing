boolean microphone = false;
float faceControl = 0;

//Classes
Flyer flyer;
Horizon horizon;


void setup(){
 size(1024,768); 
 flyer = new Flyer(200);
 horizon = new Horizon();
 setupVolume();
}

void draw(){
    background(255,255,255);
  
    horizon.display();
    //sky.display();
    flyer.displayBody();
    flyer.displayHead();

    getVolume();
      if(microphone = true){
        faceControl = map(micInput, 0, 1, 0, 5);
        //println(faceControl);
      }
      else{faceControl = mouseX;}

}
