Particle p;
PVector vPos;
PVector vVel;
PVector vAcc;
int m = 0;  //millis



void setup(){
  size(900,500);
  background(0);
  vPos = new PVector(400, random(300));
  vVel = new PVector(random(-2,3), random(-2,3));
  vAcc = new PVector(0,0);
  p = new Particle(vPos,vVel,vAcc);
}

void draw(){
  background(0);
  p.display();
  p.update();
  p.bounce();
  m = millis();

}