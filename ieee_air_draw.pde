import processing.video.*;
import processing.opengl.*;
import codeanticode.gsvideo.*;
import jp.nyatla.nyar4psg.*;

GSCapture cam;
MultiMarker nya;
PImage x;

void setup()
{
  size(640,480,OPENGL);
  cam = new GSCapture(this,640,480);    //I tried changing the dimensions of webcam window but, there was some prob.
  cam.start();
  nya = new MultiMarker(this,width,height,"camera_para.dat");
  nya.addARMarker("patt.hiro",80);
}

void draw()
{
  frameRate(5);    //if the web cam capturing flickers, tweak this value a bit up or down.
  cam.read();
  nya.detect(cam);
  //background(0);
  nya.drawBackground(cam);
  
  if((nya.isExistMarker(0)))
  {
    nya.beginTransform(0);
    fill(0,0,0);
    scale(5,5,5);
    ellipse(0,0,10,10);
    nya.endTransform();
  }
}
