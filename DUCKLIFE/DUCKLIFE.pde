int r, g, b, r1, g1, b1, x, y;
void setup() {
  size(2400, 2400);
  background(55, 100, 200);
  r=250;
  g=255;
  b=13;
  r1=13;
  g1=253;
  b1=255;
  x=160;
  y=260;
}

void draw() {
  strokeWeight(3);
  fill(r, g, b);

  ellipse(x, y, 126, 145);


  fill(250, 144, 12);

  triangle(x-60, y-125, x-60, y-85, x-95, y-93);
  line(x-95, y-93, x-40, y-103);
  fill(r, g, b);
  strokeWeight(3);
  ellipse(x-10, y-110, 120, 110);
  strokeWeight(2);
  fill(255, 255, 255);
  ellipse(x-25, y-120, 70, 70);
  fill(r1, g1, b1);
  strokeWeight(2);
  ellipse(x-34, y-120, 50, 50);
  strokeWeight(27);
  point(x-46, y-120);
  stroke(255, 255, 255);
  strokeWeight(13);
  point(x-25, y-135);

  strokeWeight(7);
  stroke(0, 0, 0);
  line(x-5, y+97, x-5, y+74);
  line(x-5, y+97, x-25, y+100);

  fill(0, 0, 0);
  rect(x-50, y-245, 80, 100);
  rect(x-80, y-165, 140, 20);

  fill(255, 0, 0);
  rect(x-50, y-205, 80, 35);
}
void keyPressed() {
  if (key == 'w') {
    r=255;
    g=255;
    b=255;
  }
  if (key =='s') {
    r=255;
    b=0;
    g=0;
  }
  if (key =='x') {
    r=0;
    b=255;
    g=0;
  }
  if  (key=='e') {
    r=0;
    g=255;
    b=0;
  }
  if (key=='d') {
    r=0;
    b=255;
    g=255;
  }
  if (key=='c') {
    r=255;
    b=255;
    g=0;
  }
  if (key=='q') {
    r=255;
    g=166;
    b=0;
  }
  if (key =='a') {
    r1=255;
    g1=0;
    b1=0;
  }
  if (key == 'z') {
    r1=0;
    g1=255;
    b1=0;
  }
  if (key == 'r') {
    r1=0;
    g1=255;
    b1=255;
  }
  if (key == 'f') {
    r=100;
    g=100;
    b=100;
  }
  if (key == 'v') {
    r1=100;
    g1=100;
    b1=100;
  }
  if (key == 't') {
    r1=232;
    g1=9;
    b1=203;
  }
  if (key=='u') {
    r1=255;
    g1=255;
    b1=255;
  }

  if (key ==' ') {
    background(55, 100, 200);
    scale(-1);
  }
  if (key =='l' ) {
    background(55, 100, 200);
    x=x+330;
  }
  if (key=='j') {
    background(55, 100, 200);
    x=x-330;
  }
  if (key=='k') {
    background(55, 100, 200);
    y=y+160;
  }
  if(key=='i'){
   background(55, 100, 200);
    y=y-160;
  
  }
}
