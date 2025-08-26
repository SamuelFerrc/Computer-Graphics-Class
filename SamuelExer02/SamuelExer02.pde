void setup() {
  size(600, 600);
  background(255);
  stroke(0);
  noFill();
}

void draw() {
  translate(width / 2, height / 2);

  float escala = 100;


  beginShape();
 
  for (float ang = 0; ang < TWO_PI; ang += 0.01) {

    float r = escala * (1 - cos(ang));

    float x =r * cos(ang);
    float y =r * sin(ang);

    int rot = 45;
    float u = x * cos(45) - y * sin(45);
    float v = y * cos(45) + x * sin(45);
    vertex(u, v);
  }
  

  endShape();

 
  saveFrame("cardioide.png");
  //noLoop();
}
