int i,count=0,alive, amount=20;
bullet bullets[] = new bullet[amount];
enemy enemies[]= new enemy[amount];
score scr=new score();
void setup() {
  for (int i=0; i<amount; i++) {
    enemies[i] = new enemy(i);
    bullets[i] = new bullet();
  }
  alive=1;
  size(500, 900);
  stroke(0);
  strokeWeight(2);
  scr.present=0;
  textSize(50);
}
void draw() {
  if (alive==1) {
    background(255);
    scr.show();
    for (int i=0; i<amount; i++)enemies[i].rush();
    fill(255);
    line(width/2, height/2, width/2+cos(joystick_angle())*40, height/2-sin(joystick_angle())*40);
    ellipse(width*0.75,height*0.75,40,40);
    line(width*0.75,height*0.75,width*0.75+cos(joystick_angle())*20,height*0.75-sin(joystick_angle())*20);
    for (int u=0; u<=19; u++) {
      bullets[u].fly();
      if (Math.sqrt(Math.pow(enemies[u].x-width/2, 2)+Math.pow(enemies[u].y-height/2, 2))<=40)alive=0;
      for (int k=0; k<=19; k++) {
        if (Math.sqrt(Math.pow(bullets[k].x-enemies[u].x, 2)+Math.pow(bullets[k].y-enemies[u].y, 2))<=20) {
          bullets[k].stop();
          enemies[u]=new enemy(1);
          scr.present++;
          if (scr.present>scr.high)scr.high=scr.present;
        }
      }
    }
    if (count>13) {
      if (i==19)i=0;
      else i++;
      bullets[i].shoot(joystick_angle());
      count=0;
    }
    if (count>=10 && count<=13) {
      count++;
      fill(255, 0, 0);
      ellipse(width/2, height/2, 10, 10);
    } else {
      count++;
      fill(255);
      ellipse(width/2, height/2, 10, 10);
    }
  } else {
    background(200, 10, 10);
    scr.show_gameover();
    if (mouseX>width/2-50 && mouseX<width/2+50 && mouseY>height/2-30 && mouseY<height/2+30)setup();
  }
}
