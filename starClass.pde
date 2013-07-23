class Star {
  color starColor;
  color hazeColor;
  float flicker;
  float colorIndex;

  // information
  String starname;
  String starDistance;
  String message;

  // coordinates
  float starX;
  float starY;
  float starZ;
  float size;
  float mouseZ;
  float distance;
  float distanceFromSol;
  int distanceinLightYears;
  String properName;
  String gliese;
  String bayerFlamsteed;
  float oneparsecinLightyears = 3.26163344;
  float maxDistance = 24.9314385440;
  float zoomSpeed = 3;
  float absoluteMagnitude;
  
  // inforectangle
  float topRect = (height/2-6);  

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
      gliese = row.getString("Gliese");
      bayerFlamsteed = row.getString("BayerFlamsteed");
      properName = row.getString("ProperName");
      absoluteMagnitude = map(row.getFloat("AbsMag"), -1, 20, 0, 100);
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

      // star coordinates
      starX = map(row.getFloat("X"), -24, 24, 0, width);
      starY = map(row.getFloat("Y"), -24, 24, 0, height);
      starZ = map(row.getFloat("Distance"), 0, 25, 0, 7000); 

     flicker = random(-80.0, 0.0);

      pushMatrix();
        translate(starX, starY, starZ); // move the stars to their correct place in XYZ
        starColor = color(53+random(-5,5), 100-absoluteMagnitude, 100+flicker);
        fill(starColor);
            image(starDisc, 0, 0, size, size);
            //point(0, 0, 0);
        message = "";
        // check for mouseContact
        if(  mouseX > screenX(0, 0, 0) - starTouchArea &&
             mouseX < screenX(0, 0, 0) + starTouchArea &&
             mouseY >= screenY(0, 0, 0) - starTouchArea &&
             mouseY <= screenY(0, 0, 0) + starTouchArea &&
             starZ >= eyeZ - 1000) 
             {
              
              
              message = "This star is called " + properName + " and is located " + distance + " lightyears from our star, Sol";
              pushMatrix(); // move the text to the front
               fill(100,0,0);
                  rectMode(CENTER);
               fill(100,0,100);
               textAlign(CENTER);
               textSize(4);
                  text("Starname: " + properName, 0, 7, 0);
                  text("Distance from Earth: " + distance + " lightyears", 0, 11, 0);
              popMatrix();
            println(message);  
           }
             
      popMatrix();
    }
  }


void drawDistance(){
//  fill(190,100,100,0.9); 
  pushMatrix();
    float depthRect = eyeZ - 61; // 61 is the place where the rectangle is closest to the camera without clipping.
      distanceFromSol = map(eyeZ,7070,60,600,680);
      translate(0, 25, depthRect);
      noStroke();
      fill(0, 0, 0, 0.9);
      rectMode(CORNER);
      rect(0, topRect, width, 25);
      stroke(0,0,50);
      strokeWeight(1);
      line(0, topRect, width, topRect);
      
      strokeWeight(3);
      stroke(53,100,100);
      fill(0,0,0);
      line(600, height/2+5, width-600, height/2+5);
      ellipse(distanceFromSol, height/2+5, 2, 2);
      fill(53,100,100,1);
      ellipse(680,height/2+5,2,2);
      
      textSize(2);
      textAlign(LEFT);
      distanceinLightYears = (int) round(map(eyeZ,7070,60,82,0));
      text("this.message + move rect farther up screen", 600, height/2-2);
      text("You are now " + distanceinLightYears + " lightyears from home", 638, height/2+3);
      text("Drag left and right to go home", 638, height/2+8);
      text("Sol", 683, height/2+5.5);
      println(mouseX + ":" + eyeZ);
  popMatrix();
  println(absoluteMagnitude);
    }

  

}






