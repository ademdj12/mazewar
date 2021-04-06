class Ball {
  color c;
  int[] pos = new int[2] ;
  float ra;
  boolean moving = false ;
  Grid g ;
  Ball(int x, int y, color c_, float r, Grid gg) {
    c = c_;
    pos[0] = x;
    pos[1] = y;
    ra = r;
    g = gg;
  }
  void show() {
    fill(color(120,52,221));
    //strokeWeight(3);
    //stroke(51);
    noStroke();
    ellipse(pos[0]*ra+ra/2, pos[1]*ra+ra/2, ra-2, ra-2);
  }

  void move(int x, int y) {
    pos[0] += x;
    pos[1] += y;
  }
}
