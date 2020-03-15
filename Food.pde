class Food {
   int cols = width/scl;
   int rows = height/scl;
   PVector loc;
   
   Food() {
   }
   
   void createFood(){
     loc = new PVector(floor(random(cols)), floor(random(rows)));
     loc.mult(scl);
   }

   void drawFood(){
     rect(loc.x,loc.y, 20,20);
   }
}
