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
  drawTail();
}

//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*
void drawTail() {
  //Draw each segment of the tail 
  
}


void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

  int direction=UP;
  int numFoodEaten = 0;

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  
}

void move() {
  if(direction==UP){
    head.setY(head.getX()+10);
  }else if(direction == DOWN){
    head.setY(head.getX()+10); 
  }
    
  switch(direction) {
  case UP:
    direction = UP;
    break;
  case DOWN:
    direction = DOWN;
    break;
  case LEFT:
   // figure it out 
    break;
  case RIGHT:
    // mystery code goes here 
    break;
  }
  
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 
}


void eat() {
  //When the snake eats the food, its tail should grow and more food appear
}
