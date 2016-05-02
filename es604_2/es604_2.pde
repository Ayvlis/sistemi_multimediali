PImage barcelona;
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
        case 'r': col = int(red(barcelona.get(i, j)));
        break;
        case 'g': col = int(green(barcelona.get(i, j)));
        break;
        case 'b': col = int(blue(barcelona.get(i, j)));
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
  barcelona = loadImage("barcelona.jpg"); 
  size(810, 530);
}

void draw() {
  background(0);
  image(barcelona, 0, 0, 810, 530);
  redHist = computeHistogram(barcelona, r);
  greenHist = computeHistogram(barcelona, g);
  blueHist = computeHistogram(barcelona, b);
  
/*  
for(int i=0; i<hist.length; i++) {
    System.out.print(hist[i]+" ");
  }
  
  System.out.println();   
*/
  
  divide = max(redHist)/( height/3) +30; 
  pushMatrix();
  translate(0, height-10);
  for(int i=0; i<redHist.length; i++) {
    noStroke();
    fill(255,0,0);
    rect(i, 0, 1, -redHist[i]/divide);
  }
  popMatrix();
  
  pushMatrix();
  translate(0, height/3-10);
  for(int i=0; i<greenHist.length; i++) {
    noStroke();
    fill(0,255,0);
    rect(i, 0, 1, -greenHist[i]/divide);
  }
  popMatrix();
  
  pushMatrix();
  translate(0, 2*height/3-10);
  for(int i=0; i<blueHist.length; i++) {
    noStroke();
    fill(0,0,255);
    rect(i, 0, 1, -blueHist[i]/divide );
  }
  popMatrix();
  
}