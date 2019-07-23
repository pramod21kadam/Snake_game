ArrayList<Integer> x,y ;
int  rate , applex , appley ,score ;
boolean gameOver , gameStart;
char pkey;
PShape s;

void setup(){
  gameOver = false;
  gameStart = false;
  
  score = 0;
  
  applex = (int)random(0,20);
  appley = (int)random(0,20);
  
  size(1000,1000);
  x = new ArrayList<Integer>();
  y = new ArrayList<Integer>();
  rate = 50; 
  frameRate(10);
  x.add(10);
  y.add(10);
  
  pkey =' ';
  
}

void draw(){
 background(255);
 if( gameStart ){
     grid();
     key();
     snake(); 
     apple();
     checkEdges();
   }
  if(!gameStart){
    fill(127);
    textSize(100);
    text("Lets get started",100,200);
    fill(190);
    stroke(127);
    circle(500,600,400);
    fill(255);
    stroke(127);
    circle(500,600,300);    
  }
}
 
void grid(){
  for (int i=0;i<1000;i += rate){
    strokeWeight(0);
    stroke(127);
    line(i,0,i,height);
    line(0,i,width,i);
  }
}

void snake(){
  for (int i=0; i<x.size() ; i++){
      fill(127,100);
      textSize(50);
      text("Score: " + score,50,100);
      strokeWeight(0);
      stroke(127);
      fill(127,100);
      if(i==0)
        fill(80,100);
      rect(x.get(i)*rate,y.get(i)*rate,rate,rate);
  }
}

void key(){
  if(key == 'w' && pkey !='s' ){ y.add(0, y.get(0) - 1); x.add(0, x.get(0) + 0); remove();   pkey = 'w';   }
  if(key == 'a' && pkey !='d' ){ y.add(0, y.get(0)  + 0); x.add(0, x.get(0) - 1);remove();   pkey = 'a';   }
  if(key == 's' && pkey !='w' ){ y.add(0, y.get(0) + 1); x.add(0, x.get(0) + 0); remove();   pkey = 's';   }
  if(key == 'd' && pkey !='a' ){ y.add(0, y.get(0) + 0); x.add(0, x.get(0) + 1); remove();   pkey = 'd';   }
  
}

void over(){
  if(gameOver){
    background(0);
    textSize(100);
    text("Game Over \n       "  + score ,200,500);
    stop();
  }
}
void checkEdges(){
      if( x.get(0)< 0 || x.get(0) >  20 || y.get(0) < 0 || y.get(0) > 20) {
          gameOver = true;
          over();
      }
      for(int i = 1; i < x.size() ; i++ )
        if( (x.get(0) == x.get(i)) && (y.get(0) == y.get(i) ) ){
          gameOver = true;
          over();
        }
}
void remove(){
  if( !( x.get(0) == applex  && appley == y.get(0) ) ){
     y.remove(y.size()-1);
     x.remove(x.size()-1);
   }
   else{
    score +=1 ; 
    applex = (int)random(0,20);
    appley = (int)random(0,20); 
   }
}
void apple(){
  strokeWeight(0);
  fill(0,100,100);
  rect(applex*rate,appley*rate,rate,rate);
}
void keyPressed(){
   gameStart = true;  
}
