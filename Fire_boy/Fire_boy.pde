// px-7 and py+5

int px, py;
int vx, vy;
int fx;
boolean win=false;
int fxs[]= new int [3];
boolean right, left;
PImage walls[]= new PImage[5];
PImage bground;
PImage trophy;
PImage bird;
boolean first, second=false;



void setup() {
  
  size(1000, 700);
  for (int i=0; i<5; i++) {
    walls[i]=loadImage("wall.jpg");
  }
  walls[0].resize(800, 30);
  walls[1].resize(1000, 15);
  walls[2].resize(width, height);
  bground=loadImage("bground.jpg");
  bground.resize(width, height);
  trophy=loadImage("trophy.png");
  trophy.resize(50, 50);
  bird=loadImage("player.png");
  bird.resize(80, 80);
  px=30;
  py=height-30;
  strokeWeight(3);
  fill(200, 200, 200);
  fx=width-20;
  for(int i=0;i<3;i++){
  fxs[i]=30;
  }
  textSize(32);
  textAlign(CENTER);
  
}



void draw() {
  if(!win){
  background(bground);
  image(trophy, width-40, 0);
  image(walls[0], 200, 50);

  image(walls[0], 0, 240);
  image(walls[0], 200, 390);
  image(walls[0], 0, 555);
  image(walls[1], 0, 685);
  //Level 1
  spike(width/10, height-20, 30);
  spike(width/10+60, height-20, 30);
  spike(3*width/10, height-20, 30);
  spike(3*width/10+60, height-20, 30);
  spike(width/2+30, height-20, 30);
  spring(width-100, height-20);

  for (int i=0; i<30; i++) {
    spike(width/2+150+i*5, height-15, 5);
  }

  //Level 2

  spike(width/10+40, height-20-150, 30);
  spike(width/10+60+40, height-20-150, 30);
  spike(3*width/10+40, height-20-150, 30);
  spike(3*width/10+60+40, height-20-150, 30);
  spike(width/2+30+40, height-20-150, 30);
  spike(width/2+70+35, height-170, 30);
  spring(width/12-20, height-170);


  //Level 3
  spike(width/10+40+100+20+10, height-20-150-150, 30);
  spike(width/10+60+40+100+20+10, height-20-150-150, 30);
  spike(3*width/10+40+100+20+10, height-20-150-150, 30);
  spike(3*width/10+60+40+100+20+10, height-20-150-150, 30);
  spike(width/2+30+40+100+20+10, height-20-150-150, 30);
  spike(width/2+70+35+100+20+10, height-170-150, 30);
  for (int i=0; i<10; i++) {
  spike(width/2+350+i*5, height-15-300, 5);
  }
  spring(11*width/12+20,height-335);



  image(bird, px-40, py-40);



  move();
  standup();
  grav();
  fireball();
  fireballs();
  spring(40,210);
  }else if (win){
  background(0);
  fill(255);
   text("CONGRATES TRY SOME OTHER LEVELS : )\n This one was tough!\n Press r to go back to the Lobby",width/2,2*height/5);
  
  
  
  }
  
  if(dist(px-7,py+5,width-30,30)<=90){
  win=true;
 
  }
  
  
}


void standup() {
  if(py+5>=60&&py+5<=90){
  if(px>200){
  py-=vy;
      vy-=1;
      first=true;
      second=true;
  }
 
  }
  
  else if (py+5>=230&&py+5<=250) {
    if (px<800) {
      py-=vy;
      vy-=1;
      first=true;
      second=true;
    }
  } else if (py+5>380&&py+5<=400) {
    if (px>200) {
      py-=vy;
      vy-=1;
      first=true;
      second=true;
    }
  } else if (py+5>540&&py+5<height-140) {
    if (px<800) {
      py-=vy;
      vy-=1;
      first=true;
      second=true;
    }
  } else if (py+5>=height-10) {
    py-=vy;
    vy-=1;
    first=true;
    second=true;
  }
  if (px>width) {
    py-=vx;
  } else if (px<50) {
    px+=vx;
  }
}


void move() {
  px+=vx;
  py+=vy;
}

void grav() {

  vy+=1;
}
void keyPressed() {
  if (key=='d') {

    vx=6;
  }
  if (key==' '&&first) {
    vy=-11;
    first=false;
  } else if (key==' '&&second) {
    vy=-9;
    second=false;
  }

  if (key=='a') {

    vx=-6;
  }
}

void keyReleased() {
  if (key=='a'||key=='d') {
    vx=0;
  }
}

void friction() {
  if (vx!=0) {
    if (vx>0) {
      vx-=3;
    } else {
      vx+=2;
    }
  }
}


void spike(float x, float y, float s) {
  triangle(x, y, s);
  if (dist(px-7, py+5, x, y)<=s) {
    px=30;
    py=height-30;
  }
}



void triangle(float x, float y, float s) {
  fill(200, 200, 200);
  beginShape();
  vertex(x, y-s);
  vertex(x+s*sqrt(3)/2, y+s*.5);
  vertex(x-s*sqrt(3)/2, y+s*.5);
  endShape(CLOSE);
}


void spring(int x, int y) {
  fill(255, 0, 0);
  circle(x, y, 50);
  if (dist(px-7, py+5, x, y)<=50) {
    vy-=2;
  }
}

void fireball() {
  fill(247, 134, 15);
  circle(fx, 355, 30);
  fx-=7;
  if (fx<=-30) {
    fx=width-30;
  }
  if (dist(fx, 355, px-7, py+5)<=35) {
    px=30;
    py=height-30;
  }

}


void fireballs(){
fxs[0]+=7;
fxs[1]+=3;
fxs[2]+=5;
for(int i=0;i<3;i++){
circle(fxs[i],210-40*i,30);
if(fxs[i]>width){
fxs[i]-=width;
}
if(dist(fxs[i],210-40*i,px-7,py+5)<=35){
    px=30;
    py=height-30;

}
}
}

void mousePressed(){
px=mouseX;
py=mouseY;

}
