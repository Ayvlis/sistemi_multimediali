PImage softball;
color c;
float red;
float green;
float blue;

int[] hist;

int[] computeHistogram( PImage img) {
  int[] hist = new int[256];
  for (int i = 0; i < img.width; i++) { 
    for (int j = 0; j < img.height; j++) {
      int red = int(blue(softball.get(i, j)));
      hist[red]++;
    }
  }
  return hist;
}

int divide;


void setup() {
  softball = loadImage("softball.JPG"); 
  size(530, 810);
}

void draw() {
  background(0);
  image(softball, 0, 0, 570, 860);
  hist = computeHistogram(softball);
  
/*  
for(int i=0; i<hist.length; i++) {
    System.out.print(hist[i]+" ");
  }
  
  System.out.println();   
*/
  
  divide = max(hist)/( height/2 );
  
  pushMatrix();
  translate(0, height);
  for(int i=0; i<hist.length; i++) {
    noStroke();
    fill(255,0,0);
    rect(i, 0, 1, -hist[i]/divide);
  }
  popMatrix();
  
}