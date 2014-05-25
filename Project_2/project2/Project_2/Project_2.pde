/*
This is my Collage project. My 'stickers' are each mapped to different keyboard keys such that:
  - The top row are for the large [STATUE/DEITY] stickers (keys 1-5)
  - The next row are for the [MASK] stickers (keys q-y)
  - The row below that are for the [JELLYFISH] stickers (keys a-f)
  - The bottom row are for miscellaneous objects (keys z-c)
  - The UP and DOWN arrow keys are for [SIZE ADJUSTMENT] of the sticker you are about to place 
Some ideas I wanted to play around with in this 'bizarre fantasy' included cultural deities, the contrast between neuron networks and jellyfish forests, and the contrast between shapes found in nature or in strict geometric form.  

*/


PImage bonsai, hexOrb, jellyfish, jellyfish2, jellyfish3, jellyfish4, mask1, mask2, mask3, mask4, mask5, mask6, owl, statue, statue2, statue3, statue4, statue5, bg;
String selectedStamp = "jellyfish4"; //default selectedStamp
PGraphics b;
float multiplier = 1.0;

void setup() {
  size(1024, 768);
  background(180, 0, 0);
  imageMode(CENTER);
  //snake = loadImage("snake.gif");
  bonsai = loadImage("/img/bonsai.png");
  hexOrb = loadImage("/img/hexOrb.png");
  jellyfish = loadImage("/img/jellyfish.png");
  jellyfish2 = loadImage("/img/jellyfish2.png");  
  jellyfish3 = loadImage("/img/jellyfish3.png");
  jellyfish4 = loadImage("/img/jellyfish4.png");
  mask1 = loadImage("/img/mask1.png");
  mask2 = loadImage("/img/mask2.png");
  mask3 = loadImage("/img/mask3.png");
  mask4 = loadImage("/img/mask4.png");
  mask5 = loadImage("/img/mask5.png");
  mask6 = loadImage("/img/mask6.png");
  owl = loadImage("/img/owl.png");
  statue = loadImage("/img/statue.png");
  statue2 = loadImage("/img/statue2.png");
  statue3 = loadImage("/img/statue3.png");
  statue4 = loadImage("/img/statue4.png");
  statue5 = loadImage("/img/statue5.png");
  bg = loadImage("/img/bg.jpg");
  multiplier = 1.0;

  b = createGraphics(width, height);
  
  b.beginDraw();
  b.imageMode(CENTER);
  b.clear();
  b.endDraw();
}


void draw() {
  background(255);
  image(bg,width/2,height/2,1500,1000);
  image(b, width/2, height/2);
  if (selectedStamp == "bonsai") {
    image(bonsai, mouseX, mouseY,  226*multiplier,  174*multiplier);
  }
  if (selectedStamp == "hexOrb") {
    image(hexOrb, mouseX, mouseY,  140*multiplier,  140*multiplier);
  }
  if (selectedStamp == "jellyfish") {
    image(jellyfish, mouseX, mouseY, 70*multiplier, 50*multiplier);
  }
  if (selectedStamp == "jellyfish2") {
    image(jellyfish2, mouseX, mouseY,  80*multiplier,  80*multiplier);
  }
  if (selectedStamp == "jellyfish3") {
    image(jellyfish3, mouseX, mouseY,  60*multiplier,  100*multiplier);
  }
  if (selectedStamp == "jellyfish4") {
    image(jellyfish4, mouseX, mouseY,  80*multiplier,  120*multiplier);
  }
  if (selectedStamp == "mask1") {
    image(mask1, mouseX, mouseY,  166*multiplier,  260*multiplier);
  }
  if (selectedStamp == "mask2") {
    image(mask2, mouseX, mouseY,  200*multiplier,  251*multiplier);
  }
  if (selectedStamp == "mask3") {
    image(mask3, mouseX, mouseY,  428*multiplier,  613*multiplier);
  }
  if (selectedStamp == "mask4") {
    image(mask4, mouseX, mouseY,  467*multiplier,  503*multiplier);
  }
  if (selectedStamp == "mask5") {
    image(mask5, mouseX, mouseY,  334*multiplier,  656*multiplier);
  }
  if (selectedStamp == "mask6") {
    image(mask6, mouseX, mouseY,  330*multiplier,  500*multiplier);
  }
  if (selectedStamp == "owl") {
    image(owl, mouseX, mouseY,  404*multiplier,  309*multiplier);
  }
  if (selectedStamp == "statue") {
    image(statue, mouseX, mouseY,  1300*multiplier,  723*multiplier);
  }
  if (selectedStamp == "statue2") {
    image(statue2, mouseX, mouseY,  (187*3)*multiplier, (167*3)*multiplier);
  }
  if (selectedStamp == "statue3") {
    image(statue3, mouseX, mouseY,  1152*multiplier,  800*multiplier);
  }
  if (selectedStamp == "statue4") {
    image(statue4, mouseX, mouseY,  611*multiplier,  473*multiplier);
  }
  if (selectedStamp == "statue5") {
    image(statue5, mouseX, mouseY,  623*multiplier,  237*multiplier);
  }
  
  //println(selectedStamp);
  //println(multiplier);

}


void mousePressed() {
  b.beginDraw();
  if (selectedStamp == "bonsai") {
    b.image(bonsai, mouseX, mouseY, 226*multiplier, 174*multiplier);
  }
  if (selectedStamp == "hexOrb") {
    b.image(hexOrb, mouseX, mouseY,140*multiplier, 140*multiplier);
  }
  if (selectedStamp == "jellyfish") {
    b.image(jellyfish, mouseX, mouseY, 70*multiplier, 50*multiplier);
  }
  if (selectedStamp == "jellyfish2") {
    b.image(jellyfish2, mouseX, mouseY, 80*multiplier, 80*multiplier);
  }
  if (selectedStamp == "jellyfish3") {
    b.image(jellyfish3, mouseX, mouseY, 60*multiplier, 100*multiplier);
  }
  if (selectedStamp == "jellyfish4") {
    b.image(jellyfish4, mouseX, mouseY, 80*multiplier, 120*multiplier);
  }
  if (selectedStamp == "mask1") {
    b.image(mask1, mouseX, mouseY, 166*multiplier, 260*multiplier);
  }
  if (selectedStamp == "mask2") {
    b.image(mask2, mouseX, mouseY, 200*multiplier, 251*multiplier);
  }
  if (selectedStamp == "mask3") {
    b.image(mask3, mouseX, mouseY, 428*multiplier, 613*multiplier);
  }
  if (selectedStamp == "mask4") {
    b.image(mask4, mouseX, mouseY, 467*multiplier, 503*multiplier);
  }
  if (selectedStamp == "mask5") {
    b.image(mask5, mouseX, mouseY, 334*multiplier, 656*multiplier);
  }
  if (selectedStamp == "mask6") {
    b.image(mask6, mouseX, mouseY, 330*multiplier, 500*multiplier);
  }
  if (selectedStamp == "owl") {
    b.image(owl, mouseX, mouseY, 404*multiplier, 309*multiplier);
  }
  if (selectedStamp == "statue") {
    b.image(statue, mouseX, mouseY, 1300*multiplier, 723*multiplier);
  }
  if (selectedStamp == "statue2") {
    b.image(statue2, mouseX, mouseY, (187*3)*multiplier, (167*3)*multiplier);
  }
  if (selectedStamp == "statue3") {
    b.image(statue3, mouseX, mouseY, 1152*multiplier, 800*multiplier);
  }
  if (selectedStamp == "statue4") {
    b.image(statue4, mouseX, mouseY, 611*multiplier, 473*multiplier);
  }
  if (selectedStamp == "statue5") {
    b.image(statue5, mouseX, mouseY, 623*multiplier, 237*multiplier);
  }
  b.endDraw();
}

void keyPressed() {
  if (key == 'a') {
    selectedStamp = "jellyfish";
  }
  if (key == 's') {
    selectedStamp = "jellyfish2";
  }
  if (key == 'd') {
    selectedStamp = "jellyfish3";
  }
  if (key == 'f') {
    selectedStamp = "jellyfish4";
  }
  if (key == 'q') {
    selectedStamp = "mask1";
  }
  if (key == 'w') {
    selectedStamp = "mask2";
  }
  if (key == 'e') {
    selectedStamp = "mask3";
  }
  if (key == 'r') {
    selectedStamp = "mask4";
  }
  if (key == 'y') {
    selectedStamp = "mask5";
  }
  if (key == 't') {
    selectedStamp = "mask6";
  }
  if (key == 'z') {
    selectedStamp = "bonsai";
  }
  if (key == 'x') {
    selectedStamp = "hexOrb";
  }
  if (key == 'c') {
    selectedStamp = "owl";
  }
  if (key == '1') {
    selectedStamp = "statue";
  }
  if (key == '2') {
    selectedStamp = "statue2";
  }
  if (key == '3') {
    selectedStamp = "statue3";
  }
  if (key == '4') {
    selectedStamp = "statue4";
  }
  if (key == '5') {
    selectedStamp = "statue5";
  }
  
  //size adjustment
  if (key == CODED){
    if (keyCode == UP) {
      multiplier += .1;
    }
    if (keyCode == DOWN) {
      multiplier -= .1;
    }
  }
}

