PrintWriter output;
  
void setup()
{
  size(100,100);
  output =  createWriter(
    "Arquivo.ply"
  );
  output.println("ply");
  output.println("format ascii 1.0");
  output.println("element vertex " + (1000 * 1000)*2); // agora é o valor correto
  output.println("property float x");
  output.println("property float y");
  output.println("property float z");
  output.println("property uchar red");
  output.println("property uchar green");
  output.println("property uchar blue");

  output.println("end_header");
  
  int amplitude = 25;
  
  for(int i =-500; i < 500;i++)
  {
    for(int j = -500 ; j < 500;j++)
    {
        float z =amplitude* cos(radians(i * 5));
        output.println(i + "\t"+ j +"\t" + z + "\t255\t0\t0");
    }
  }
  
  output.flush();
  for(int i =-500; i < 500;i++)
  {
    for(int j = -500 ; j < 500;j++)
    {
        float z =amplitude* sin(radians(i * 5));
        output.println(i + "\t"+ j +"\t" + z+"\t0\t0\t255");
    }
  }
  output.flush();

  
  output.close();

exit();
}
