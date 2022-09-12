
int player1Score = 0;
int player2Score = 0;
float player1Y = 300;
float player2Y = 300;
float ballX = 300;
float ballY = 100;
float ballSpeedX = 5;
float ballSpeedY = 5;
// 3->Easy , 4->Medium , 5->Hard
float difficulty = 4;
boolean newGame = true;

void setup(){
  size(800, 600);
  textSize(50);
}
void draw(){
  background(0);
  stroke(255);
  line(width/2, 100, width/2, height);
  //Ball code
  if (newGame == true){
    ballX = width/2;
    ballY = random(100, height);
    newGame = false;
  }
  ballX += ballSpeedX;
  ballY += ballSpeedY;
  ellipse(ballX, ballY, 20, 20);
  if((ballY< 100) || (ballY > height)){
    ballSpeedY *= -1;
  }
  //Player1 code
  if(ballY > player1Y){
    player1Y += difficulty;
  }else{
    player1Y -= difficulty;
  }
  if(player1Y > height - 100){
    player1Y = height - 100;
  } else if(player1Y < 100){
    player1Y = 100;
  }
  rect(30, player1Y, 20, 100);
  if(ballX < 60){
    if((ballY > player1Y-10) && (ballY < player1Y + 110)){
        ballSpeedX = ballSpeedX * -1;
    }else{
      player2Score += 1;
      newGame = true;
    }
  }
  
  //Player2 code
  player2Y = mouseY - 50;
  if(player2Y > height - 100){
    player2Y = height - 100;
  }else if(player2Y < 100){
    player2Y = 100;
  }
  rect(width - 50, player2Y, 20, 100);
  if(ballX > width - 60){
    if((ballY > player2Y - 10) && (ballY < player2Y + 110)){
        ballSpeedX = ballSpeedX * -1;
    }else{
      player1Score += 1;
      newGame = true;
    }
  }
  // Scores
  text(player1Score, width/2 - 100, 70);
  text(player2Score, width/2 + 100, 70);
}
