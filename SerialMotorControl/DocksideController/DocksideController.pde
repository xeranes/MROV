import procontroll.*;
import net.java.games.input.*;
import processing.serial.*;

// Notes on the controller:
//   - Axis are inverted, so we used negative multipliers
//   - The "x" axis is the y-axis irl, but the controller's wierd like that

Serial port;

ControllIO controllIO;
ControllDevice joypad;
ControllStick joy1;
ControllStick joy2;
ControllButton butt0; //up D
ControllButton butt1; //down D
ControllButton butt2; //left D
ControllButton butt3; //right D
ControllButton butt4; //start
ControllButton butt5; //select
ControllButton butt6; //left stick button
ControllButton butt7; //right stick button
ControllButton butt8; //left bumper
ControllButton butt9; //right bumper
ControllButton butt10; //xbox button
ControllButton butt11; //a
ControllButton butt12; //b
ControllButton butt13; //x
ControllButton butt14; //y
int joy1x = 0;
int joy1y = 0;
int joy2x = 0; 
int joy2y = 0;

void setup(){
  size(600, 600);
  noStroke();
  textSize(16);
  
  
  //Set up controller
  controllIO = ControllIO.getInstance(this);
  joypad = controllIO.getDevice("Afterglow Gamepad for Xbox 360");
 
  //Set up joystick w/ proper multiplier for x and y values (negative because otehrwise it's inverted)
  joy1 = joypad.getStick(0);
  joy1.setMultiplier(-255);
  butt0 = joypad.getButton(0);
  butt1 = joypad.getButton(1);
  butt2 = joypad.getButton(2);
  butt3 = joypad.getButton(3);
  butt4 = joypad.getButton(4);
  butt5 = joypad.getButton(5);
  butt6 = joypad.getButton(6);
  butt7 = joypad.getButton(7);
  butt8 = joypad.getButton(8);
  butt9 = joypad.getButton(9);
  butt10 = joypad.getButton(10);
  butt11 = joypad.getButton(11);
  butt12 = joypad.getButton(12);
  butt13 = joypad.getButton(13);
  butt14 = joypad.getButton(14);
  //Set Up 2nd joystick w/ proper multiplier for x and y values (see above for why)
  joy2 = joypad.getStick(1); 
  joy2.setMultiplier(-255); 
  
  //Set up serial
  println(Serial.list());
  port = new Serial(this, Serial.list()[10], 9600);
}

void draw() {
  background(0.5);
  
  joy1y = (int) joy1.getX(); //Rotation control
  joy1x = -(int) joy1.getY(); //y-values need to be inverted, because the controller is weird like that, as I believe I has already noted
  joy2y = (int) joy2.getX(); //X trans control
  joy2x = -(int) joy2.getY(); //Y trans control

  
  text("x joystick 1: " + str(joy1x), 50, 50);
  text("y joystick 1: " + str(joy1y), 50, 100);
  text("x joystick 2: " + str(joy2x), 50, 150); 
  text("y joystick 2: " + str(joy2y), 50, 200);
  text("Button 0: " + str(butt0.pressed()), 50, 225);
  text("Button 1: " + str(butt1.pressed()), 50, 250);
  text("Button 2: " + str(butt2.pressed()), 50, 275);
  text("Button 3: " + str(butt3.pressed()), 50, 300);
  text("Button 4: " + str(butt4.pressed()), 50, 325);
  text("Button 5: " + str(butt5.pressed()), 50, 350);
  text("Button 6: " + str(butt6.pressed()), 50, 375);
  text("Button 7: " + str(butt7.pressed()), 50, 400);
  text("Button 8: " + str(butt8.pressed()), 50, 425);
  text("Button 9: " + str(butt9.pressed()), 50, 450);
  text("Button 10: " + str(butt10.pressed()), 50, 475);
  text("Button 11: " + str(butt11.pressed()), 50, 500);
  text("Button 12: " + str(butt12.pressed()), 50, 525);
  text("Button 13: " + str(butt13.pressed()), 50, 550);
  /*
  String toSend = "!";
  toSend += str(joy1x) + "/";
  toSend += str(joy1y) + "/";
  toSend += str(joy2x) + "/";
  toSend += str(joy2y) + "/";
  toSend += "n";
  port.write(toSend);
  */
  delay(10);
}

//You can also control it with the keyboard (using the up and down arrow keys)
void keyPressed(){
  if (key == CODED) {
    if (keyCode == UP) {
      joy1x ++;
      background(0.5);
    } else if (keyCode == DOWN) {
      joy1x --;
      background(0.5);
    }
    
    joy1x = constrain( joy1x, -255, 255 );
    
  }
}
  
