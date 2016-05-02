int temperature;
String condition;
String city;


void setup() {
 
   XML root = loadXML("weather.xml");
   XML result = root.getChild("results"); 
   XML channel     =   result.getChild("channel");                                   
   XML item        = channel.getChild("item");                                    
   XML yweather    = item.getChild("yweather:condition");                         
   temperature = int((yweather.getInt("temp")-32)*5.0/9.0); 
   condition = yweather.getString("text");
   city = channel.getChild("yweather:location").getString("city") + ", " + channel.getChild("yweather:location").getString("country");
   size(300,300);
    
}


void draw() {
  
  PFont font;
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("AvenirNext-Italic-48.vlw");
  textFont(font, 15);
 
  text("City :" + city,20, 20);
  text("temperature :" + temperature,20, 40);
  text("condition :" + condition,20, 60);
  
}