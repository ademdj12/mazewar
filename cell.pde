class Cell {
  PVector grid_position;
  PVector size;
  boolean allocated = false;
  boolean locked = random(0,100) < 12;
  color dominant_color;
  float vib, inc, r;
  Cell(int row, int col, float w, float h) {
    grid_position = new PVector(row, col);
    size = new PVector(w, h);
    inc = random(0.05, 0.015);
    r = random(0.90, 0.99);
    vib = size.x - size.x * r - r/2;
    if (locked) {
      dominant_color = color(150, 16, 53);
    } else {
      dominant_color = color(255, 255, 255);
    }
  }
  void show() {
    if (vib >= size.x-size.x*r || vib <= 0) { 
      inc*=-1;
    }
    vib += inc;
    fill(dominant_color);
    rectMode(CENTER);
    rect(grid_position.x*size.x+size.x/2+noise(random(-0.1,0.1)*vib), grid_position.y*size.y+size.y/2+noise(random(-0.1,0.1))*vib, size.x-vib, size.y-vib);
  }
  void allocate(color c) {
    if (allocated) {
      resetCell();
    } else {
      dominant_color = c;
      allocated = true;
    }
  }
  void resetCell() {
    allocated = false;
    dominant_color = color(255, 255, 255, 255);
  }
}
