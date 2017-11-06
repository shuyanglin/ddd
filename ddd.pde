//test

ArrayList us;
boolean flag=true;
int distance=50;
Society s;

void setup()
{
  
  size(500,500);
  smooth();
  
  s = new Society();
  us = s.ppl; 
    
  
}
void mousePressed()
{
  
}
void draw()
{
  s.collective = 0;
  background(-1);
  
  //rect(0,250,1000,300);
  for (int i=0;i<us.size();i++)
  {
    Person Pn1 = (Person) us.get(i);
    Pn1.display();
    Pn1.goAbout();
    for (int j = i + 1; j < us.size(); j++) {
      Person Pn2 = (Person) us.get(j);
      Pn2.goAbout();
      if (dist(Pn1.x, Pn1.y, Pn2.x, Pn2.y)< distance)
      {
        for (int k = j + 1; k < us.size(); k++) {
          Person Pn3 = (Person) us.get(k);
          if (dist(Pn3.x, Pn3.y, Pn2.x, Pn2.y)< distance && dist(Pn1.x, Pn1.y, Pn2.x, Pn2.y)< distance  ) {
            if (flag) {
              stroke(255, 10);
              fill(Pn3.c, 95); // method to access the class property
            }
            else {
              noFill();
              strokeWeight(1);
              stroke(0, 20);
            }
            beginShape(TRIANGLES);
            vertex(Pn1.x, Pn1.y);
            vertex(Pn2.x, Pn2.y);
            vertex(Pn3.x, Pn3.y);
            endShape();
            
            s.collective++;
            println("num: "+s.collective);
            
          }
 
          Pn3.goAbout();
        }
      }
    }
  }
  //text(s.collective+"/"+s.population, 50, 250);
  //saveFrame("frames/######.tif");
}
 
void keyPressed()
{
  if(key == 'f'){
    flag=!flag;  
  }
  
  if(keyCode == UP){
    s.giveBirth();
  }
  
  if(keyCode == DOWN){
    s.kill();
  }
  
}
class Person {
  float x, y, r;
  color c;
  int p; // personality
  int i=1, j=1;
  Person( )
  {
    x = random(0, width);
    y = random(0, height);
    r = random(1,5);
    int n = (int)random(0, 5);
    if (n==0)
    {
      c = color(#05CDE5);
    }
    if (n==1)
    {
      c = color(#FFB803);
    }
    if (n==2)
    {
      c = color(#FF035B);
    }
    if (n==3)
    {
      c = color(#94fca6);
    }
    if (n==4)
    {
      c = color(#6e1ccc);
    }
    
    //start from any direction
    int p = (int)random(0,2);
    int q = (int)random(0,2);
    if(p==1)
    {
      i = -1;
    }
    if(q==1)
    {
      j = -1;
    }
  }
 
  void display()
  {
    pushStyle();
    noStroke();
    fill(c);
    ellipse(x, y, r, r);
    popStyle();
  }
 
  void goAbout()
  {
    x = x + j*0.01;
    y = y + i*0.01;
    if (y > height-r) i=-1;
    if (y < 0+r) i=1;
    if (x > width-r) j=-1;
    if (x < 0+r) j=1;
  }
}

class Society{
  ArrayList ppl;
  int collective = 0;
  int population = 10;
  Society()
  {
    ppl = new ArrayList();
    for (int i=0;i<100;i++)
    {
      Person P = new Person();
      ppl.add(P);
    }
  }
  
  void giveBirth(){
    ppl.add(new Person());
    population ++;
  }
  
  void kill(){
    ppl.remove(0);
    population --;  
  }
}