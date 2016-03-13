Particle attractor;
Particle p;
PVector vPos;
float previousTime;

void setup(){
  size(1200,700);
  background(0);
  
  PVector attractorPosition = new PVector(900, 300);
  float attractorMass = 10;
  attractor = new Particle(attractorPosition, attractorMass);  
  
  PVector pPosition = new PVector(800, 600);
  float pMass = 4;
  p = new Particle(pPosition, pMass);
  
  previousTime = millis();

}

void draw(){
  
  float timeElapsed = millis()-previousTime;
  previousTime = millis();
  background(29,32,37);
  
  attractor.display();
  p.update(timeElapsed);
  p.attraction(attractor);
  System.out.println("p position: " +p.position);
  p.display();

}