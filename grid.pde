
class Grid {
  PVector position = new PVector(0, 0);
  PVector size;
  PVector division;
  Cell[][] cells;
  Ball[] balls = new Ball[3];
  int ballscount = 0;
  int rows, cols;
  Grid(float w, float h, int r, int c, PVector pos) {
    position = pos;
    size = new PVector(w, h);
    division = new PVector(r, c);
    cells = new Cell[r][c];
    rows = r ; 
    cols = c;
    for (int i = 0; i < r; i++) {
      for (int j = 0; j < c; j++) {
        cells[i][j] = new Cell(i, j, w/c, h/r);
      }
    }
  }
  void show() {
    fill(255, 255, 255);
    noStroke();
      //rect(position.x, position.y, size.x, size.y);
      //stroke(51);
      //for (int i = 1; i <division.x; i++) {
      //  line(0, position.y+i*size.y/division.x, size.x, position.y+i*size.y/division.x);
      //}
      //for (int i = 0; i < division.y; i++) {
      //  line(position.x+i*size.x/division.y, 0, position.x+i*size.x/division.y, size.y);
      //}
    for (Cell[] l : cells) {
      for (Cell c : l) {
        c.show();
      }
    }
    for (Ball b : balls) {
      if (b != null) b.show();
    }
  }
  void createBall(int i, int j, color c) {
    if (ballscount < 3) {
      balls[ballscount] = new Ball(i, j, c, size.x/division.y, this);
      ballscount += 1;
      cells[i][j].allocate(c);
    }
  }
  boolean agreeToMoveTo(int a, int b) {
    //println(a < rows && b < cols);println(balls[0].pos[0], balls[0].pos[1]);
    return  a < rows && b < cols && a >= 0 && b >= 0;
  }
  void moveBall(int x, int y) {
    if(agreeToMoveTo(balls[0].pos[0]+x, balls[0].pos[1]+y)){
      if(!cells[balls[0].pos[0]+x][balls[0].pos[1]+y].locked){
      balls[0].move(x, y);
      cells[balls[0].pos[0]][balls[0].pos[1]].allocate(balls[0].c);
      moveBall(x,y);
      }
    }
  }
}
