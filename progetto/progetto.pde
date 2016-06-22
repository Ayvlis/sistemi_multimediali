Face face;
boolean eyesMoving = false;
int eyesMovingLifeTime = 30;

void setup() {
  size(800, 700);
  face = new Face();
  face.display(false, eyesMoving, true);
}
  
void draw() {
  background(200);
  face.update(false, eyesMoving, false);
  
    if (eyesMoving) {    
    eyesMovingLifeTime--;
    if (eyesMovingLifeTime == 0) {
      eyesMoving = false;
      eyesMovingLifeTime=30;
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    eyesMoving = true;
    if (keyCode == RIGHT) {
      face.applyForce(new PVector(10, 0));
    } else if (keyCode == LEFT) {
      face.applyForce(new PVector(-10, 0));
    } else if (keyCode == UP) {
      face.applyForce(new PVector(0, -10));
    } else if (keyCode == DOWN) {
      face.applyForce(new PVector(0, 10));
    }
  }
    
    if( key == 'b') {
      float newD = (6*face.getDiameter())/5;
      face.setMass(newD);
    }
   
    if( key == 's') {
      float newD = (5*face.getDiameter())/6; 
      face.setMass(newD);
    }
} 
  