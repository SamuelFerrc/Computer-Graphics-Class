
void setup() {
  size(100,100);
  int [] rots = {0,30,45,60,90,120};
  for(int x =0 ; x < rots.length;x++)
  {
    PrintWriter output;

  output = createWriter("casaEscalonada_"+ rots[x] +"_.ply");
  output.println("ply");
  output.println("format ascii 1.0");
  output.println("element vertex 9");  
  output.println("property float x");
  output.println("property float y");
  output.println("property float z");
  
  output.println("element face 10"); 
  output.println("property list uchar int vertex_index");
  
  output.println("end_header");
  
  float [] xAx = {0,1,0,1,0,1,0,1,0.5};
  float [] yAx = {0,0,1,1,0,0,1,1,0.5};
  float [] zAx = {0,0,0,0,1,1,1,1,1.5};
  
  
  
  for(int i =0 ; i < xAx.length;i++) {
    float rotY = yAx[i] * cos(radians(rots[x])) - zAx[i] * sin(radians(rots[x]));
    float rotZ = yAx[i] * sin(radians(rots[x])) + zAx[i] * cos(radians(rots[x]));
    output.println(xAx[i] + "\t"+ rotY +"\t" + rotZ);
  }
  
  output.println("4 0 1 3 2"); 
  output.println("4 4 5 7 6"); 
  output.println("4 0 1 5 4"); 
  output.println("4 2 3 7 6"); 
  output.println("4 0 2 6 4"); 
  output.println("4 1 3 7 5"); 
  
  output.println("3 4 5 8");
  output.println("3 5 7 8");
  output.println("3 7 6 8");
  output.println("3 6 4 8");
  
  output.flush();
  output.close();
  }
  exit();
}
