class Pause extends Button {

  public Pause(int x, int y, float dim1, float dim2, char shape) {
    super(x, y, dim1, dim2, shape);
  }

  public void display() {
    super.display();
    rect(x-this.width/5, y, this.width/7, this.height/1.7);
    rect(x+this.width/5, y, this.width/7, this.height/1.7);
  }

  public void action(ddf.minim.AudioPlayer song) {
    if (isOver()) {
      song.pause();
    }
  }
}