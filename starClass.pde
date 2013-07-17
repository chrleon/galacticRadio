

class Star {


  color c;
  float starX;
  float starY;
  float starZ;
  float size;
  float mouseZ;
  
  boolean drag = false;

  Star() { // constructor
    c = color(1);
    size = 5;
    noStroke();
    
starData = loadTable("hygxyz-250stars.csv","header");


  
}
  

  
  void display() { 
  // drawmethod
  
    for (TableRow row : starData.rows()){
      //float starID = row.getFloat("StarID");
      //float HIP = row.getFloat("HIP");
      //float HD = row.getFloat("HD");
      //float HR = row.getFloat("HR");
      //String gliese = row.getString("Gliese");
      //String bayerFlamsteed= row.getString("BayerFlamsteed");
      String properName = row.getString("ProperName");
      //float RA = row.getFloat("RA");
      //float dec = row.getFloat("Dec");
      float distance = row.getFloat("Distance");
      //float pmra = row.getFloat("PMRA");
      //float pmdec = row.getFloat("PMDec");
      //float RV = row.getFloat("RV");
      //float magnitude = row.getFloat("Mag");
      //float absoluteMagnitude = row.getFloat("AbsMag");
      //float spectrum = row.getFloat("Spectrum");
      float colorIndex = map(row.getFloat("ColorIndex"), -0.2, 2.2, -15, 15);
      
      starX = map(row.getFloat("X"), -25, 25, 0, width);
      starY = map(row.getFloat("Y"), -25, 35, 0, height);
      starZ = map(row.getFloat("Z"), -25, 25, 300, -500);
      
      pushMatrix();
//      background(0);
      translate(starX, starY, starZ);
      fill(187+colorIndex, 13, 100, 0.1);
      ellipse(0,0, size*5, size*5);
      fill(187+colorIndex, 13, 100,1);
      ellipse(0,0, size, size);
      popMatrix();
      
      println(frameRate);
    
    }
  }
  
void rotate(){
  float rotY = map(mouseX, 0, width, 0, TWO_PI);
  
  background(0);
  pushMatrix();
  rotateY(rotY);
  this.display();
  popMatrix();
  
}  
}
  





