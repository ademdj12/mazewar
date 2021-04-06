Grid grid;
int vib,inc;
void setup(){
  size(600,600);
  vib = 52;inc = 1;
  PVector pos = new PVector(0,0);
  grid = new Grid(width,height,10,10,pos);
  grid.createBall(0,0,color(255,125,20));
  grid.show();

}
void draw(){
   background(vib);
   grid.show();
   if(vib == 121 || vib == 51) inc *= -1;
   vib += inc;
}
void keyPressed(){
  if(keyCode == 38){grid.moveBall(0,-1);}
  else if(keyCode == 40){grid.moveBall(0,1);}
  else if(keyCode == 39){grid.moveBall(1,0);}
  else if(keyCode == 37){grid.moveBall(-1,0);}

}
