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
#define transmitter 
#define DEBUG

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
int throttleComp = 0; 
int turnComp = 0;
bool setupOk = false; 
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

#define NOSPEED 90            // In servo degree
#define DEFAULTSPEED 20       // In servo degree
#define MAXSPEED 45           // In servo degree
#define MAXTURN 20            // In servo degree 
#define MAX_TIMEOUT 500       // in ms


/**
 * @brief Reciever:   Write the throttle and turn to the 
 *                    left and right wheel. Also checks
 *                    if the input values are to high/low. 
 *                    A turn is simply throttle+-turn on
 *                    this two-wheeler. 
 * 
 * @param throttle  - The throttle 0 - 180 
 * @param turn      - The turn 0 - 180
 */
void writeToWheels(int throttle, int turn) {
  int lSpeed = NOSPEED; int rSpeed = NOSPEED; 
  // 0 is max, 90 is still, 180 max reverse
  if(throttle < MAXSPEED)
    throttle = MAXSPEED; 
  else if (throttle > (MAXSPEED+90))
    throttle = MAXSPEED+90; 
  
  // Check so the turn speed isn't to fast 
  if(turn < MAXTURN)
    turn = MAXTURN;
  else if (turn > MAXTURN+90)
    turn = MAXTURN + 90; 
    
  // To check if it wasn't to long ago the input was recieved 
  if((millis() - lasttime)< MAX_TIMEOUT) {
    lSpeed = throttle+turn/2; 
    rSpeed = throttle-turn/2; 
  }
  
  // Write to output
  lWheel.write(lSpeed);
  rWheel.write(rSpeed);
  
  #ifdef DEBUG
      Serial.print("Input throttle: "); Serial.print(throttle); Serial.print("\t input turn: "); Serial.println(turn);
      Serial.print("\t Left output: "); Serial.print(lSpeed); Serial.print("\t Right output: "); Serial.println(rSpeed);
  #endif 
}

/**
 * @brief Transmitter:  Convert analog in signal to a throttle
 *                      level and write to nRF. 
 * 
 * @return true   - If successful transmitt
 * @return false  - If fail in writing to nRF
 */
bool writeToRadio() {
    // Convert to a servo signal (0 - 180 degrees) 90 is still, 0 max, 180 max
    msg.throttle = analog.throttle * 180.0 / 1024.0; 
    msg.turn = analog.turn * 180.0 / 1024.0; 
    bool succ = radio.write(&msg,sizeof(msg));
    #ifdef DEBUG
      Serial.print("Sent throttle: "); Serial.print(msg.throttle); Serial.print("\t sent turn: "); Serial.print(msg.turn); Serial.print(" successful transmitt: "); Serial.println(succ);
    #endif 
    return succ; 
}

/**
 * @brief Transmitter:  Write to nRF the throttle and turn. 
 *        Reciever:     Write the input from nRF to servo.  
 */
void writeOutput() {
  #ifdef transmitter
    writeToRadio(); 
  #else 
      writeToWheels(msg.throttle, msg.turn); 
  #endif
}


/**
 * @brief Transmitter:  Reads the analog value from joystick.
 *        Reciever:     See if new data available on nRF and 
 *                      save it to msg.  
 */
void readInput() {
  #ifdef transmitter 
    // Read the analog input with a simple LP filter
    analog.throttle = (analog.throttle + (analogRead(throttlePin)+throttleComp))/2;
    analog.turn = (analog.turn + (analogRead(turnPin)+turnComp))/2;
    #ifdef DEBUG
      Serial.print("Read throttle: "); Serial.print(analog.throttle); Serial.print("\t read turn: "); Serial.println(analog.turn);
    #endif 
  #else
    #ifdef DEBUG
      Serial.print("Radio available: "); Serial.println(radio.available());
    #endif 
    if(radio.available()) {
      radio.read(&msg, sizeof(msg)); 
      lasttime = millis(); 
      #ifdef DEBUG
        Serial.println("Recieved new input!");
      #endif
    } 
  #endif
}


/**
 * @brief Setup module as transmitter and sets analog input from joystick. 
 *        Also compensate for joystick value. Sets current value as new 0. 
 * 
 * @return true  - If able to connect setup nRF module
 * @return false - If unable to connect and setup nRf module
 */
bool setupTransmitter() {
  // Analog read for throttle and turn value
  pinMode(throttlePin, INPUT);
  pinMode(turnPin, INPUT);
  
  // To compensate for bad joystick
  // sets the current value as "middle" value. 
  throttleComp = 512 - analogRead(throttlePin);
  turnComp = 512 - analogRead(turnPin);
  
  // Start the nRF 
  radio.begin(); 
  radio.openWritingPipe(address);
  //radio.setPALevel(RF24_PA_MAX); 
  radio.setRetries(3,5); // delay, count
  radio.setDataRate(RF24_250KBPS);
  //radio.stopListening();
  
  // Return 1 if found nRf connected, 0 else
  return radio.isChipConnected();
}

/**
 * @brief Setup nRF module and the servo pins. 
 * 
 * @return true  - If able to connect setup nRF module
 * @return false - If unable to connect and setup nRf module
 */
bool setupReciever() {
    // Attach PWM pins for wheel signal
    lWheel.attach(lWheelPin);
    rWheel.attach(rWheelPin);
    // Write 90 deg (zero in speed)
    lWheel.write(NOSPEED);
    rWheel.write(NOSPEED);
    msg.throttle = NOSPEED;
    msg.turn = NOSPEED; 

    // Start the nRf 
    radio.begin();
    radio.openReadingPipe(1, address);
    //radio.setPALevel(RF24_PA_MAX);
    radio.setDataRate(RF24_250KBPS);
    radio.startListening();

    // Return 1 if found nRf connected, 0 else
    return radio.isChipConnected();
}


void setup() {
  #ifdef DEBUG
  Serial.begin(9600);
  #endif 


  #ifdef transmitter 
    setupOk = setupTransmitter(); 
  #else 
    setupOk = setupReciever();
  #endif 
}

void loop() {
  readInput(); 
  writeOutput();
}

