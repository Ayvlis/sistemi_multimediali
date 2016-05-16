import processing.video.*;

float frame;
float duration;

Movie movie; // Step 1. Declare Movie object
void setup() {
 size(320,240);
 // Step 2. Initialize Movie object
 movie = new Movie(this, "cat.mov"); // Movie file should be in data folder
 // Step 3. Start movie playing
 movie.loop();
 duration = movie.duration();
}
void draw() {
 frame = (duration*mouseX/width);
 // Step 4. Read new frames from movie
 if ( movie.available())
 movie.read();
 movie.jump(frame);

 // Step 5. Display movie.
 image(movie,0,0);
}