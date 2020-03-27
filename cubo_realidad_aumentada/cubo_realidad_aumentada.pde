/*
* cubo_realidad_aumentada
 * by Eduardo Olivares Borja. 
 * 
 * Robot de 4 grados de libertad.
*/
import processing.video.*;
import jp.nyatla.nyar4psg.*;
import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.Finger;
LeapMotionP5 leap;

Capture cam;
MultiMarker nya;
PShape ejemplo1, s;
float rotX;
float rotY;
void setup() {
  size(640,480,P3D);
  colorMode(RGB, 100);
  println(MultiMarker.VERSION);
  cam=new Capture(this,640,480);
  nya=new MultiMarker(this,width,height,"camera_para5.dat",NyAR4PsgConfig.CONFIG_PSG);
  nya.addARMarker("patt.hiro",80);
  cam.start();
    leap = new LeapMotionP5(this);
  ejemplo1 = loadShape("objeto.obj");

}
void draw()
{
  if (cam.available() !=true) {
      return;
  }
  cam.read();
  nya.detect(cam);
  background(0);
  nya.drawBackground(cam);//frustumを考慮した背景描画
  if((!nya.isExist(0))){
    for (Finger finger : leap.getFingerList()) {
    PVector fingerPos = leap.getTip(finger);
    ellipse(fingerPos.x, fingerPos.y, 10, 10);
  
    translate(fingerPos.x,fingerPos.y);
  rotateX(9.9);
  rotateY(8);
  rotateZ(-0.2);
 // box(40);
   fill(#3642A2);// color de la figura
  scale(70);
  smooth();//contorno de l figura
  lights();// contorno de la figura
    noFill();// quitar el color del entorno}
      rotateY(map(fingerPos.x,width,0,-PI/85,4)) ;//(num,100.5,mouseY,100.5, -PI/2))
  shape(ejemplo1);
    }
    return;
  }

}

  
