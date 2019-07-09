#include <Arduino.h>
#include <SoftwareSerial.h>
#include <Servo.h>

#define BT_RX 5
#define BT_TX 6
#define BTBAUDRATE 9600
SoftwareSerial BTserial(BT_RX, BT_TX); 

#define lWheelPin 10
#define rWheelPin 11
Servo lWheel, rWheel;

 
void doSomething(char cmd) {
  Serial.println(cmd);
}

void setup() {
  Serial.begin(9600); 
  Serial.println("Welcome to this BT WHEELER");
  lWheel.attach(lWheelPin);
  rWheel.attach(rWheelPin);
  BTserial.begin(9600); 
}

void loop() {
  if (BTSerial.available()) // read from HC-05 and send to Arduino Serial Monitor
    doSomething(BTSerial.read()));

if (Serial.available()) // Keep reading from Arduino Serial Monitor and send to HC-05
  BTSerial.write(Serial.read());
}