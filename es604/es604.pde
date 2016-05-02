PImage softball;
color c;
float red;
float green;
float blue;
char r = 'r';
char g = 'g';
char b = 'b';

int[] redHist;
int[] greenHist;
int[] blueHist;

int[] computeHistogram( PImage img, char channel) {
  int[] hist = new int[256];
  for (int i = 0; i < img.width; i++) { 
    for (int j = 0; j < img.height; j++) {
      int col;
      switch (channel) {
        case 'r': col = int(red(softball.get(i, j)));
        break;
        case 'g': col = int(green(softball.get(i, j)));
        break;
        case 'b': col = int(blue(softball.get(i, j)));
        break;
        default: return new int[0];
     }             
        hist[col]++;
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
  redHist = computeHistogram(softball, r);
  greenHist = computeHistogram(softball, g);
  blueHist = computeHistogram(softball, b);
  
/*  
for(int i=0; i<hist.length; i++) {
    System.out.print(hist[i]+" ");
  }
  
  System.out.println();   
*/
  
  divide = max(blueHist)/( height/3 ); 
  pushMatrix();
  translate(0, height);
  for(int i=0; i<redHist.length; i++) {
    noStroke();
    fill(255,0,0);
    rect(i, 0, 1, -redHist[i]/divide);
  }
  popMatrix();
  
  pushMatrix();
  translate(0, height/3);
  for(int i=0; i<greenHist.length; i++) {
    noStroke();
    fill(0,255,0);
    rect(i, 0, 1, -greenHist[i]/divide);
  }
  popMatrix();
  
  pushMatrix();
  translate(0, 2*height/3);
  for(int i=0; i<blueHist.length; i++) {
    noStroke();
    fill(0,0,255);
    rect(i, 0, 1, -blueHist[i]/divide);
  }
  popMatrix();
  
}