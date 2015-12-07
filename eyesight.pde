import ddf.minim.analysis.*;
import ddf.minim.*;
import java.util.Random;
import java.lang.Math;
import java.awt.Color;

// Connection information.
final String localHost = "127.0.0.1";

Random rand;
OPC opc;
ColorWheel wheel;
Eye eye;

//Panel IDs
final int RT = 5;
final int R0 = 0;
final int R1 = 1;
final int R2 = 2;
final int R3 = 3;
final int R4 = 4;
final int C0 = 6;
final int C1 = 7;
final int OT = 8;
final int OR = 9;
final int OBR = 10;
final int OBL = 11;
final int OL = 12;

boolean mouseRotate = false;

// Global variables, perhaps for remote control.
int globalBrightness = 255;
int globalDelay = 0;
float fadeFactor = 0.9;
int chance = 500;
boolean modeSwitching = false;
int modeChance = 320;

public void settings() {
  size(1500, 1500, P3D);
}

public void setup() {
  background(0);
  rand = new Random();
  opc = new OPC(localHost, 7890);
  wheel = new ColorWheel(1500);
  eye = new Eye();
}

public void draw() {
  eye.update();
  translate(width/2,height/2,0);
  if (mouseRotate) {
    rotateY(map(mouseX, 0, width, -PI/2, PI/2));
    rotateX(map(mouseY, 0, height, -PI/2, PI/2));
  }
  eye.draw();
  //eye.send();
}

public void keyPressed() {
  if (key == 'r') {
    mouseRotate = !mouseRotate;
  } else if (key == ' ') {
    wheel.newScheme();
  }
}