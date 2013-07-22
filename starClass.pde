class Star {
  color starColor;
  color hazeColor;
  float flicker;
  float colorIndex;


  // coordinates
  float starX;
  float starY;
  float starZ;
  float size;
  float mouseZ;
  float distance;
  String properName;
  String gliese;
  String bayerFlamsteed;
  float oneparsecinLightyears = 3.26163344;
  float maxDistance = 24.9314385440;
  float zoomSpeed = 3;

  // fonts
  color textColor = color(65, 17, 100);
  int starTouchArea = 15;

  
  // constructor
  Star() {

    size = 5;
    noStroke();
    sphereDetail(10);

    textFont(openSansLight14);
    textAlign(CENTER);
    
    imageMode(CENTER);
    
    starData = loadTable("hygxyz-3000stars.csv", "header");
    starDisc = loadImage("img/stardisc.png");

  // audio



    
  }


  // drawmethod
  void display() {   
    for (TableRow row : starData.rows()) {
      //float starID = row.getFloat("StarID");
      //float HIP = row.getFloat("HIP");
      //float HD = row.getFloat("HD");
      //float HR = row.getFloat("HR");
      gliese = row.getString("Gliese");
      bayerFlamsteed = row.getString("BayerFlamsteed");
      properName = row.getString("ProperName");
      //float RA = row.getFloat("RA");
      //float dec = row.getFloat("Dec");
      //float pmra = row.getFloat("PMRA");
      //float pmdec = row.getFloat("PMDec");
      //float RV = row.getFloat("RV");
      //float magnitude = row.getFloat("Mag");
      //float absoluteMagnitude = row.getFloat("AbsMag");
      //float spectrum = row.getFloat("Spectrum");
      distance = round(row.getFloat("Distance") * oneparsecinLightyears);


      if (properName.length() < 1) {
        properName = row.getString("BayerFlamsteed");
      }

      if (properName.length() < 1) {
        properName = row.getString("Gliese");
      }

      if (properName.length() < 1) {
        properName = row.getString("StarID");
      }


            
      colorIndex = map(row.getFloat("ColorIndex"), -0.2, 2.2, -15, 15);

      starX = map(row.getFloat("X"), -24, 24, 0, width);
      starY = map(row.getFloat("Y"), -24, 24, 0, height);
      starZ = map(row.getFloat("Distance"), 0, 25, 7000, 0); 

 flicker = random(-60.0, 0.0);

      pushMatrix();
        translate(starX, starY, starZ); // move the stars to their correct place in XYZ
        starColor = color(53, 100, 100, 77);
        hazeColor = color(53, 100, 100, 0.2);
        //fill(starColor);
        //ellipse(0, 0, 30, 30);
        //tint(60, 17, 100+flicker,1);

        image(starDisc, 0, 0, 5, 5);
        //point(0, 0, 0);
        
        // check for mouseContact
        if(  mouseX > screenX(0, 0, 0) - starTouchArea &&
             mouseX < screenX(0, 0, 0) + starTouchArea &&
             mouseY >= screenY(0, 0, 0) - starTouchArea &&
             mouseY <= screenY(0, 0, 0) + starTouchArea) {
               fill(100,0,100);
               textSize(14);
              
              text("Starname: " + properName, 0, 10, 0);
              text("Distance from Earth: " + distance + " lightyears", 0, 24, 0);
             }
             
      popMatrix();
    }
  }


void drawDistance(){
//  fill(190,100,100,0.9); 
  pushMatrix();
    translate(0,0, eyeZ-500);
    rect(0, height-200, width, 100);
  popMatrix();
    }

  

}






