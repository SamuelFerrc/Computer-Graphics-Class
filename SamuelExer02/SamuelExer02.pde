void setup() {
  size(600, 600);
  background(255);
  stroke(0);
  noFill();
}

void draw() {
  // Colocar a origem para o centro da tela
  translate(width / 2, height / 2);

  // Ajustar o tamanho do coração
  float escala = 100;


  beginShape();
 
  for (float ang = 0; ang < TWO_PI; ang += 0.01) {
    // Equação polar da cardióide: r = a(1 + cos(theta))
    // Usaremos 'escala' como o 'a' e 'ang' como o 'theta'
    float r = escala * (1 - cos(ang));

    // Converter coordenadas polares (r, ang) para cartesianas (x, y)
    float x = r * cos(ang);
    float y = r * sin(ang);

    int rot = 45;
    float u = x * cos(45) - y * sin(45);
    float v = y * cos(45) + x * sin(45);
    // Adiciona o vértice à forma
    vertex(u, v);
  }
  endShape();

 
  saveFrame("cardioide.png");
  //noLoop();
}
