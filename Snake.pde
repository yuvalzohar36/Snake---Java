class Snake {
  int scale = 20;
  float a, b;
  float x = 0;
  float y = 0;
  float x_speed = 2;
  float y_speed = 0;
  int total_length = 0;
  ArrayList<PVector> snake_tail = new ArrayList<PVector>();  

  void update(){
    if (total_length > 0) {
      if (total_length == snake_tail.size() && !snake_tail.isEmpty()) {
        snake_tail.remove(0);
      }
      snake_tail.add(new PVector(x, y));
    }
    x += x_speed*scale;
    y += y_speed*scale;
    println(x);
    println(y);
    x = constrain(x,0,width-scale);
    y = constrain(y,-1,width-scale);
  }
  
  void show(){
    fill(255);
    for (PVector v : snake_tail) {
      rect(v.x, v.y, scl, scl);
    }
    rect(x, y, scl, scl);
  }
  
  void direction(int xdir, int ydir){
    x_speed =xdir;
    y_speed =ydir;
  }
  
  Boolean eat(float a_pos, float b_pos) {
    float d = dist(a_pos,b_pos,x,y);      // x&&y - snake position || a&&b - food position
    if(d < 20){
      total_length++;
      return true;
    }
    else {
      return false;
    }
  }
  
  Boolean eatMyself(){
    for (PVector v : snake_tail) {
          if (x == v.x && y == v.y){
            return true;
          }
        } 
    return false;
    }
    
  Boolean collide(){
    if (x >= width-20 || x <= 0 || y >= height-20 || y <= -1){
      return true;
    }
    return false;
  }
    

}
