import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Button button;

Minim minim;
AudioPlayer song;
void setup() {
  size(100, 100);
  minim = new Minim(this);
  song = minim.loadFile("dingdong.wav");
  button = new Button(width/2, height/2, 20, 20, 'r');
  
}
void draw() {
  rectMode(CENTER);
  fill(100); 
  button.display();
  
}

void mousePressed() {
  if(button.isOver()) {
    song.play(0);
  }
}



/* ???

void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

*/