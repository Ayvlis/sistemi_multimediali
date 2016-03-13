Particle p;
PVector vPos;
PVector vSpd;
PVector vAcc;
int m = 0;  //millis



void setup(){
  size(800,600);
  background(29,32,37);
  vPos = new PVector(400, random(300));
  vSpd = new PVector(1,1);
  vAcc = new PVector(0,0);
  p = new Particle(vPos,vSpd,vAcc);
}

void draw(){
  background(29,32,37);
  p.display();
  p.update();
  p.bounce();}