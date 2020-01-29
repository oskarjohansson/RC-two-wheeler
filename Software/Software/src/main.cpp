#include <Arduino.h>
#include <SoftwareSerial.h>
#include <Servo.h>
#include <RF24.h>
#define BT_RX 5
#define BT_TX 6
#define BTBAUDRATE 9600
SoftwareSerial BTserial(BT_RX, BT_TX); 

#define lWheelPin 10
#define rWheelPin 11
Servo lWheel, rWheel;

#define NOSPEED 90
#define DEFAULTSPEED 20
#define TURNSPEED 20
long lasttime = millis(); 

void doSomething(char cmd) {
  lasttime = millis(); 
  int rSpeed = NOSPEED, lSpeed = NOSPEED;
  switch (cmd)
  {
  // FORWARD   

  case 'P':
    lSpeed = 0;
    rSpeed = 0;
    break;
  case 'O':
    lSpeed = 180;
    rSpeed = 180;
    break;
  case 'R': // Right
    rSpeed += DEFAULTSPEED;
    break;
  case 'L':
    lSpeed += DEFAULTSPEED;
    break;
  case 'F':
    rSpeed += DEFAULTSPEED; lSpeed += DEFAULTSPEED;
    break;
  case 'I':
    rSpeed += DEFAULTSPEED + TURNSPEED; lSpeed += DEFAULTSPEED;  
    break;
  case 'G':
    rSpeed += DEFAULTSPEED; lSpeed += DEFAULTSPEED + TURNSPEED;
    break;

  // REVERSE
  case 'B':
    rSpeed -= DEFAULTSPEED; lSpeed -= DEFAULTSPEED; 
    break;   
  case 'H':
    rSpeed -= DEFAULTSPEED; lSpeed -= (DEFAULTSPEED + TURNSPEED);  
    break;
  case 'J':
    rSpeed -= (DEFAULTSPEED + TURNSPEED); lSpeed -= DEFAULTSPEED;
    break;


  default:
    break;
  }
  lWheel.write(lSpeed);
  rWheel.write(rSpeed);
  Serial.print("Command: ");Serial.print(cmd); Serial.print(" left: "); Serial.print(lSpeed); Serial.print(" right: "); Serial.println(rSpeed);
}

void setup() {
  Serial.begin(9600); 
  Serial.println("Welcome to this BT WHEELER");
  lWheel.attach(lWheelPin);
  rWheel.attach(rWheelPin);
  BTserial.begin(9600); 
}

void loop() {
  if (Serial.available()) // read from HC-05 and send to Arduino Serial Monitor
    doSomething(Serial.read());
  if (BTserial.available()) // read from HC-05 and send to Arduino Serial Monitor
    doSomething(BTserial.read());


  if((millis() - lasttime) > 500) {
    lWheel.write(NOSPEED);
    rWheel.write(NOSPEED);
  }

  /* if (BTserial.available()) // read from HC-05 and send to Arduino Serial Monitor
    doSomething(BTserial.read());

if (Serial.available()) // Keep reading from Arduino Serial Monitor and send to HC-05
  BTserial.write(Serial.read());
  */
}