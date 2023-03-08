int state1=0;
final int lobby1=0;
final int ez=1;
final int med=2;
final int hard=3;
final int lit_imps=4;
final int win2=5;
final int lose2=6;
float x;
int rect1;
int rect2;
PVector v1, p1, score;
int vl, vr;
void setup() {
  size(1000, 700);
  background(0);
  rectMode(CENTER);
  rect1=height/2;
  rect2=height/2;
  v1 = new PVector(2, 4);
  p1 = new PVector(width/2, height/2);
  score= new PVector(0, 0);
  fill(255);
  vl=0;
  vr=0;

  textSize(50);
  textAlign(CENTER);
}

void draw() {
  if (state1==0) {
    text("Pressed E for ez\n M for medium\n H for hard\n and L for litterally\nimpossible\n mouse to move :)", width/2, height/10);
  }


  if (state1==1) {
    x=3.;
  } else if (state1==2) {
    x=3.4;
  } else if (state1==3) {
    x=3.8;
  } else if (state1==4) {
    x=5;
  }


  if (state1==1||state1==2||state1==3||state1==4) {
    background(0);
    text((int)score.x, width/4, height/5);
    text((int)score.y, 3*width/4, height/5);
    circle(p1.x, p1.y, 15);
    move();
    bounce();
    rect(0, rect1, 10, width/5);
    rect(width, rect2, 10, width/5);
    if (score.x==3) {
      state1=win2;
    } else if (score.y==3) {
      state1=lose2;
    }
  } else if (state1==win2) {
    text("WINNER WINNER\n WIENER:)\n press r to go back to the lobby", width/2, height/2);
  } else if (state1==lose2) {
    text("Awwwwww \nbig ripos:<\n press r to go back to the lobby", width/2, height/2);
  }
}




void move() {
  p1.x+=v1.x;
  p1.y+=v1.y;

  if (p1.y>rect2) {
    rect2+=3.5;
  } else {
    rect2-=3.5;
  }
  rect1=mouseY;
}





void bounce() {
  if (p1.y>height-15||p1.y<15) {
    v1.y*=-1;
  }
  if (p1.x>width) {
    if (dist(0, rect2, 0, p1.y)<=width/10) {
      v1.x*=-1.1;
    } else {
      score.x++;
      p1.x=width/2;
      p1.y=height/2;
      v1.x=2;
    }
  } else if (p1.x<0) {
    if (dist(0, rect1, 0, p1.y)<=width/10) {
      v1.x*=-1.1;
    } else {
      score.y++;
      p1.x=width/2;
      p1.y=height/2;
      v1.x=2;
    }
  }
}



void keyPressed() {
  if (state1==0) {
    if (key=='e') {
      state1=1;
    } else if (key=='m') {
      state1=2;
    } else if (key=='h') {
      state1=3;
    } else if (key=='l') {
      state1=4;
    }
  }
}
