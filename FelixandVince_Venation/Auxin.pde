class Auxin{
  
  PVector pos;
  
  Auxin(PVector _pos){
    
    pos = _pos;
    
  }
  
  void display(){
    
    stroke(0,200,255,100);
    
    point(pos.x, pos.y);
  }
  
}
