void setup() {
  size(600, 600);

  PrintWriter output = createWriter("arquivo.ply");

  float escala = 100;
  ArrayList<String> vertices = new ArrayList<String>();
  ArrayList<String> faces = new ArrayList<String>();

  ArrayList<Integer> curva1 = new ArrayList<Integer>();
  ArrayList<Integer> curva2 = new ArrayList<Integer>();


  int nPontos = int(2*PI / 0.01);

  for (int i=0; i < 181; i++) {
    float ang = 0;
    for (int j = 0; j < nPontos; j++, ang += 0.01) {
      float r = escala * (1 - cos(ang));
      float x = r * cos(ang);
      float y = r * sin(ang);

      float rotY = y*cos(radians(i)) - sin(radians(i));
      float rotZ = cos(radians(i)) + y * sin(radians(i));

      vertices.add(x + "\t" + rotY + "\t" + rotZ + "\t255\t0\t0");
    }
  }

  for (int i = 0; i < 180; i++) {
    int ip1 = (i+1) % 181;
    for (int j = 0; j < nPontos-1; j++) {
      int v0 = i * nPontos + j;
      int v1 = i * nPontos + (j+1);
      int v2 = ip1 * nPontos + (j+1);
      int v3 = ip1 * nPontos + j;

      if (i < 90)faces.add("4 " + v0 + " " + v1 + " " + v2 + " " + v3);
      else faces.add("4 " + v3 + " " + v2 + " " + v1 + " " + v0);
    }
  }


  for (float i = -50; i < 50; i += 0.5) {
    float x = 50 * cos(radians(i));
    float z = 100 * sin(radians(i));
    float y = PI/3.75;
    int rot = 45;
    float rotX = x * cos(radians(rot)) + z * sin(radians(rot));
    float rotZ = -x * sin(radians(rot)) + z * cos(radians(rot));

    curva1.add(vertices.size());
    vertices.add(rotX + "\t" + y + "\t" + (rotZ+20) + "\t0\t255\t0");
  }

  for (float i = -50; i < 50; i += 0.5) {
    float x = 50 * cos(radians(i));
    float z = 100 * sin(radians(i));
    float y = PI/3.75;
    int rot = -45;
    float rotX = x * cos(radians(rot)) + z * sin(radians(rot));
    float rotZ = -x * sin(radians(rot)) + z * cos(radians(rot));


    curva2.add(vertices.size());
    vertices.add((-rotX +45) + "\t" + y + "\t" + (rotZ + -45 + 20)+ "\t0\t255\t0");
  }

  for (int k = 0; k < curva1.size()-1; k++) {
    int v1 = curva1.get(k);
    int v2 = curva1.get(k+1);
    int v3 = curva2.get(k+1);
    int v4 = curva2.get(k);
    faces.add("4\t" + v1 + "\t" + v2 + "\t" + v3 + "\t" + v4);
  }



  output.println("ply");
  output.println("format ascii 1.0");
  output.println("element vertex " + vertices.size());
  output.println("property float x");
  output.println("property float y");
  output.println("property float z");
  output.println("property uchar red");
  output.println("property uchar green");
  output.println("property uchar blue");
  output.println("element face " + faces.size());
  output.println("property list uchar int vertex_index");
  output.println("end_header");

  for (String v : vertices) output.println(v);

  for (String f : faces) output.println(f);

  output.flush();
  output.close();
  exit();
}
