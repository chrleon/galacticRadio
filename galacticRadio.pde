Table starData;
Star star;

PFont openSansLight24;
PFont openSansLight14;
PFont openSansLight8;

float eyeZ;

PImage starDisc;

import ddf.minim.*;
Minim minim;
AudioPlayer radio0;
AudioPlayer radio1;
AudioPlayer radio2;
AudioPlayer radio3;
AudioPlayer radio4;
AudioPlayer radio5;
AudioPlayer radio6;
AudioPlayer radio7;
AudioPlayer radio8;
AudioPlayer radio9;
AudioPlayer ambient;


void setup(){
  size(1280,699, P3D); // 699 so that I can screencapture including the chrome at the top and still get a 720P file
  colorMode(HSB, 360, 100, 100, 1);
  eyeZ = 7070;
  
  openSansLight24 = loadFont("fonts/OpenSans-Light-24.vlw");
  openSansLight14 = loadFont("fonts/OpenSans-Light-14.vlw");
  openSansLight8 = loadFont("fonts/OpenSans-Light-8.vlw");

  star = new Star(); 


// audio
minim = new Minim(this);
  radio0 = minim.loadFile("audio/2012-gotye-kimbrya.wav");
  radio0.loop();

  radio1 = minim.loadFile("audio/2008-flo-rida-low.wav");
  radio1.loop();
  
  radio2 = minim.loadFile("audio/2003-50-cent-in-da-club.wav");
  radio2.loop();
  
  radio3 = minim.loadFile("audio/1997-eltonjohn.wav");
  radio3.loop();

  radio4 = minim.loadFile("audio/1992-whitney.wav");
  radio4.loop();

  radio5 = minim.loadFile("audio/1987-bangles.wav");
  radio5.loop();

  radio6 = minim.loadFile("audio/1982-thriller.wav");
  radio6.loop();

  radio7 = minim.loadFile("audio/1978-beegees.wav");
  radio7.loop();

  radio8 = minim.loadFile("audio/1972-killing.wav");
  radio8.loop();

  radio9 = minim.loadFile("audio/1968-beatles.wav");
  radio9.loop();



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
    //println(frameRate);
    star.drawDistance();
    //radio0.setVolume(star.radio0volume);
    star.radioVolume();
  
  

}

void mouseDragged(){
  eyeZ = eyeZ + (pmouseX - mouseX) * star.zoomSpeed;
    
}


