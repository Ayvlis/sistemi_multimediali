import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Face face;
Food[] foods;
Food[] healthy = new Food[10];
Food[] unhealthy = new Food[5];
PImage bar;
PVector barPosition;
int barRandomCounter;
boolean barDisplay = false;
int fatLevel;
int force;
int currentMillis;
int healthyCount = 0;
int unhealthyCount = 0;
int time = 30;
int counter = 10;
boolean eyesMoving = false;
int eyesMovingLifeTime = 45;
boolean blinking = false;
int blinkLifeTime = 10;
int randomBlinkCounter = int(random(100, 200));
boolean eating = false;
int eatLifeTime = 15;
boolean lock;
boolean start = false;
boolean game = false;
boolean end = false;
boolean win = false;
boolean firstTime = true;
Minim minim;
AudioPlayer mindmap;

void setup() {
  colorMode(HSB, 360, 100, 100);
  minim = new Minim(this);
  mindmap = minim.loadFile("mindmap.wav");
  color orange = color(25, 100, 70);
  color blue = color(205, 80, 100);
  size(800, 700);
  pushMatrix();
  translate(width/2, height/2);
  textAlign(CENTER, CENTER);
  textSize(50);
  background(0,0,10);
  fill(blue);
  text("Healthy", 0, -60);
  textSize(25);
  fill(orange);
  text("il giusto... con gusto", 0, -15);
  textSize(20);
  fill(blue);
  text("presenta", 0, 50);
  popMatrix();
  face = new Face();
}

void draw() {
  colorMode(HSB, 360, 100, 100);
  color orange = color(25, 60, 90);
  color blue = color(205, 40, 90);
  color lightOrange = color(25, 8, 100);
  color darkBlue = color(205, 100, 4);

  if (millis() < 3000) {
    lock = true;
  } else if (!game && !end && !start) {
    game = false;
    end = false;
    start = true;
  }

  if (end) {
    background(blue);
    mindmap.pause();
    face.setPosition(new PVector(width/6, height/4));
    //face.update(blinking, eyesMoving, false);
    lock = true;
    fill(lightOrange); 
    stroke(orange);
    strokeWeight(3);
    pushMatrix();
    //translate(0,40);
    //rotate(radians(-5));
    rect(2*width/3, 2*height/7, 500, 300);
    //translate(-5,40);
    fill(darkBlue);
    textSize(40);
    text(win?"Hai vinto!!":"Hai perso.", 2*width/3, height/9);
    textSize(20);
    textLeading(70);
    text("\nEcco cosa hai mangiato:", 2*width/3, height/9);
    text("\n\nBuono", width/2, height/9 );

    int x = width/2-160;
    int y = 2*height/9+15; 
    PVector position; 

    for (int i=0; i<healthy.length; i++) {
      if (i==3 || i==8) {
        x -= 105;
        y += 45;
      } else if (i == 5) {
        x -= 105;
        y += 45;
      } else {
        x += 70;
      }

      position = new PVector(x, y);

      if (healthy[i]!=null) {
        healthy[i].setPosition(position); 
        healthy[i].getImage().resize(40, 40);
        healthy[i].display();
      }
    }
    text("\n\nCattivo", 8*width/10, height/9 );
    x = 8*width/10 -70;
    y = 2*height/9+15;
    for (int i=0; i<unhealthy.length; i++) {

      position = new PVector(x, y);

      if (unhealthy[i]!=null) {
        unhealthy[i].setPosition(position); 
        unhealthy[i].getImage().resize(50, 50);
        unhealthy[i].display();
      }
      
      if (i ==1) {
        x = 8*width/10 -20;
        y += 55;
      } else if (i == 2) {
        x = 8*width/10 -70;
        y += 55;
      } else {
        x += 100;
      }
    }

    fill(lightOrange); 
    stroke(orange);
    strokeWeight(3);
    rect(width/2, 5*height/7, 400, 150);
    fill(darkBlue);
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
      fill(25, 100, 100);
      text("Rigioca", width/2, 8*height/9);
      if (mousePressed) {
        game = true;
        end = false;
        counter = 10;
        firstTime = true;
        time = 30;
        healthy = new Food[10];
        unhealthy = new Food[5];
        healthyCount = 0;
        unhealthyCount = 0;
        fatLevel = 1;
        face.setMass(200);
        
      }
    }
    popMatrix();
  }

  if (start) {
    lock = true;
    background(blue);
    fill(lightOrange); 
    stroke(orange);
    strokeWeight(3);
    rectMode(CENTER);
    pushMatrix();
    //translate(0,40);
    //rotate(radians(-5));
    rect(2*width/3, height/2, 300, 450);
    //translate(-5,40);
    fill(darkBlue);
    text("Hai 30 secondi\ndi tempo per\nmangiare 10 cibi.\nMa attento a\nquello che scegli!", 2*width/3, height/3 );
    text("Gioca!", 2*width/3, 2*height/3 );
    if ( mouseX<2*width/3+40 
      && mouseX>2*width/3-40 
      && mouseY<2*height/3+20
      && mouseY>2*height/3-20) {
      fill(blue);
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
    textAlign(LEFT, TOP);
    textSize(20);
    text("cibi mancanti: "+counter, 0, 0);
    textAlign(CENTER, TOP);
    text(time, width/2, 0);
    textAlign(CENTER, CENTER);

    if (firstTime) {
      currentMillis = millis();
      face.setPosition(new PVector(width/2, height/2));
      fatLevel = 1;
      bar = loadImage("bar.png");
      foods = new Food[15];
      for (int i=0; i<15; i++) {

        String name = (i+1)+".png";
        PVector position = new PVector (random(width-60), random(height-60));

        if (i<5) {
          foods[i] = new Food(name, false);
        } else {
          foods[i] = new Food(name, true);
        }

        foods[i].getImage().resize(60, 60);
        foods[i].setPosition(position);
      }
      barRandomCounter = int(random(300, 500));
      mindmap.play(0);
      firstTime = false;
    }

    if ((millis()-currentMillis)/1000 == 1) {
      time--;
      currentMillis = millis();
    }

    for (int i=0; i<foods.length; i++) {

      if (face.position.x<foods[i].getX()+50 &&
        face.position.x>foods[i].getX() &&
        face.position.y<foods[i].getY()+50 &&
        face.position.y>foods[i].getY()) {

        if (foods[i].isHealthy()) {
          healthy[healthyCount] = foods[i];
          healthyCount++;
          counter--;
        } else {
          unhealthy[unhealthyCount] = foods[i];
          unhealthyCount++;
          if(fatLevel<3) {
            float newD = (6*face.getDiameter())/5;
            fatLevel++;
            face.setMass(newD);
          }
        }
        
        


        eating = true;
        Food[] temp = new Food[foods.length-1];

        for (int j=0; j<temp.length; j++) {
          if (j<i) {
            temp[j] = foods[j];
          }
          if (j>=i) {
            temp[j] = foods[j+1];
          }
        }

        foods = temp;
      }
    }
    
    for (int i=0; i<foods.length; i++) {
      foods[i].display();
    }
    
    if(barDisplay) {
      bar.resize(80,80);
      image(bar, barPosition.x, barPosition.y);
      
      if (face.position.x<barPosition.x+50 &&
        face.position.x>barPosition.x &&
        face.position.y<barPosition.y+50 &&
        face.position.y>barPosition.y) {
          barDisplay = false;
          barRandomCounter = int(random(300, 500));
          while(fatLevel>0) {
           float newD = (5*face.getDiameter())/6; 
           fatLevel--;
           face.setMass(newD);
           eating = true;
          }
        }
      
    } else if(barRandomCounter == 0){
      
      barPosition = new PVector (random(width-80), random(height-80));
      barDisplay = true;
      
    } else {
      println(barRandomCounter);
      barRandomCounter--;
    }

    if (counter == 0) {
      win = true;
    }

    if (time == 0) {
      win = false;
    }

    if (counter==0 || time==0) {
      end = true; 
      game = false;
    }
  }

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
    randomBlinkCounter--;
    if (randomBlinkCounter == 0) {
      blinking = true;
      randomBlinkCounter = int(random(100, 200));
    }
  }

  if (eating) {    
    eatLifeTime--;
    if (eatLifeTime == 0) {
      eating = false;
      eatLifeTime=15;
    }
  }

  if (start || end || game) {
    face.update(blinking, eyesMoving, eating);
  }
}

void keyPressed() {
  if (key == CODED && !lock) {
   eyesMoving = true;
   println(fatLevel);
   
   switch (fatLevel) {
     case 0: force = 90;
             break;
     case 1: force = 60;
             break;
     case 2: force = 50;
             break;
     case 3: force = 40;
             break;
   }
   
    if (keyCode == RIGHT) {
      face.applyForce(new PVector(force, 0));
    } else if (keyCode == LEFT) {
      face.applyForce(new PVector((-1)*force, 0));
    } else if (keyCode == UP) {
      face.applyForce(new PVector(0, -1*force));
    } else if (keyCode == DOWN) {
      face.applyForce(new PVector(0, force));
    }
  }
}