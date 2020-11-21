double a, s, c, h;
int i=0, scr=0, highscore=0, count=0, alive, amount=20;
float angle=0.5;
bullet bullets[] = new bullet[amount];
enemy enemies[]= new enemy[amount];
void setup() {
  for (int i=0; i<amount; i++) {
    enemies[i] = new enemy(i);
    bullets[i] = new bullet();
  }
  alive=1;
  size(500, 900);
  stroke(0);
  textAlign(CENTER, TOP);
  scr=0;
  textSize(50);
}
void draw() {
  if (alive==1) {
    background(255);
    fill(0);
    for (int i=0; i<amount; i++)enemies[i].rush();
    text(scr+"/"+highscore, width/2, 10);
    a=Math.sqrt(Math.pow((mouseX-width+height/10.8), 2)+Math.pow((mouseY-height+height/10.8), 2));
    s=(height-height/10.8-mouseY)/a*height/43.2;
    c=(mouseX-width+height/10.8)/a*height/43.2;
    line(width/2, height/2, width/2+(float)c, height/2-(float)s);
    fill(255);
    ellipse(width-height/10.8, height-height/10.8, height/10.8, height/10.8);
    line(width-height/10.8, height-height/10.8, (float)(width-height/10.8+c*2), (float)(height-height/10.8-s*2));
    for (int u=0; u<=19; u++) {
      strokeWeight(6);
      bullets[u].fly();
      if (Math.sqrt(Math.pow(enemies[u].x-width/2, 2)+Math.pow(enemies[u].y-height/2, 2))<=40)alive=0;
      for (int k=0; k<=19; k++) {
        if (Math.sqrt(Math.pow(bullets[k].x-enemies[u].x, 2)+Math.pow(bullets[k].y-enemies[u].y, 2))<=20) {
          bullets[k].stop();
          h=random((float)(2*Math.PI));
          enemies[u]=new enemy(1);
          scr++;
          if (scr>highscore)highscore=scr;
        }
      }
    }
    if (count>13) {
      if (i==19)i=0;
      else i++;
      bullets[i].shoot(angle);
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
    textSize(50);
    textAlign(CENTER, TOP);
    if (scr==highscore) text("New Best: "+ scr, width/2, 10);
    else text("Score: "+scr+" High: "+highscore, width/2, 10);
    textAlign(CENTER);
    text("Restart", width/2, height/2);
    fill(255);
    if (mouseX>width/2-50 && mouseX<width/2+50 && mouseY>height/2-30 && mouseY<height/2+30)setup();
  }
}
