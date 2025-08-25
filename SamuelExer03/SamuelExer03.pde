PImage img1;
PImage img2;
void setup()
{
  size(600, 600);
  background(255);
  img1 = createImage(600, 600, RGB);
  img2 = createImage(600, 600, RGB);

  for (int i= 0; i < 600; i++)
  {
    for (int j =0; j < 600; j++)
    {
      img1.set(i, j, color(255, 255, 255));
      img2.set(i, j, color(255, 255, 255));
    }
  }
}

void draw()
{
  float escala = 100;
  for (float ang = 0; ang < 2 * PI; ang += 0.01) {
    {
      float r = escala * (1 - cos(ang));

      float x = r * cos(ang);
      float y = r * sin(ang);

      int pX = int(x + 300);
      int py = int(y + 300);

      float rot = radians(30);
      float u = x * cos(rot) - y * sin(rot);
      float v = y * cos(rot) + x * sin(rot);

      int pU = int(u + 300);
      int pV = int(v + 300);
      img1.set(pX, py, 0);
      img2.set(pU, pV, 255);
      img1.set(pU, pV, 255);
    }
    image(img1, 0, 0);

    noLoop();
  }
}
