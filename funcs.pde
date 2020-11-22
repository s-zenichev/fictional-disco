class enemy {
  float angle, dist, speed, respawn_time, x, y;
  enemy(int i) {
    angle=random(0, 2)*PI;
    dist=height/2+width/2;
    x=width/2+cos(angle)*dist;
    y=height/2-sin(angle)*dist;
    speed=random(2, 4);
    respawn_time=random(i*100, i*200);
  }
  void rush() {
    if (respawn_time<=0) {
      if((dist-dist%10)%20==0)angle+=0.01;
      else angle -=0.01;
      dist-=speed;
      x=width/2+cos(angle)*dist;
      y=height/2-sin(angle)*dist;
      ellipse(x, y, 20, 20);
    } else respawn_time--;
  }
}

class bullet {
  float angle, dist, speed, x=-1, y=-1;
  void shoot(float a) {
    speed=7;
    angle=a;
    dist=40; 
    x=width/2+cos(angle)*dist;
    y=height/2-sin(angle)*dist;
  }
  void fly() {
    if (x>=0 && y>=0) {
      dist+=speed;
      x=width/2+cos(angle)*dist;
      y=height/2-sin(angle)*dist;
      line (x, y, width/2+cos(angle)*(dist-3), height/2-sin(angle)*(dist-3));
    }
    if (x<0 || y<0 || x>width || y>height) stop();
  }
  void stop() {
    speed=0;
    x=-1;
    y=-1;
  }
}

float joystick_angle(){
  float x,y,angle;
  x=mouseX-width*0.75;
  y=height*0.75-mouseY;
  angle=asin(y/sqrt(x*x+y*y));
  if (x>0) return angle;
  else return -angle+PI;
}

class score{
 int present,high;
 void show(){
   fill(0);
   textAlign(CENTER, TOP);
   text(present+"/"+high, width/2, 10);
 }
 void show_gameover(){
    fill(255);
    textAlign(CENTER, TOP);
    if (present==high) text("New Best: "+ present, width/2, 10);
    else text("Score: "+present+" High: "+high, width/2, 10);
    textAlign(CENTER);
    text("Restart", width/2, height/2);
 }
}
