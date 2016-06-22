class Food {
  private PImage image; 
  private boolean healthy;
  private PVector position;
  
  public Food(String name, boolean healthy) {
    image = loadImage(name);   
    this.healthy = healthy;
    position = new PVector(0,0);
  }
  
  public PImage getImage() {
    return image;
  }
  
  public boolean isHealthy() {
    return healthy;
  }
  
  public String toString() {
    return image+", "+"tostring";
  }
  
  public float getX() {
    return position.x;
  }
  
  public float getY() {
    return position.y;
  }
  
  public void setPosition(PVector position) {
    this.position = position;
  }
}