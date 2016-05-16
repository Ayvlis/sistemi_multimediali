import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Pause pause;
Play play;
Rewind rewind;

Minim minim;
AudioPlayer song;
void setup() {
  size(100, 100);
  minim = new Minim(this);
  song = minim.loadFile("machinae.mp3");
  pause = new Pause(width/2, height/2, 20, 20, 'r');
  play = new Play(width/4, height/2, 20, 20, 'r');
  rewind = new Rewind(3*width/4, height/2, 20, 20, 'r');
  
}
void draw() {
  rectMode(CENTER);
  noFill();
  play.display();
  pause.display();
  rewind.display();
  
  
}

void mousePressed() {
  pause.action(song);
  play.action(song);
  rewind.action(song);
  
}



/* ???

void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

*/