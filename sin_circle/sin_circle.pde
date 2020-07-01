float r = 80;
float f = 0;
float rX = 0;
float rY = 0;

boolean done = false;

void setup() {
  size(600, 600, P3D);
  ortho();
  pixelDensity(2);
  colorMode(HSB);
}

void draw() {
  background(0);
  translate(300, 300, 0); 
  noFill();
  strokeWeight(4);
  
  if (f > 50 && f <= 100) {
    rY = cubic_ease(f, 50, 100, 0, PI/4);
  } else if (f > 150 && f <= 200) {
    rY = cubic_ease(f, 150, 200, PI/4, PI/2);
  } else if (f > 250 && f <= 300) {
    rY = cubic_ease(f, 250, 300, PI/2, PI/4);
  } else if (f > 350 && f <= 400) {
    rY = cubic_ease(f, 350, 400, PI/4, 0);
  } else if (f > 450 && f <= 500) {
    rX = cubic_ease(f, 450, 500, 0, PI/4);
  } else if (f > 550 && f <= 600) {
    rX = cubic_ease(f, 550, 600, PI/4, PI/2);
  } else if (f > 650 && f <= 700) {
    rX = cubic_ease(f, 650, 700, PI/2, PI/4);
  } else if (f > 750 && f <= 800) {
    rX = cubic_ease(f, 750, 800, PI/4, 0);
  } else if (f > 800) {
    f -= 800;
    done = true;
  }
  
  rotateX(rX);
  rotateY(rY);
  
  stroke(0);
  for (int i = 0; i <= 400; i++) {
    float alpha = 255*float(400-i)/400.0;
    stroke(255*i/400,255,255,alpha);
    
    float z1 = -1*i;
    float z2 = (-1*i)+1;
    float x1 = r*sin(PI*6*(i-f)/400);
    float x2 = r*sin(PI*6*(i-1-f)/400);
    float y1 = r*cos(PI*6*(i-f)/400);
    float y2 = r*cos(PI*6*(i-1-f)/400);
    line(x1,y1,z1,x2,y2,z2);
  }
  
  pushMatrix();
  float x = r*sin(PI*6*(400-f)/400);
  float y = r*cos(PI*6*(400-f)/400);
  translate(x,y,0);
  fill(#ffffff);
  sphere(10);
  popMatrix();
  
  f+=1.333333333333;
  
  //saveFrame("images/f##.png");
  //if (done) {
  //  exit();
  //}
}

float cubic_ease(float value, float start1, float stop1, float start2, float stop2) {
  float b = start2;
  float c = stop2 - start2;
  float t = value - start1;
  float d = stop1 - start1;
  
  t /= d/2;
  if (t < 1) return c/2*t*t*t + b;
  t -= 2;
  return c/2*(t*t*t + 2) + b;
}
