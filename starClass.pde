class Star {
  color c;
  float xpos;
  float ypos;
  float zpos;
  float size;
  float mouseZ;
  
  boolean drag = false;

  Star() { // constructor
    c = color(1);
    xpos = width/2;
    ypos = height/2;
    zpos = mouseZ;
    size = 40;
    noStroke();
}
  
  void display() { // drawmethod
  mouseZ = map(mouseX, 100, width, -500, 530);   
  translate(xpos, ypos, 0);
  rotateY(radians(mouseX));
  noFill();
  stroke(1);
  box(45);
  noStroke();
  
  pushMatrix();  
  //rotateX(radians(mouseX*-1));
  rotateY(radians(mouseX));
  fill(0,0,100,.2);
  ellipse(0, 0, 25, 25);
  fill(0,0,100);
  ellipse(0, 0, 15, 15);
  
  ellipse(50, 50, 17, 17);
  popMatrix();

  
    
}
  
  void rotate(){
    
  }
  
void stroke3d() { // Draw strokes in 3D - not working yet
    stroke(53,98,95);
    line(pmouseX,pmouseY,mouseZ, mouseX, mouseY, mouseZ);
    if (!drag) {
      noStroke();
      println("gameover");  
      return;
    }  
}
  
  
}


