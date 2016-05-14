int d = 100;
float r = d/2;

void setup() {
  size(400,600);
}

void draw() {
  fill(200);
  translate(0,0);
  translate(width/2, height/3);
  
  /* head */
  fill(255);
  stroke(255);
  strokeWeight(0);
  ellipse(0,0, d, d);
  fill(50);
  stroke(50);
  strokeWeight(r/4);
  line(-r,0,-r,r);
  line(r,0,r,r);
  arc(0,0,d,d,PI,TWO_PI,CHORD);
  stroke(255);
  strokeWeight(0); 
  
  /* body */
  float dBody = 4*d/5;
  float dNeck = r/3.5;
  rectMode(CENTER);
  fill(150,0,0);
  stroke(150,0,0);
  translate(0,r);
  triangle(0,dNeck/2, -dBody/2, 3*dNeck/2, dBody/2, 3*dNeck/2 );
  translate(0,dBody/2);
  rect(0,3*dNeck/2, dBody, dBody);
    /* neck */  
    translate(0,-dBody/2);
    fill(255);
    stroke(255);
    rect(0,dNeck/2,dNeck,dNeck);
 
 /* arms */
   /* left */
 {
   translate( -dBody/2+r/7, 3*dNeck/2);
   fill(150,0,0);
   stroke(150,0,0);
   rotate(-3*QUARTER_PI/2);
   ellipse(0,0,r/3,r/3);
   rect(-dBody/2, 0, dBody, dNeck );
 }
  
  
}