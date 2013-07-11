Star star;
Table starData;



void setup(){
//  size(1280,699, P3D); // 699 so that I can screencapture including the chrome at the top and still get a 720P file
  size(256,256, P3D); // 699 so that I can screencapture including the chrome at the top and still get a 720P file
  lights();
  
  colorMode(HSB,1,1,1,1);
  
  star = new Star();
   
  
  }




void draw(){

  background(0);
  star.display();

}

void mouseDragged(){
  star.drag = true; 
  star.stroke3d();
}

void mouseReleased(){
  star.drag = false;
  }


