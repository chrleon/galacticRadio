import de.voidplus.leapmotion.*;

LeapMotion leap;

Table starData;
Star star;

PFont openSansLight24;
PFont openSansLight14;
PFont openSansLight8;

float eyeZ;

PImage starDisc;

int numFingers;


void setup(){
  frameRate(60);
  size(1280,699, P3D); // 699 so that I can screencapture including the chrome at the top and still get a 720P file
  colorMode(HSB, 360, 100, 100, 1);
  eyeZ = 7070;
  
  openSansLight24 = loadFont("fonts/OpenSans-Light-24.vlw");
  openSansLight14 = loadFont("fonts/OpenSans-Light-14.vlw");
  openSansLight8 = loadFont("fonts/OpenSans-Light-8.vlw");

  star = new Star(); 
  leap = new LeapMotion(this);
}


void draw(){
  background(0);
  lights();

  // sjekk array fra csv og tegn en ny stjerne på hvert punkt.  
  star.display();
    //println(frameRate);
  star.drawDistance();
    //radio0.setVolume(star.radio0volume);

  // cameradata
    float eyeX = width/2.0;
    float eyeY = height/2.0;
    float centerX = width/2.0; 
    float centerY = height/2.0; 
    float centerZ = -10000;
    float upX = 0;
    float upY = 1;
    float upZ = 0;

for (Hand hand : leap.getHands()){
  //hand.draw();
  float handRoll = hand.getRoll();
  float handYaw = hand.getYaw();
  float handPitch = hand.getPitch();
  

  numFingers = hand.countFingers();
  
  eyeZ = eyeZ - (handRoll/5) * star.zoomSpeed;
  if (numFingers < 2) {
    eyeZ = eyeZ - handRoll / 10 * star.zoomSpeed;
  }
  //eyeZ = eyeZ + (handYaw/5) * star.zoomSpeed;
//  if( numFingers > 2) {
  //  eyeZ = eyeZ - (handPitch/8) * star.zoomSpeed;
  //}
}

for (Finger finger : leap.getFingers()){
  if(numFingers == 1) {
    finger.draw();
  }
  int fingerID = finger.getId();
//  PVector fingerDirection = finger.getDirection();
  //centerX = fingerDirection.x*10;
  //centerY = fingerDirection.y*10;
}

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
}
void mouseDragged(){
  //eyeZ = eyeZ + (pmouseX - mouseX) * star.zoomSpeed;
  
    
}
