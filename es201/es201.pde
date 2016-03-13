Particle p;
PVector vPos;
PVector vVel;
int m;  //millis



void setup(){
  size(900,500);
  background(0);
  vPos = new PVector(width/2,height/2);
  vVel = new PVector(random(-2,3), random(-2,3));
  p = new Particle(vPos,vVel);
}

void draw(){
  //background(0);
  p.display();
  p.update(millis()-m);
  m = millis();
}