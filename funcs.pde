class enemy {
  float angle, dist, speed, respawn_time, x, y;
  enemy(int i) {
    angle=random(0, 2)*PI;
    dist=height/2+width/2;
    x=width/2+cos(angle)*dist;
    y=height/2-sin(angle)*dist;
    speed=random(2, 4);
    respawn_time=random(i*10, i*20);
  }
  void rush() {
    if (respawn_time<=0) {
      dist-=speed;
      x=width/2+cos(angle)*dist;
      y=height/2-sin(angle)*dist;
      strokeWeight(1);
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
