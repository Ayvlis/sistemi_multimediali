int x = 0;
float previousTime;
Triangle cucco;
float windx = 100;
float windy = 400;
PVector wind = new PVector(100,400);

/*void setup()
{
  size(200, 200);
  background(255);
  noStroke();

  // draw the original position in gray
  fill(192);
  rect(20, 20, 40, 40);
  
  // draw a translucent red rectangle by changing the coordinates

  
  // draw a translucent blue rectangle by translating the grid
  fill(0, 0, 255, 128);
  translate(60, 80);


}

void draw() {
    rect(20, 20, 40, 40);
}
*/



void setup() {
  size(1200, 800);
  // wind = new PVector(5,0);
  PVector position = new PVector(0,0);
  PVector velocity = new PVector(0,0); 
  previousTime = 0;
  cucco = new Triangle(position, velocity);
   
  
  
}

void draw() {
  float timeElapsed = millis()-previousTime;
  previousTime = millis();
  background(100, 100, 110);
  translate(wind.x, wind.y);
  line(-200,0, 200,0);
  line(0,-200, 0,200);
  cucco.display();

 // 

}

void keyPressed() {
  if (key == 'z' ) {
      wind.x+=100;
  }
  if (key == 'x' ) {
      wind.x-=100;
  }
}