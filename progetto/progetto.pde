Face face;
boolean eyesMoving = false;
int eyesMovingLifeTime = 45;
boolean blinking = false;
int blinkLifeTime = 10;
int randomBlink = int(random(100, 200));
int randomBlinkCounter = 0;
boolean eating = false;
int eatLifeTime = 15;
boolean lock;
boolean start = false;
boolean game = false;
boolean end = false;
boolean win = false;
boolean firstTime = true;


void setup() {
  size(800, 700);
  pushMatrix();
  translate(width/2, height/2);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("Healthy", 0, -60);
  textSize(25);
  text("il giusto... con gusto", 0, -15);
  textSize(20);
  text("presenta", 0, 50);
  popMatrix();
  face = new Face();
}

void draw() {
  colorMode(HSB, 360, 100, 100);
  color orange = color(25, 60, 90, 230);
  color blue = color(205, 40, 90);

  if (millis() < 000) {
    lock = true;
  } else if (!game && !end && !start) {
    game = false;
    end = false;
    start = true;
  }

  if (end) {
    background(blue);
    face.setPosition(new PVector(width/6, height/4));
    //face.update(blinking, eyesMoving, false);
    lock = true;
    fill(orange);
    pushMatrix();
    //translate(0,40);
    //rotate(radians(-5));
    rect(2*width/3, height/4, 500, 250);
    //translate(-5,40);
    fill(0);
    textSize(30);
    text(win?"Hai vinto!!":"Hai perso.", 2*width/3, height/9);
    textSize(20);
    textLeading(60);
    text("\nEcco cosa hai mangiato:", 2*width/3, height/9);
    text("\n\nBuono", 5*width/10, height/9 );
    text("\n\nCattivo", 8*width/10, height/9 );
    textLeading(20);
    text("cibo1\ncibo2\ncibo3\ncibo4\ncibo5", 8*width/10, 2*height/7 );
    fill(orange);
    rect(width/2, 5*height/7, 400, 150);
    fill(0);
    textSize(40);
    text("www.healthy.com", width/2, 9*height/13);
    textSize(20);
    text("Visita il sito!", width/2, 7*height/9);
    textSize(15);
    text("Rigioca", width/2, 8*height/9);
    
    
    if (mouseX<width/2+20 
      && mouseX>width/2-20 
      && mouseY<8*height/9+10
      && mouseY>8*height/9-10) {
      println("nell'if!");
      fill(25, 100, 100);
      text("Rigioca", width/2, 8*height/9);
      if(mousePressed) {
        game = true;
        end = false;
      }
    }
    popMatrix();
  }

  if (start) {
    lock = true;
    background(blue);
    fill(orange); 
    rectMode(CENTER);
    pushMatrix();
    //translate(0,40);
    //rotate(radians(-5));
    rect(2*width/3, height/2, 300, 450);
    //translate(-5,40);
    fill(0);
    text("Hai 20 secondi\ndi tempo per\nmangiare 10 cibi.\nMa attento a\nquello che scegli!", 2*width/3, height/3 );
    text("Gioca!", 2*width/3, 2*height/3 );
    if ( mouseX<2*width/3+40 
      && mouseX>2*width/3-40 
      && mouseY<2*height/3+20
      && mouseY>2*height/3-20) {
      println("nell'if!");
      fill(205, 100, 100);
      text("Gioca!", 2*width/3, 2*height/3 );
      if (mousePressed) {
        game = true;
        start = false;
      }
    }
    popMatrix();
  }

  if (game) {
    background(blue);
    lock=false;
    if (firstTime) {
      face.setPosition(new PVector(width/2, height/2));
      firstTime = false;
    }
    
  }



  //  face.update(blinking, eyesMoving, false);



  if (eyesMoving) {    
    eyesMovingLifeTime--;
    if (eyesMovingLifeTime == 0) {
      eyesMoving = false;
      eyesMovingLifeTime=30;
    }
  }

  if (blinking) {    
    blinkLifeTime--;
    if (blinkLifeTime == 0) {
      blinking = false;
      blinkLifeTime=10;
    }
  } else {
    randomBlinkCounter++;
    if (randomBlinkCounter == randomBlink) {
      blinking = true;
      randomBlink = int(random(100, 200));
      randomBlinkCounter = 0;
    }
  }

  if (start || end || game) {
    face.update(blinking, eyesMoving, false);
  }
}

void keyPressed() {
  if (key == CODED && !lock) {
    eyesMoving = true;
    if (keyCode == RIGHT) {
      face.applyForce(new PVector(20, 0));
    } else if (keyCode == LEFT) {
      face.applyForce(new PVector(-20, 0));
    } else if (keyCode == UP) {
      face.applyForce(new PVector(0, -20));
    } else if (keyCode == DOWN) {
      face.applyForce(new PVector(0, 20));
    }
  }

  if ( key == 'b') {
    float newD = (6*face.getDiameter())/5;
    face.setMass(newD);
  }

  if ( key == 's') {
    float newD = (5*face.getDiameter())/6; 
    face.setMass(newD);
  }
}