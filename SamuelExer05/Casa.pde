PrintWriter output;

void setup() {
  size(100,100);
  output = createWriter("arquivo.ply");
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
  
  float escala = 50;
  for(int i =0 ; i < xAx.length;i++) {
    output.println(xAx[i] *escala+ "\t"+ yAx[i] *escala +"\t" + zAx[i] * escala);
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
  exit();
}
