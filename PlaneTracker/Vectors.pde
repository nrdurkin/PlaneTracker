void vectors() {
  ascentLength=airspeedAscent.value()*failureTime.value();
  if (!Float.isNaN(ascentLength)&&!Float.isNaN(heading.value())) {
    float dx1 = ascentLength*sin(radians(heading.value())); 
    float dy1 = -ascentLength*cos(radians(heading.value()));
    float cX =0, cY=0;

    //float vectorLength = sqrt(dx1*dx1+dy1*dy1);

    dx1=meterToPixel(dx1);
    dy1=meterToPixel(dy1);

    if (NAVAL) {
      cX=226; 
      cY=222;
    } else { 
      cX=282; 
      cY =721;
    }

    stroke(0);
    strokeWeight(2);
    line(cX, cY, cX+dx1, cY+dy1);

    cX+=dx1;
    cY+=dy1;
    fill(0);
    ellipse(cX, cY, 7, 7);

    textAlign(LEFT, CENTER);
    textSize(10);
    text("Ascent V: "+round(ascentLength)+"m at "+heading.value()+"°", 435, 500);

    if (!Float.isNaN(descentRate.value())&&!Float.isNaN(ascentRate.value())&&!Float.isNaN(airspeedAscent.value())&&!Float.isNaN(airspeedDescent.value())) {
      float h = ascentRate.value()*failureTime.value();

      float tToGround = h/descentRate.value();
      float descentLength = tToGround*airspeedDescent.value();

      float dx2 = descentLength*sin(radians(heading.value())); 
      float dy2 = -descentLength*cos(radians(heading.value()));

      dx2=meterToPixel(dx2);
      dy2=meterToPixel(dy2);

      line(cX, cY, cX+dx2, cY+dy2);

      cX+=dx2;
      cY+=dy2;
      fill(0);
      ellipse(cX, cY, 7, 7);
      text("Descent V: "+round(descentLength)+"m at "+heading.value()+"°", 435, 525);


      if (!Float.isNaN(windSpeed.value())&&!Float.isNaN(windDir.value())) {
        float totalT = failureTime.value()+tToGround;
        float windLength = totalT*windSpeed.value();

        float dx3 = -windLength*sin(radians(windDir.value())); 
        float dy3 = -windLength*cos(radians(windDir.value()));

        dx3=meterToPixel(dx3);
        dy3=meterToPixel(dy3);

        line(cX, cY, cX+dx3, cY+dy3);

        cX+=dx3;
        cY+=dy3;
        fill(0);
        ellipse(cX, cY, 7, 7);
        text("Wind V: "+round(windLength)+"m at "+windDir.value()+"°", 435, 550);
      }
    }
  }
}


float meterToPixel(float m) {
  return  m/1000*26;
}