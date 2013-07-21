Table starData;
Star star;

PFont openSansLight24;
PFont openSansLight14;
PFont openSansLight8;

float eyeZ;

  PImage starDisc;


void setup(){
  size(1280,699, P3D); // 699 so that I can screencapture including the chrome at the top and still get a 720P file
  colorMode(HSB, 360, 100, 100, 1);
  eyeZ = 7070;
  
//    openSansLight24 = createFont("fonts/OpenSans-Light-24.vlw", 24);
//    openSansLight14 = createFont("fonts/OpenSans-Light-14.vlw", 14);
//    openSansLight8 = createFont("fonts/OpenSans-Light-8.vlw", 8);
//  textMode(SHAPE);

    openSansLight24 = loadFont("fonts/OpenSans-Light-24.vlw");
    openSansLight14 = loadFont("fonts/OpenSans-Light-14.vlw");
    openSansLight8 = loadFont("fonts/OpenSans-Light-8.vlw");



  star = new Star(); 


    starData = loadTable("hygxyz-250stars.csv", "header");
    starDisc = loadImage("img/stardisc.png");
    }




void draw(){
  background(0);
  lights();

  // cameradata
    float eyeX = width/2.0;
    float eyeY = height/2.0;
    float centerX = width/2.0; 
    float centerY = height/2.0; 
    float centerZ = -10000;
    float upX = 0;
    float upY = 1;
    float upZ = 0;



  camera(
    eyeX,
    eyeY,
    eyeZ,
    centerX,
    centerY,
    centerZ,
    upX,
    upY,
    upZ
    );
  


  
  // sjekk array fra csv og tegn en ny stjerne på hvert punkt.  
  star.display();
  
  

}

void mouseDragged(){
    //eyeZ = map(mouseX, 100, (width-100), 7070, 980);
    eyeZ = eyeZ + (pmouseX- mouseX) * star.zoomSpeed;
    
    println(eyeZ);
  

}


void mouseReleased(){
  }


