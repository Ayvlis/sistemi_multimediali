int cX = width/2 -50;
int cY = height/2 -10;

size(300,300);
stroke(150);
fill(150);
rect(cX, cY, 100, 40);
rect(cX+20, cY-30, 60, 30);
fill(0);
stroke(0);
strokeWeight(3);
line(cX+20, cY, cX+80, cY);
fill(255);
ellipse(cX+25, cY+40, 30, 30);
ellipse(cX+75, cY+40, 30, 30);