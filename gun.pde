double a, s, c, h;
int x, y, u, k, i=0,scr=0,highscore=0,count=0,alive;
long entim=0;
float[][] bullet = new float[20][4];
float[][] enemy = new float [20][5];
void setup() {
  alive=1;
  entim=0;
  size(500,900);
  stroke(0);
  for (i=0; i<=19; i++) {
    for (u=0; u<=3; u++) {
      bullet[i][u]=0;
    }
    s=random((float)(2*Math.PI));
    enemy[i][0]=(float)(width/2+height*Math.sin(s));
    enemy[i][1]=(float)(height/2+height*Math.cos(s));
    enemy[i][2]=(float)(0-Math.sin(s)*height/360);
    enemy[i][3]=(float)(0-Math.cos(s)*height/360);
    enemy[i][4]=random(i*10, i*20);
  }
  textAlign(CENTER,TOP);
  i=0;
  scr=0;
  textSize(50);
}
void draw() {
  if (alive==1) {
    background(255);
    fill(0);
    text(scr+"/"+highscore,width/2,10);
    a=Math.sqrt(Math.pow((mouseX-width+height/10.8), 2)+Math.pow((mouseY-height+height/10.8), 2));
    s=(height-height/10.8-mouseY)/a*height/43.2;
    c=(mouseX-width+height/10.8)/a*height/43.2;
    line(width/2, height/2, width/2+(float)c, height/2-(float)s);
    fill(255);
    ellipse(width-height/10.8,height-height/10.8,height/10.8,height/10.8);
    line(width-height/10.8,height-height/10.8,(float)(width-height/10.8+c*2),(float)(height-height/10.8-s*2));
    for (u=0; u<=19; u++) {
      strokeWeight(6);
      bullet[u][0]+=bullet[u][2];
      bullet[u][1]-=bullet[u][3];
      line(bullet[u][0], bullet[u][1], bullet[u][0]+bullet[u][2]/1.75, bullet[u][1]-bullet[u][3]/1.75);
      if (enemy[u][4]<=entim) {
        enemy[u][0]+=enemy[u][2];
        enemy[u][1]+=enemy[u][3];
      }
      strokeWeight(3);
      ellipse(enemy[u][0], enemy[u][1], height/54, height/54);
      if (Math.sqrt(Math.pow(enemy[u][0]-width/2, 2)+Math.pow(enemy[u][1]-height/2, 2))<=40)alive=0;
      for (k=0; k<=19; k++) {
        if (Math.sqrt(Math.pow(bullet[k][0]-enemy[u][0], 2)+Math.pow(bullet[k][1]-enemy[u][1], 2))<=20) {
          bullet[k][0]=0;
          bullet[k][1]=0;
          bullet[k][2]=0;
          bullet[k][3]=0;
          h=random((float)(2*Math.PI));
          enemy[u][0]=(float)(width/2+height*Math.sin(h));
          enemy[u][1]=(float)(height/2+height*Math.cos(h));
          enemy[u][2]=(float)(0-Math.sin(h)*height/360);
          enemy[u][3]=(float)(0-Math.cos(h)*height/360);
          enemy[u][4]=random(entim+5, entim+20);
          scr++;
          if(scr>highscore)highscore=scr;
        }
      }
    }
    if (count>13) {
      if (i==19)i=0;
      else i++;
      entim+=1;
      bullet[i][0]=width/2+(float)c;
      bullet[i][1]=height/2-(float)s;
      bullet[i][2]=(float)c/25*3;
      bullet[i][3]=(float)s/25*3;
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
    textAlign(CENTER,TOP);
    if (scr==highscore) text("New Best: "+ scr, width/2,10);
    else text("Score: "+scr+" High: "+highscore,width/2,10);
    textAlign(CENTER);
    text("Restart", width/2, height/2);
    fill(255);
    if (mouseX>width/2-50 && mouseX<width/2+50 && mouseY>height/2-30 && mouseY<height/2+30)setup();
  }
}
