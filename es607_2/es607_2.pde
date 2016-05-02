PImage softball;
color c;
float red;
float green;
float blue;
char r = 'r';
char g = 'g';
char b = 'b';
boolean modified = false;

int[] redHist;
int[] greenHist;
int[] blueHist;

PImage bwFilter( PImage img) {
  for (int i = 0; i < img.width; i++) { 
    for (int j = 0; j < img.height; j++) {
      float brightness = brightness(img.get(i,j));
      if(brightness<127) {
        img.set(i,j,color(0));
      } else {
        img.set(i,j,color(255));
      }      
    }
  }
  return img;
}

int divide;


void setup() {
  softball = loadImage("barcelona.jpg"); 
  size( 810, 530);
}

void draw() {
  background(0);
  image(softball, 0, 0, 860, 570);
  bwFilter(softball);
  
/*  
for(int i=0; i<hist.length; i++) {
    System.out.print(hist[i]+" ");
  }
  
  System.out.println();   
*/
  
}

void mousePressed() {
       
  color pixel;
  color newPixelColor;
  
  if(modified) {
     softball = loadImage("barcelona.jpg"); 
   } else {
     for (int i = 0; i < softball.width; i++) { 
       for (int j = 0; j < softball.height; j++) {
         pixel = softball.get(i,j);
         newPixelColor = color(red(pixel)*2, green(pixel)*2, blue(pixel)*2);
         softball.set(i,j,newPixelColor);
        }
     }
   }
   
   modified = !modified;
}