


PImage img1;
PImage img2;
int w,h;
void setup()
{
  size(800,800);
  img1 = loadImage("Img.png");
  w = img1.width;
  h = img1.height;
  img2 = createImage(w, h, RGB);
  img2.loadPixels();
  
  
  for(int i =0 ; i < w; i++)
  {
    for(int j = 0; j < h; j++)
    {
      color c = img1.get(i,j);
      if(i >= h/2)
      {
        img2.set(i,j, 0);
        
      }
      else
      {
        img2.set(i,j,c);
      }
      
    }
  }
  img2.save("black.png");
}

void draw()
{
  
  image(img2, 0,0);
}
