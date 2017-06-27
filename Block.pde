class Block{
  int x = 0;
  int y = 0;
  color type;
  boolean stroke = true;
  boolean hasPlayer = false;
  
 Block(int x_, int y_, int type_){
   x = x_;
   y = y_;
   
   switch(type_){
     case 0:
       type = color(255,0);
       //stroke = false;
       break;
     case 1:
       type = color(255,0,0);
       break;
     case 2:
       type = color(20);
       break;
   }
 }
 
 void Draw(){
   if(hasPlayer){
     fill(0,0,255);
     rect(x,y,50,50);
   }else{
     if(stroke){
       stroke(0);
     }else{
       noStroke();
     }
     fill(type);
     rect(x,y,50,50);
   }
 }
}