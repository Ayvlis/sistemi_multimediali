Bomb bomb;
PVector vPos;
float dBomb;
int fuse;
int bombTimer;
int alfa = 150;


void setup() {
  size (1200, 700);
  vPos = new PVector(int(random(width-dBomb)), int(random(height-dBomb)));
  dBomb = 50;
  fuse = int(random(5, 20));
  bomb = new Bomb(dBomb, vPos, fuse);
  bombTimer = fuse*10;
}

void draw() {
  background(200);
  text(bombTimer, 20, 20);
  if (bombTimer==0) {   
    alfa-=2;
    if (alfa==0) {
      vPos = new PVector(int(random(width-dBomb)), int(random(height-dBomb)));
      fuse = int(random(5, 20));
      bomb = new Bomb(dBomb, vPos, fuse);
      bombTimer = fuse*10;
      alfa = 150;
    }
  } else {
    bombTimer--;
    bomb.fuse=int(bombTimer/10);
  }
  bomb.display();
}