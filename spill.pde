int wy = 0;
int wx = 0;
int px = 4;
int py = 4;
int pvx = 4;
int pvy = 5;

int[][] startLevel = {
  {2,2,2,2,2,2,2,2},
  {2,0,0,0,0,2,0,2},
  {2,0,0,0,0,2,0,2},
  {2,0,0,1,1,0,0,2},
  {2,0,0,1,0,0,0,2},
  {2,0,0,0,0,2,0,2},
  {2,0,0,0,0,0,0,2},
  {2,2,2,2,2,2,2,2}
};

Block[][] level = new Block[startLevel.length][startLevel[0].length];

void setup(){
  size(500,400);
  background(200);
  for(int i = 0; i < startLevel.length; i++){
     for(int j = 0; j < startLevel[0].length; j++){
       try{
         level[i][j] = new Block(wy+i*50,wx+j*50,startLevel[i][j]);
       }catch(Exception e){
         level[i][j] = new Block(wy+i*50,wx+j*50,color(255,0));
       }
     }
  }
}

void draw(){
  background(200);
  
  //Update block position
  for(int i = 0; i < startLevel.length; i++){
     for(int j = 0; j < startLevel[0].length; j++){
         level[i][j].x = /*wy*/ + j*50;
         level[i][j].y = /*wx*/ + i*50;
     }
  }
  
  //Update player position
  try{
    level[pvx][pvy].hasPlayer = false;
    pvx = px;
    pvy = py;
    level[px][py].hasPlayer = true;
  }catch(Exception e){
  }
  
  //Gravity
  try{
    /*
    if(level[pvx+1][pvy].type == color(255,0)){
      px++;
    }
    */
  }catch(Exception e){
  }
  
  //Draw player and level
  for(int i = 0; i < startLevel.length; i++){
     for(int j = 0; j < startLevel[0].length; j++){
         level[i][j].Draw();
     }
  }
  
  //Debug
  fill(0,0,255);
  text(wx,400,30);
  text(mouseX,430,30);
  text(mouseX/50,460,30);
  
  text(wy,400,60);
  text(mouseY,430,60);
  text(mouseY/50,460,60);
}

void keyPressed(){
  if(key == 'w'){
    if(level[px-1][py].type == color(255,0)){
      wx += 50;
      px--;
    }
  }else if(key == 's'){
    if(level[px+1][py].type == color(255,0)){
      wx -= 50;
      px++;
    }
  }
  if(key == 'a'){
    if(level[px][py-1].type == color(255,0)){
      wy += 50;
      py--;
    }
  }else if(key == 'd'){
    if(level[px][py+1].type == color(255,0)){
      wy -= 50;
      py++;
    }
  }
}

void placeBlock(int r, int g, int b){
  if(level[mouseY/50][ mouseX/50].type != color(20) && level[ mouseY/50][ mouseX/50].hasPlayer == false){
    level[mouseY/50][ mouseX/50].type = color(r,g,b);
    level[mouseY/50][ mouseX/50].stroke = true;
  }
}
void removeBlock(){
  if(level[mouseY/50][mouseX/50].type != color(20) && level[mouseY/50][mouseX/50].hasPlayer == false){
    level[mouseY/50][mouseX/50].type = color(255,0);
    level[mouseY/50][mouseX/50].stroke = false;
  }
}

void mousePressed(){
  if(mouseX < 400){
    if(mouseButton == LEFT){
       placeBlock(255,0,0); 
    }else if(mouseButton == RIGHT){
       removeBlock(); 
    }else {
      placeBlock(0,255,0);
    }
  }
}
