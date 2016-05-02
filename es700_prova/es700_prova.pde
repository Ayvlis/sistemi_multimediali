int temperature;
String condition;
String city;
int conditionCode;

PImage cityIcon;
PImage temperatureIcon;
PImage conditionIcon;

void setup() {
 
   XML root = loadXML("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22Udine%2C%20Italy%22)&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys");
   XML result = root.getChild("results"); 
   XML channel     =   result.getChild("channel");                                   
   XML item        = channel.getChild("item");                                    
   XML yweather    = item.getChild("yweather:condition");                         
   temperature = int((yweather.getInt("temp")-32)*5.0/9.0); 
   condition = yweather.getString("text");
   conditionCode = yweather.getInt("code");
   System.out.println(conditionCode);
   city = channel.getChild("yweather:location").getString("city") + ", " + channel.getChild("yweather:location").getString("country");
   size(300,300);
    
}


void draw() {
  
  PFont font;
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("AvenirNext-Italic-48.vlw");
  textFont(font, 15);
  
  String thermoIcon;
  String skyIcon = "clouds";
  
  if(temperature < 0) {
    thermoIcon = "thermometer-3";
  } else if(temperature < 15) {
    thermoIcon = "thermometer-2";
  } else if(temperature <35) {
    thermoIcon = "thermometer-1"; 
  } else {
    thermoIcon = "thermometer";
  }
  
  if(conditionCode <=4 || (conditionCode >=37 && conditionCode<=39) || conditionCode ==45 || conditionCode == 47) {
    skyIcon = "storm";
  } else if(conditionCode <=6 || (conditionCode >=8 && conditionCode <=12) || conditionCode == 18 || conditionCode == 40) {
    skyIcon = "rain-2";
  } else if(conditionCode <=17 || (conditionCode >=41 && conditionCode <=43) || conditionCode == 46) {
    skyIcon = "hail-1";
  } else if(conditionCode <=24) {
    skyIcon = "windy-8";
  } else if(conditionCode <= 28) {
    skyIcon = "clouds";
  } else if(conditionCode == 32 || conditionCode == 36) {
    skyIcon = "sun";
  } else if(conditionCode <=44) {
    skyIcon = "cloudy";
  }
  
  cityIcon = loadImage("icons/png/city.png");
  temperatureIcon = loadImage("icons/png/"+thermoIcon+".png");
  conditionIcon = loadImage("icons/png/"+skyIcon+".png");
  translate(width/6, height/2);
  image(cityIcon, 0, -75, 50, 50); 
  image(temperatureIcon, 0, -25, 50, 50); 
  image(conditionIcon, 0, 25, 50, 50); 
  textAlign(LEFT, CENTER);
  text(city,60, -50);
  text(temperature,60, 0);
  text(condition,60, 50);
  
}