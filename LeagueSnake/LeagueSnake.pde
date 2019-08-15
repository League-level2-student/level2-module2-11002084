//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*



//Add x and y member variables. They will hold the corner location of each segment of the snake.

class Segment {
  
int x;
int y;

int getX(){
  return x;
}
  
int getY(){
   return y;
}

void setX(int x){
 this.x = x;
}

void setY(int y){
 this.y = y; 
}
// Add a constructor with parameters to initialize each variable.
Segment(int x, int y){
  this.x = x;
  this.y = y;
}
}
//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
  Segment head;
  int foodX;
  int foodY;
  ArrayList <Segment> tail= new ArrayList <Segment>();
//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
  size(500, 500);
  head = new Segment(250, 250);
  frameRate(20);
  dropFood();
}

void draw() {
  move();
  background(0, 0, 0);
  drawFood();
  drawSnake();
  eat();
}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void drawFood() {
  //Draw the food
  fill(255, 0, 0);
  rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(255, 255, 0);
  rect(head.getX(), head.getY(), 10, 10);
  manageTail();
}

//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*
void drawTail() {
  //Draw each segment of the tail 
  for(int i=0; i<tail.size(); i++){
    rect(tail.get(i).getX(), tail.get(i).getY(), 10, 10);
  }
}


void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  tail.add(new Segment(head.getX(), head.getY()));
  tail.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  for(int i=0; i<tail.size(); i++){
  if(head.getX() == tail.get(i).getX() && head.getY() == tail.get(i).getY()){
  numFoodEaten = 1;
  tail = new ArrayList<Segment>();
  tail.add(new Segment(head.getX(), head.getY()));
  }
  }
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

  int direction=UP;
  int numFoodEaten = 0;

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(keyCode == 38 && direction != DOWN){
    direction = UP;
  }else if(keyCode == 40 && direction != UP){
    direction = DOWN;
  }else if(keyCode == 37 && direction != RIGHT){
    direction = LEFT; 
  }else if(keyCode == 39 && direction != LEFT){
    direction = RIGHT;
  }
}

void move() {
  if(direction==UP){
    head.setY(head.getY()-10);
  }else if(direction == DOWN){
    head.setY(head.getY()+10); 
  }else if(direction == LEFT){
    head.setX(head.getX()-10);
  }else if(direction == RIGHT){
    head.setX(head.getX()+10);
  }
    
  switch(direction) {
  case UP:
    direction = UP;
    break;
  case DOWN:
    direction = DOWN;
    break;
  case LEFT:
   direction = LEFT;
    break;
  case RIGHT:
    direction = RIGHT;
    break;
  }
  checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.getX()>500){
   head.setX(0);
 }else if(head.getX()<0){
   head.setX(500);
 }else if(head.getY()>500){
   head.setY(0);
 }else if(head.getY()<0){
   head.setY(500);
 }
}


void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  if(head.getX()==foodX && head.getY()==foodY){
    numFoodEaten++;
    dropFood();
    drawFood();
    tail.add(new Segment(head.getX(), head.getY()));
  }
}
