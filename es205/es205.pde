Particle p;
PVector vPos;
PVector vVel;
PVector vAcc;
float previousTime;



void setup(){
  size(900,500);
  background(0);
  vPos = new PVector(400, random(300));
  vVel = new PVector(random(-2,3), random(-2,3));
  vAcc = new PVector(0,12);
  p = new Particle(vPos,vVel,vAcc);
  previousTime = millis();
}

void draw(){
  float timeElapsed = millis() - previousTime;
  previousTime = millis();
  background(0);
  p.display();
  p.update(timeElapsed/1000.0);
  p.bounce();

}