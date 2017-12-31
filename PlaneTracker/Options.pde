void switchTakeOff() {
  rectMode(CORNERS);

  stroke(0);
  strokeWeight(1);
  if (NAVAL ==true)fill(0, 255, 0);
  else fill(255);
  rect(450, 20, 500, 80);
  if (NAVAL ==false)fill(0, 255, 0);
  else fill(255);
  rect(500, 20, 550, 80);


  fill(0);
  stroke(0);
  textAlign(CENTER, CENTER);
  textSize(12);
  text("Naval", 475, 50);
  text("Renton", 525, 50);

  stroke(255, 0, 0);
  strokeWeight(4);
  noFill();
  if (NAVAL)ellipse(226, 222, 15, 15);
  else ellipse(282, 721, 15, 15);
}

class Textbox {
  int x, y;
  String heading;
  String s;
  boolean selected;

  Textbox(int x_, int y_, String h_) {
    heading = h_;
    x=x_;
    y=y_;
    s="";
  }
  void display() {
    textAlign(RIGHT,CENTER);
    stroke(0);
    fill(0);
    textSize(9);
    text(heading,x-5,y+12);
    
    fill(255);
    stroke(0);
    strokeWeight(1);
    rectMode(CORNER);
    rect(x, y, 75, 25);
    
    fill(0);
    stroke(0);
    textAlign(LEFT,CENTER);
    if(heading.equals("Heading")||heading.equals("Wind Direction"))text(s+"°",x+3,y+12);
    else text(s,x+3,y+12);
    
    if(selected){
     stroke(0);
     strokeWeight(1);
     if(millis()%1500>750)line(x+3+textWidth(s),y+3,x+3+textWidth(s),y+22);
    }
  }
  void select(){
   if(mouseX>x&&mouseX<x+75&&mouseY>y&&mouseY<y+25) selected =true;
   else selected = false;
  }
  void update(){
    if(selected){
   if(key==BACKSPACE&&s.length()>=1)s=s.substring(0,s.length()-1);
   else if(key!=BACKSPACE) s+=key;
    }
  }
  float value() {
    return float(s);
  }
}




void displayTextbox() {
  heading.display();
  airspeedAscent.display();
  ascentRate.display();
  failureTime.display();
  airspeedDescent.display();
  descentRate.display();
  windSpeed.display();
  windDir.display();
}