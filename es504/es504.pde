boolean white = false;

void setup() {
  size(700,700);
   noStroke();
  translate(width/2, height/2);
  colorMode(HSB, 360,100,100);
  color c;
  for(int i=0; i<360; i++){
    
    c = color(i, 100, 100);
    fill(c);
    rotate(radians(1));
    rect(0, 0, 3, 200); 
        if(i == 23 || i == 203) {
      stroke(0);
      ellipse(0,190,10,10);
      noStroke();
      colorMode(RGB, 255, 255, 255);
      color c_2 = c;
      println(red(c_2));
      println(green(c_2));
      println(blue(c_2));
      colorMode(HSB, 360,100,100);
    }
      
  }
  
}

void draw() {
 
}