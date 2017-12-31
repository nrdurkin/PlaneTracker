PImage map;
boolean NAVAL = true;

float ascentLength;

//1000m = 26 pixels
Textbox heading = new Textbox(500, 150, "Heading");
Textbox airspeedAscent = new Textbox(500, 200, "Ascent Airspeed");
Textbox ascentRate = new Textbox(500, 230, "Ascent Rate");
Textbox failureTime = new Textbox(500, 260, "Time of Failure");
Textbox airspeedDescent = new Textbox(500, 290, "Descent Airspeed");
Textbox descentRate = new Textbox(500, 320, "Descent Rate");
Textbox windSpeed = new Textbox(500, 370, "Wind Speed");
Textbox windDir = new Textbox(500, 400, "Wind Direction");

ArrayList<Textbox> box = new ArrayList<Textbox>();

void setup() {
  size(600, 800);
  map = loadImage("data/map.png");
  map.resize(506*800/970, 800);
  box.add(heading);
  box.add(airspeedAscent);
  box.add(ascentRate);
  box.add(failureTime);
  box.add(airspeedDescent);
  box.add(descentRate);
  box.add(windSpeed);
  box.add(windDir);
}


void draw() {
  background(255);
  image(map, 0, 0);
  switchTakeOff();
  displayTextbox();
  vectors();
}

void mousePressed() {
  if (mouseX>450&&mouseX<550) {
    if (mouseY>20&&mouseY<80) {
      if (mouseX<500)NAVAL=true;
      else NAVAL=false;
    }
  }
  heading.select();
  airspeedAscent.select();
  ascentRate.select();
  failureTime.select();
  airspeedDescent.select();
  descentRate.select();
  windSpeed.select();
  windDir.select();
}

void keyPressed() {
  if ((keyCode>=48&&keyCode<=57)||keyCode==46||key==BACKSPACE) {
    heading.update();
    airspeedAscent.update();
    ascentRate.update();
    failureTime.update();
    airspeedDescent.update();
    descentRate.update();
    windSpeed.update();
    windDir.update();
  }
  else if(keyCode==9){
    for(int i=0; i<8; i++){
     if(box.get(i).selected){
       if(i==7){
        heading.selected=true;
        windDir.selected=false;
       }
       else{
        box.get(i).selected=false;
        box.get(i+1).selected =true;
        break;
       }
     }
     if(i==7)heading.selected=true;
    }
  }
}