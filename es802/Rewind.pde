class Rewind extends Button {

  public Rewind(int x, int y, float dim1, float dim2, char shape) {
    super(x, y, dim1, dim2, shape);
  }

  public void display() {
    super.display();
    triangle(x+this.width/3, y-this.height/3, x+this.width/3, y+this.height/3, x, y);
    triangle(x-this.width/10, y-this.height/3, x-this.width/10, y+this.height/3, x-this.width/3, y);
  }

  public void action(ddf.minim.AudioPlayer song) {
    if (isOver()) {
      song.rewind();
    }
  }
}