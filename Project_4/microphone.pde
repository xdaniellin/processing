import ddf.minim.*;

Minim minim;
AudioInput in;

float micInput;

void setupVolume() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 1024);
}

void getVolume() {
  micInput = in.right.level();  // Read the microphone input
}

