class Button {
  int x, y;
  float width, height;
  char shape;

  public Button(int x, int y, float dim1, float dim2, char shape) {
    this.x = x;
    this.y = y;
    this.width = dim1;
    this.height = dim2;
    this.shape = shape;
  }

  public void display() {
    if(shape == 'r') {
      rect(this.x, this.y, this.width, this.height);
    }
    if (shape == 'c') {
      ellipse(this.x, this.y, this.width, this.height);
    }
  }

  public boolean isOver() {
    if (mouseX>=x-this.width/2 && mouseX <= x+this.width/2 && mouseY>=y-this.height/2 && mouseY<= y+this.height/2) {
      return true;
    }
    return false;
  }
}