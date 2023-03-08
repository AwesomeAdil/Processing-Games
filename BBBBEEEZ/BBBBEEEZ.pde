PImage beez, birds, cloud;
int start=width/2;
float speed=2;
float heights;
boolean win=false;


void setup() {
  size(1000, 700);
  background(0, 255, 255);
  beez=loadImage("bee.png");
  birds=loadImage("birdie.png");
  birds.resize(120, 100);
  cloud=loadImage("cloud.png");
  beez.resize(90, 90);
  cloud.resize(300, 275);
  heights=height/2;
  textSize(100);
  textAlign(CENTER);
}
void draw() {

  if (!win) {
    background(0, 255, 255);
    fill(255, 255, 0);
    circle(0, 0, 300);
    //image(cloud,width/2,height/20);
    menouvier();
    for (int i=0; i<15; i++) {
      image(cloud, width*(i-1)*2+start, height/20);
      fill(0);
      text(i, width*2*(i-1)+start+145, height/20+80+95);
      for (int j=0; j<=i; j++) {
        image(birds, width*(i-1)*2+start+width-15, heights-30);
      }
    }
    image(beez, mouseX-30, mouseY-30);


    caught();
    start-=speed;
    speed*=1.0015;
  } else if (win) {
    background(0);
    fill(255);
    textSize(32);
    text("CONGRATS! That was a toughy \ntry a different game\n press r to go back to the lobby", width/2, height*2/5);

    circle(350, 600, 70);
    circle(650, 600, 70);
  }

  if (start<=-30*width) {
    win=true;
  }
}

void menouvier() {

  for (int i=0; i<15; i++) {
    for (int j=0; j<15; j++) {
      if (heights<mouseY) {
        heights+=.06;
      } else {
        heights-=.06;
      }
    }
  }
}


void caught() {
  for (int i= 0; i<15; i++) {
    if (dist(width*(i-1)*2+start+width, heights, mouseX, mouseY)<30) {
      start=width/2;
      speed=2;
    }
  }
}
