Snake snake;
Food food;
int scl = 20;
void setup(){
  frameRate(12);
  size(600,600);
  food = new Food();
  food.createFood();
  snake = new Snake();
}

void draw(){
  background(200);
  snake.update();
  snake.show();
  food.drawFood();
  if (snake.eat(food.loc.x, food.loc.y) == true){
    println("fuck");
    food.createFood();
  }
  if (snake.eatMyself() || snake.collide()){
      textSize(40);
      fill(30,30,30);
      text("Game Over", 200,200);
      noLoop();
  }
}

void keyPressed(){
  if (key == CODED){
  if(keyCode == UP){
    snake.direction(0,-1);
  }
  else if (keyCode == DOWN){
    snake.direction(0, 1);
  }
  else if (keyCode == RIGHT){
    snake.direction(1, 0);
  }
  else if (keyCode == LEFT){
    snake.direction(-1, 0);
  }
}}
