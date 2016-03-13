Particle[] particleArray;
PVector vPos;
PVector gravity;
PVector wind;
float previousTime;
float[] mass;
final int particleNumber = 10;

void setup(){

  size(1200,700);
  background(0);
  
  particleArray = new Particle[particleNumber]; 
  mass = new float[particleNumber];
   
  gravity = new PVector(0,10);
  wind = new PVector(5,0);

  vPos = new PVector(width/2, height/2);
 
  
  for (int i=0; i <particleNumber; i++) {
    mass[i] = random(10, 20);
    particleArray[i] = new Particle(vPos,mass[i]);
  }
   previousTime = 0;

}

void draw(){
  
  float timeElapsed = millis()-previousTime;
  previousTime = millis();
  background(29,32,37);
  
  for (Particle particle : particleArray) {
      System.out.println("Particle Mass before: " + particle.mass);
      particle.applyForce(gravity);
      particle.applyForce(wind);
      System.out.println("Particle Mass after: " + particle.mass);
      particle.bounce();
      particle.update(timeElapsed/1000.0);
      particle.display();
  }

}