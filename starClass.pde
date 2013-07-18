class Star {
  color starColor;
  color hazeColor;
  float flicker;
  float colorIndex;
  
  float starX;
  float starY;
  float starZ;
  float size;
  float mouseZ;

  float screenStarPosX;
  float screenStarPosY;
  float screenStarPosZ;
  
  color textColor = color(65, 17, 100);
  int starTouchArea = 10;

// fonts


  
  
  Star() { // constructor
    starColor = color(187+colorIndex, 13, 1.0);
    hazeColor = color(187+colorIndex, 13, 0.2);
    
    size = 3;
    noStroke();
    
    starData = loadTable("hygxyz-250stars.csv","header");

openSansLight24 = loadFont("fonts/OpenSans-Light-24.vlw");
openSansLight14 = loadFont("fonts/OpenSans-Light-14.vlw");
openSansLight8 = loadFont("fonts/OpenSans-Light-8.vlw");


  
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
      String properName = row.getString("BayerFlamsteed");
                          
      //float RA = row.getFloat("RA");
      //float dec = row.getFloat("Dec");
      float distance = row.getFloat("Distance");
      //float pmra = row.getFloat("PMRA");
      //float pmdec = row.getFloat("PMDec");
      //float RV = row.getFloat("RV");
      //float magnitude = row.getFloat("Mag");
      //float absoluteMagnitude = row.getFloat("AbsMag");
      //float spectrum = row.getFloat("Spectrum");
      colorIndex = map(row.getFloat("ColorIndex"), -0.2, 2.2, -15, 15);
      
      starX = map(row.getFloat("X"), -25, 25, 0, width);
      starY = map(row.getFloat("Y"), -25, 35, 0, height);
      starZ = map(row.getFloat("Z"), -25, 25, 0, 7000);
      
      screenStarPosX = screenX(starY, starX, starZ);
      screenStarPosX = screenY(starY, starX, starZ);
      screenStarPosX = screenZ(starY, starX, starZ);
      
      
      flicker = random(-80.0,0.0);
      
      pushMatrix();
        translate(starX, starY, starZ); // move the stars to their correct place in XYZ
     
          fill(187+colorIndex, 13, 100+flicker, 0.1); // halocolor
          ellipse(0,0, size*2, size*2); // draw the halo
          // draw the text
          fill(0,0,100);
          textFont(openSansLight24);
          textAlign(CENTER);
          text(properName, starX, starY, starZ);

          textFont(openSansLight14);
          text(distance, starX, starY, starZ);

     
        fill(187+colorIndex, 13, 100+flicker, 1); // starcolor
        ellipse(0,0, size, size); // draw the star
        println(screenX(starX, starY, starZ) + " camera: " + eyeZ + " fps: " + frameRate);
      popMatrix();
      
    
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
  





