PImage diamond, dirt, grass_side, grass_top, oak_top, oak_side, birch_top, birch_side;
float rotX, rotY;

color red = #FF0303;
color blue = #0365FF;
color teal = #03FFC2;
color green = #1DB42D;
color yellow = #DDE849;
color orange = #FF9100;
color lblue = #00ECFF;
color dblue = #08585A;
color purple = #B200FF;
color pink = #FF00C0;
color brown = #64412A;
color night = #000321;

void setup() {
  size(800, 700, P3D);
  diamond = loadImage("diamond.png");
  dirt = loadImage("dirt.jpg");
  grass_side = loadImage("grass_side.jpg");
  grass_top = loadImage("grass_top.png");
  oak_top = loadImage("oak_top.png");
  oak_side = loadImage("oak_side.jpg");
  birch_top = loadImage("birch_top.png");
  birch_side = loadImage("birch_side.png");

  textureMode(NORMAL);
}

void draw() {
  background(night);
  texturedCube(width/3, height/3, 50, diamond, diamond, diamond, 75);
  texturedCube(2*width/3, height/3, 0, birch_top, birch_side, birch_top, 75);
  texturedCube(width/3, 2*height/3, 0, grass_top, grass_side, dirt, 75);
  texturedCube(2*width/3, 2*height/3, -50, oak_top, oak_side, oak_top, 75);
}

void texturedCube(float x, float y, float z, PImage topTexture, PImage sideTexture, PImage bottomTexture, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotX);
  rotateY(rotY);

  noStroke();

  beginShape(QUADS);
  texture(topTexture);

  //top
  //     x, y, z, tx,ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  endShape();

  beginShape(QUADS);
  texture(bottomTexture);
  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  endShape();

  beginShape(QUADS);
  texture(sideTexture);
  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  // back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);


  endShape();


  popMatrix();
}

void mouseDragged() {
  rotX = rotX + (pmouseY - mouseY) * 0.0075;
  rotY = rotY + (pmouseX - mouseX) * -0.0075;
}
