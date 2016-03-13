Particle p;
PVector vPos;
PVector gravity;
float previousTime;
float mass;

void setup(){
  size(1200,700);
  background(0);
  vPos = new PVector(width/2, height/2);
  mass=10;
  p = new Particle(vPos,mass);
  gravity = new PVector(0,10);
  

}

void draw(){
  float timeElapsed = millis() -previousTime;
  previousTime = millis();
  background(29,32,37);
  p.applyForce(gravity);
  p.bounce();
  p.update(timeElapsed);
  p.display();
}