PImage img1;
PImage img2;
PImage b;
PImage a;
PImage c;
PImage cursor;

PFont font1;
int pantalla=0;

int x1; //almacenará la posición
int x2;
int x3;
int x4;

import ddf.minim.*;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Boundary> boundaries;
ArrayList<Lollipop> pops;

Minim soundengine;
AudioSample sonido1;

void setup(){
size(700, 700);
  box2d = new Box2DProcessing(this,20);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(20, -20);

pops = new ArrayList<Lollipop>();
boundaries = new ArrayList<Boundary>();

  //boundaries.add(new Boundary(width/4,height-5,width/2-50,10,0));
  boundaries.add(new Boundary(.2*width/4,height-50,width/2-50,20,0));
  boundaries.add(new Boundary(width-400,height/3,20,height,0));
  boundaries.add(new Boundary(20,height/3,20,height,0));

cursor(CROSS);
b= loadImage("pez3.png");
a= loadImage("pez2.png");
c= loadImage("pulpo.png");
cursor= loadImage("conchita.png");
soundengine = new Minim(this);
sonido1 = soundengine.loadSample("burbujas.mp3", 1024);

x1= -b.width;
x2= a.width;
x3= -c.width;

frameRate(15);

}
 

void draw (){
  {
  if(mouseX < 100) {
    cursor(cursor, 0, 0);
  } 
}
   switch (pantalla){
case 0:
img1 = loadImage("AcuarioF1.png");
scale (.55);
image(img1 , 0 , 0);

img2 = loadImage("Mizuno.png");
image(img2 , 10 , 0);

b = loadImage("pez3.png");
image(b, x1, 0);

if(x1 > width){
  x1 = -b.width;
}else{
  x1 += 50;
}


a = loadImage("pez2.png");
image(a, x2, 50, 350, 350);

if(x2 < -a.width){
  x2 = width;
}else{
  x2 += -60;
}


c = loadImage("pulpo.png");
image(c, x3, -10, 150, 150);

if(x3 < -c.width){
  x3 = width;
}else{
  x3 += -35;
}



font1 = loadFont ("ComicSansMS-Bold-48.vlw");
textFont(font1, 180);
text("GAME!", 580, 720);
font1 = loadFont ("ComicSansMS-Bold-48.vlw");
textFont(font1, 70);
text("Mizu no", 780, 320);
font1 = loadFont ("ComicSansMS-Bold-48.vlw");
fill (random (57), random (201));
textFont(font1, 70);
text("Mantén en Click para continuar", 200, 820);
   if (mousePressed){
         pantalla = 1;
       }
       
  break;
  
  case 1:
  img1 = loadImage("AcuarioF1.png");
scale (.55);
image(img1 , 0 , 0);



fill (255);
  font1 = loadFont ("ComicSansMS-Bold-48.vlw");
textFont(font1, 130);
text("Indicaciones", 130, 400);
 font1 = loadFont ("ComicSansMS-Bold-48.vlw");
textFont(font1, 50);
text("Llena la canasta de comida", 100, 550);
font1 = loadFont ("ComicSansMS-Bold-48.vlw");
textFont(font1, 50);
text("¡Sé rápido porque la corriente se la lleva!", 100, 650);
font1 = loadFont ("ComicSansMS-Bold-48.vlw");
textFont(font1, 50);
text("Para soltar la comida, haz Click", 100, 750);
font1 = loadFont ("ComicSansMS-Bold-48.vlw");
textFont(font1, 50);
text("Para comenzar a jugar presiona ENTER", 100, 850);

   if (keyPressed){
       if (key==ENTER);
       pantalla = 2;
      
}
  break;
  
   case 2:
   //background (255, 0, 0);
img1 = loadImage("AcuarioF1.png");
scale (.55);
image(img1 , 0 , 0);

font1 = loadFont ("ComicSansMS-Bold-48.vlw");
textFont(font1, 50);
text("Para terminar presiona ENTER", 100, 50);

 box2d.step();
 for (Boundary wall: boundaries) {
    wall.display();
  }

for (Lollipop p: pops) {
    p.display();
  }

for (int i = pops.size()-1; i >= 0; i--) {
    Lollipop p = pops.get(i);
    if (p.done()) {
      pops.remove(i);
    }
  }





b = loadImage("pez3.png");
image(b, x1, 0, 600, 600);

if(x1 > width){
  x1 = -b.width;
}else{
  x1 += 80;
}


a = loadImage("pez2.png");
image(a, x2, 500, 350, 350);

if(x2 < -a.width){
  x2 = width;
}else{
  x2 += -70;
}


c = loadImage("pulpo.png");
image(c, x3, -10, 150, 150);

if(x3 < -c.width){
  x3 = width;
}else{
  x3 += -35;
}


a = loadImage("pez2.png");
image(a, x2, 550, 300, 300);

if(x2 < -a.width){
  x2 = width;
}else{
  x2 += -70;
}



a = loadImage("pez2.png");
image(a, x2, 400, 350, 350);

if(x2 < -a.width){
  x2 = width;
}else{
  x2 += -70;
}



    
    if (keyPressed){
       if (key==ENTER);
       pantalla = 0;
   
      }
   
   break;

 }
}
 void mousePressed() {
   Lollipop p = new Lollipop(mouseX,mouseY);
  pops.add(p);
  if (mousePressed) {
    sonido1.trigger();
  }
}
 


  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  