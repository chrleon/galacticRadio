Table starData;
Star star;



void setup(){

  
  //size(256,256, P3D); // 699 so that I can screencapture including the chrome at the top and still get a 720P file
  size(1280,699, P3D); // 699 so that I can screencapture including the chrome at the top and still get a 720P file
  colorMode(HSB, 360, 100, 100, 1);




  lights();

  // cameradata
    float eyeX = width/2.0;
    float eyeY = height/2.0;
    float eyeZ = 100;
    float centerX = width/2.0; 
    float centerY = height/2.0; 
    float centerZ = 0;
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
  
  star = new Star();   
  }




void draw(){
  background(0);


  // sjekk array fra csv og tegn en ny stjerne på hvert punkt.  
  star.display();

}

void mouseDragged(){
  //star.rotate(); 
}

void mouseReleased(){
  }


