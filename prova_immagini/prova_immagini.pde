Food[] foods = new Food[7];


void setup() {
  size(500, 500);
 for(int i=0; i<7; i++) {
    String name = (i+1)+".png";
    PVector position = new PVector (random(width-60), random(height-60));
    print(name);
    foods[i] = new Food(name, true);
    foods[i].getImage().resize(60,60);
    foods[i].setPosition(position);
    image(foods[i].getImage(), foods[i].getX(), foods[i].getY());
  }
  
}
  
void draw() {
    

}