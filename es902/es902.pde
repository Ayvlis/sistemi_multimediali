import processing.video.*;

float frame, duration;
int x, y, frameNumber;

Movie movie; // Step 1. Declare Movie object
void setup() {
  size(1200, 700);
  // Step 2. Initialize Movie object
  movie = new Movie(this, "cat.mov"); // Movie file should be in data folder
  // Step 3. Start movie playing
  movie.loop();
  if ( movie.available())
    movie.read();
  duration = movie.duration();
  frame = 0;
  movie.jump(frame);
  x = 0;
  y = 0;
  //image(movie, x, y, 64, 48);
}
void draw() {
  // Step 4. Read new frames from movie
  movie.read();
  x = x+64;
  if(x>width) {
    x = 0;
    y = y+48;
  }
  // Step 5. Display movie.
  image(movie, x, y, 64, 48);
}