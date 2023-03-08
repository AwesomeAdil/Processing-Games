PImage beet;
int x1=40;
float xbees[]=new float [x1];
float ybees[]=new float [x1];
boolean bees[]= new boolean [x1];
float vt=10;
int sec;
float t=0;
boolean starting=false;
boolean wing=false;
void setup() {

  beet=loadImage("bee.png");
  beet.resize(60, 60);

  for (int i=0; i<x1; i++) {
    xbees[i]=width/4*cos(i);
    ybees[i]=width/2*sin(i);
  }
  size(1000, 700);
  background(50, 250, 50);
  for (int i=0; i<x1; i++) {
    bees[i]=true;
    
  }
  textSize(60);
  textAlign(CENTER);
}


void draw() {
  if(!wing){
  background(50, 250, 50);
  if(starting){
    fill(0);
    if(second()-sec<0){
    sec-=60;
    }
    if(second()-sec>=10){
    sec+=10;
    for(int i=0;i<x1;i++){
    bees[i]=true;
    }
    }
  text((second()-sec),width/2,height/8);
  }else{
    textSize(30);
  text("Once you click you have\n 10 seconds to clear the bees!!",width/2,8*height/9);
  textSize(60);
  
  }
  
  
  for (int i=0; i<x1; i++) {
    if (bees[i]) {
      image(beet, xbees[i]+width/2-20, ybees[i]+height/2-20);

   
        xbees[i]=width/2.6*cos(2*(t+i/2.));
        ybees[i]=width/3.5*sin(8*(t+i/2.));
       
    }
  }
  aimer();

  t+=.4;
  
  
   wing=true;
  for(int i=0;i<x1;i++){
   if(bees[i]){
   wing=false;
   }
  }
  }
  else if(wing){
  background(0);
  textSize(35);
  fill(255);
  text("CONGRATS!!! \ntry another game to pass the time\n press r to go back\n to the lobby",width/2,2*height/5);
  
  }
  
  
}




void aimer() {
  stroke(255, 0, 0);
  noFill();
  strokeWeight(3);
  circle(mouseX, mouseY, 60);
  line(mouseX-45, mouseY, mouseX+45, mouseY);
  line(mouseX, mouseY-45, mouseX, mouseY+45);
  strokeWeight(15);
  point(mouseX, mouseY);
}



void mousePressed() {
  for (int i=0; i<x1; i++) {
    if (bees[i]) {
      if (dist(mouseX, mouseY, xbees[i]+width/2, ybees[i]+height/2)<=30) {
        bees[i]=false;
      }
    }
  }
  if(starting==false){
  sec=second();
  starting=true;
  }
  
}
