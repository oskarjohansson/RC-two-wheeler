/**
 * @file main.cpp
 * @author Oskar Johansson (oskar@irisnet.se)
 * @brief This project is to work with 2 MCU and 2 nRF24 to communicate throttle and turn. Based on 
 *        https://github.com/caselabbet/case-rc-car by Isak Åslund. 
 * @version 0.1
 * @date 2020-01-29 
 */
#include <Arduino.h>
#include <SoftwareSerial.h>
#include <Servo.h>
#include <RF24.h>


// Choose which to compile for 
#define reciever
//#define transmitter 


/**
 * To reuse same code for reciever and trasmitter 
 */


/**
 * Pin definition, same for reciever as transmitter
 */
#define lWheelPin 5
#define rWheelPin 6
#define throttlePin A1
#define turnPin A2
#define CE 9 
#define CSN 10

RF24 radio(CE,CSN); 
const byte address[6] = "00010";    // Adress for communicating
unsigned long lastData = 0;         // Used for knowing if data has been received recently
unsigned long lasttime = millis();  // To track of how long time since last transmitt / recieve 
/**
 * A struct to store the recieved 
 * throttle and turn  
 */
typedef struct{
    int throttle;
    int turn;
}message_t;                         // Struct for making sending/receiving easy
message_t msg;
message_t analog; 
/**
 * Create the wheels 
 */
Servo lWheel, rWheel;

#define NOSPEED 90
#define DEFAULTSPEED 20
#define MAXSPEED 45
#define MAXTURN 20
#define MAX_TIMEOUT 500 
#define TURNSPEED 20

void writeToWheels(int throttle, int turn) {
  // 0 is max, 90 is still, 180 max reverse
  if(throttle < MAXSPEED)
    throttle = MAXSPEED; 
  else if (throttle > MAXSPEED+90)
    throttle = MAXSPEED+90; 
  
  // Check so the turn speed isn't to fast 
  if(turn < MAXTURN)
    turn = MAXTURN;
  else if (turn > MAXTURN+90)
    turn = MAXTURN + 90; 
    
  if((millis() - lasttime)< MAX_TIMEOUT) {
    lWheel.write(throttle+turn); 
    rWheel.write(throttle-turn);
    digitalWrite(LED_BUILTIN, HIGH);
  }
  else {
      lWheel.write(NOSPEED);
      rWheel.write(NOSPEED);
      digitalWrite(LED_BUILTIN, LOW);
  }
}
void writeToRadio() {
    // Convert to a servo signal (0 - 180 degrees) 90 is still, 0 max, 180 max
    msg.throttle = analog.throttle * 180.0 / 1024.0; 
    msg.turn = analog.turn * 180.0 / 1024.0; 
    radio.write(&msg,sizeof(msg));
}

void writeOutput() {
  #ifdef transmitter
    writeToRadio(); 
  #else 
      writeToWheels(msg.throttle, msg.turn); 
  #endif
}
void readInput() {
  #ifdef transmitter 
    // Read the analog input with a simple LP filter
    analog.throttle = (analog.throttle analogRead(throttlePin))/2;
    analog.turn = (analog.turn + analogRead(turnPin))/2;
  #else
    if(radio.available()) {
      radio.read(&msg, sizeof(msg)); 
      lasttime = millis(); 
    } 
  #endif
}

void setup() {
  #ifdef transmitter 
    pinMode(throttlePin, INPUT);
    pinMode(turnPin, INPUT);
    radio.begin();
    radio.openWritingPipe(address);
    radio.setPALevel(RF24_PA_MAX); 
    radio.setDataRate(RF24_2MBPS);
    radio.stopListening();
  #else 
    lWheel.attach(lWheelPin);
    rWheel.attach(rWheelPin);
    lWheel.write(NOSPEED);
    rWheel.write(NOSPEED);
    msg.throttle = NOSPEED;
    msg.turn = NOSPEED; 
    radio.begin();
    radio.openReadingPipe(0, address);
    radio.setPALevel(RF24_PA_MAX);
    radio.setDataRate(RF24_2MBPS);
    radio.startListening();
  #endif 
}

void loop() {
  readInput(); 
  writeOutput();
}