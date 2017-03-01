

float cx, cy;
float radius;
float centerRadius;

float iwidth, iheight;

float noLineWidth;
float noLineMargin;

float textSize;

float textX, textY;
float textMargin;

float angle, ihour;

float lx1, ly1, lx2, ly2;
int i, j;

void setup(){
  
  size(500, 500);
  //size(displayWidth, displayHeight);
  
  //iwidth = min(displayWidth, displayHeight);
  //iheight = iwidth;
  
  iwidth = 500;
  iheight = 500;
  
  cx = iwidth / 2.0;
  cy = iheight / 2.0;
   
  radius = iwidth / 1.5;
  textMargin = 37.0;
  
  centerRadius = 10.0;
  textSize = 20.0;
}

void draw(){
  
  background(0, 0, 0, 255);
  smooth();
  
  for(i = 0; i < 60; i++){
    
    if(i % 5 == 0){
      noLineMargin = 17;
      noLineWidth = 2;
      
    }else{
      noLineMargin = 10;
      noLineWidth = 1;
    }
    
    lx1 = cx + (radius/2 - 3) * cos(2*PI*i/60);
    ly1 = cy + (radius/2 - 3) * sin(2*PI*i/60); 
  
    lx2 = cx + (radius/2 - noLineMargin) * cos(2*PI*i/60);
    ly2 = cy + (radius/2 - noLineMargin) * sin(2*PI*i/60); 
  
    strokeWeight(noLineWidth);
    stroke(255, 255, 255, 255);
    
    line(lx1, ly1, lx2, ly2); 
  }
  
  j = 1;
  
  for(i = -1; i <= 10; i++){
    
    textX = cx + (radius/2 - textMargin) * cos(2*PI*(i - 1)/12);
    textY = cy + (radius/2 - textMargin) * sin(2*PI*(i - 1)/12) + textSize/2;
    
    fill(255, 255, 255, 255);
    
    textAlign(CENTER);
    textSize(textSize);
    text(nf(j,2), textX, textY);
    
    j++;
  }
  
  strokeWeight(5);
  
  lx1 = cx;
  ly1 = cy;
  
  // Second - hand
  
  angle = second() - 15;
  
  lx2 = cx + (radius/2 - textMargin - 10) * cos(2*PI*angle/60);
  ly2 = cy + (radius/2 - textMargin - 10) * sin(2*PI*angle/60); 
  
  stroke(255, 0, 0, 200);
  line(lx1, ly1, lx2, ly2); 
  
  // Minute - hand
  
  angle = minute() - 15;
  
  lx2 = cx + (radius/2 - textMargin - 15) * cos(2*PI*angle/60);
  ly2 = cy + (radius/2 - textMargin - 15) * sin(2*PI*angle/60); 
  
  stroke(0, 255, 0, 200);
  line(lx1, ly1, lx2, ly2);
  
  // Hour - hand
  
  ihour = hour();
  
  if(ihour > 12){
    ihour -= 12;
  }
  
  ihour -= 3;
  angle = 2*PI*((ihour)/12 + (minute() % 5));
  
  lx2 = cx + (radius/4) * cos(angle);
  ly2 = cy + (radius/4) * sin(angle); 
  
  stroke(0, 255, 255, 255);
  line(lx1, ly1, lx2, ly2);
  
  strokeWeight(5);
  stroke(255, 255, 255, 100);
  
  fill(100, 100, 100, 100);
  
  ellipse(cx, cy, centerRadius, centerRadius);
  ellipse(cx, cy, radius, radius);
  
}