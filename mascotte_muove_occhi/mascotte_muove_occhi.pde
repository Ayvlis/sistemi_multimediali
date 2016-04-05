Mascotte mascotte;
PVector pos; 
float d;
color c;
PVector vel;

void setup() {
  size(1200, 600);
  pos = new PVector (width/2, height/2);
  d = 200;
  c = color(120, 236, 0);
  vel = new PVector(0, 0);
  mascotte = new  Mascotte(pos, d, c, vel);
}

void draw() { 
  background(200);
  mascotte.display();
  /*translate(width/2, height/2);
   float a = atan2(mouseY-height/2, mouseX-width/2);
   
   if(mouseX<width/2+10 && mouseX>width/2-10 && mouseY<height/2+10 && mouseY>height/2-10 ) {
   ellipse(mouseX-width/2, mouseY-height/2, 30, 30);
   }else {
   rotate(a);
   ellipse(10, 0, 30,30);
   }*/
}