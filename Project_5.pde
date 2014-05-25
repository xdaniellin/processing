Ani cat, catGYM, catMUSIC, catFOOD, catFOOD2, catFOOD3, catFOOD4, catFOOD5, catFOOD6, catMUSIC2, catMUSIC3;
Cloud cloudFOOD, cloudGYM, cloudMUSIC;
int tintValue;
int hoverTintGYM, hoverTintMUSIC, hoverTintFOOD;
int breatheRate = 59;

void setup() {
  size(1024, 576);
  //frameRate(30);
  cat = new Ani(0, 0, "tmp", 100);
  catGYM = new Ani(325,120, "catGYM", 2);
  catGYM.resize(0.60);
  catMUSIC =  new Ani(width/2+60,height/2-150, "catMUSIC", 2);
  catMUSIC.resize(0.20);  
  catFOOD = new Ani(600,280, "catFOOD", 2);
  catFOOD2 = new Ani(400,100, "catFOOD", 2);
  catFOOD3 = new Ani(900,380, "catFOOD", 2);
  catFOOD4 = new Ani(100,450, "catFOOD", 2);
  catFOOD5 = new Ani(20,190, "catFOOD", 2);
  catFOOD6 = new Ani(900,-30, "catFOOD", 2);
  catMUSIC2 = new Ani(220,330, "catMUSIC", 2);
  catMUSIC3 = new Ani(width/2-40,height/2-100, "catMUSIC", 2);
  catFOOD.resize(0.5);
  catFOOD2.resize(0.3);
  catFOOD3.resize(0.2);
  catFOOD4.resize(0.8);
  catFOOD5.resize(0.15);
  catFOOD6.resize(0.3);
  catMUSIC2.resize(0.4);
  //frameRate(60);
  cloudMUSIC = new Cloud(840,70,30,"cloudMUSIC.png");
  cloudFOOD = new Cloud(80,60,50,"cloudFOOD.png");
  cloudGYM = new Cloud(10,250,35,"cloudGYM.png");
} 

void draw() { 
  tint(255,255);
  cat.display(breatheRate);
  tint(255,tintValue);
  cloudFOOD.display();
    cloudFOOD.resize(0.3);
    cloudFOOD.tintz(tintValue);
     if (overImage(cloudFOOD.getX(), cloudFOOD.getY(), cloudFOOD.getCloudWidth(), cloudFOOD.getCloudHeight()) == true) 
    {  tint(255,hoverTintFOOD);
       if(hoverTintFOOD<255)
       {hoverTintFOOD += 10;
       }
       catFOOD.display(200);
       catFOOD2.display(80);
       catFOOD3.display(300);
       catFOOD4.display(250);
       catFOOD5.display(50);
       catFOOD6.display(100);
       if(breatheRate > 1)
       {  breatheRate -= 4;
       }  
    }
    if (hoverTintFOOD > 0)
    { if (breatheRate < 59)
      {  breatheRate++; 
      }
      tint(255,hoverTintFOOD);
      hoverTintFOOD -= 5;
      catFOOD.display(200);
    }  
    tint(255,tintValue);
    
  cloudGYM.display();
    cloudGYM.resize(0.37);
    cloudGYM.tintz(tintValue);
    if (overImage(cloudGYM.getX(), cloudGYM.getY(), cloudGYM.getCloudWidth(), cloudGYM.getCloudHeight()) == true) 
    {  tint(255,hoverTintGYM);
       if(hoverTintGYM<255){
       hoverTintGYM += 10;}
       catGYM.display(200);
       if(breatheRate > 1)
       {  breatheRate -= 4;
       }  
    }
    if (hoverTintGYM > 0)
    { if (breatheRate < 59)
      {  breatheRate++; 
      }
      tint(255,hoverTintGYM);
      hoverTintGYM -= 5;
      catGYM.display(200);
    }  
    tint(255,tintValue);
  
  cloudMUSIC.display();
    cloudMUSIC.resize(0.32);
    cloudMUSIC.tintz(tintValue);
     if (overImage(cloudMUSIC.getX(), cloudMUSIC.getY(), cloudMUSIC.getCloudWidth(), cloudMUSIC.getCloudHeight()) == true) 
    {  tint(255,hoverTintMUSIC);
       if(hoverTintMUSIC<255)
       {hoverTintMUSIC += 10;
       }
       catMUSIC.display(200);
       catMUSIC2.display(100);
       catMUSIC3.display(150);
       if(breatheRate > 1)
       {  breatheRate -= 4;
       }  
    }
    if (hoverTintMUSIC > 0)
    { if (breatheRate < 59)
      {  breatheRate++; 
      }
      tint(255,hoverTintMUSIC);
      hoverTintMUSIC -= 5;
      catMUSIC.display(200);
    }  
    tint(255,tintValue);
  
  
  tintValue -= 5;
    if (tintValue < 1)
    {
      tintValue = 0;
    }
    else if (tintValue > 254)
    {
      tintValue = 255;
    }


}
  void mouseMoved(){
    tintValue += 10;
  }
    boolean overImage(int x, int y, int w, int h) {
    if ((mouseX > x) && (mouseX < x+w) && (mouseY > y) && (mouseY < y+h)) {
      return true;
    } 
    else {
      return false;
    }
  }
//on MOUSE MOVE, increase transparency of moving clouds to full
//on MOUSE STOP, decrease
//on MOUSE HOVER CLOUD, blur out other clouds



//make a cloud given an image.jpeg, random float speed, position
//take an image
//put white blur 
//crop it within cloud border (pimage? mask?)
//take float speed and make it bounce up and down 
//ON HOVER
  //Lights up
  //Border around cloud
  //other clouds transparency
  
//mic input to increase frame rate

//example clouds
  //
  
  //pusheen
  
  
//Questions: 
  //individually controlling frame rate?
  //setting your own pgraphic?image? cloud class
      //creating masks/viewing frames
      //hiding mouse cursor?
      

