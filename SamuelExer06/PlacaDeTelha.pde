PrintWriter output;
void setup()
{
  size(100,100);
  output = createWriter("arquivo.ply");
  output.println("ply");
  output.println("format ascii 1.0");
  output.println("element vertex " + 1000 * 1000); // agora é o valor correto
  output.println("property float x");
  output.println("property float y");
  output.println("property float z");

  output.println("end_header");

  for(int i =-500; i < 500;i++)
  {
    for(int j = -500 ; j < 500;j++)
    {
        float z =25* cos(radians(i * 5));
        output.println(i + "\t"+ j +"\t" + z);
    }
  }
  
  output.flush();
  output.close();

exit();
}
