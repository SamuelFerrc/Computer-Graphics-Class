PImage img1;
PImage img2;



void setup()
{
  int []rots = {0,30,45,60,90,120,135};
  size(600, 600);
  background(255);
  img1 = createImage(600, 600, RGB);
  img2 = createImage(600, 600, RGB);

  for(int z =0 ; z < rots.length;z++)
  {
  for (int i= 0; i < 600; i++)
  {
    for (int j =0; j < 600; j++)
    {
      img1.set(i, j, color(255, 255, 255));
      img2.set(i, j, color(255, 255, 255));
    }
  }

  float amplitude = 100;
  float frequency = 1.5f;
  for (float t = 0; t < TWO_PI; t += 0.01) {
    {

    float x = 50 * cos(t);
    float y = 100 * sin(t);
    
      int pX = int(x + 300);
      int py = int(y + 300);

      float rot = radians(rots[z]);
      float u = x * cos(rot) - y * sin(rot);
      float v = y * cos(rot) + x * sin(rot);

      int pU = int(u + 300);
      int pV = int(v + 300);
      img1.set(pX, py, 0);
      img2.set(pU, pV, 255);
      img1.set(pU, pV, 255);
    }
    
    
  }
    img2.save("Rot_" + rots[z] + "_.png");
  }
}

void draw()
{


  noLoop();
}
