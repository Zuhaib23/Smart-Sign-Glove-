// Arduino Gesture Recognition Based on Sensor Data
#include <math.h>

// Gesture data
const char* gestureNames[] = {
    "Cool", "Food", "Leave", "Help", "How", "Nice", "Hello (Default Gesture)"
};

const float meanVals[][5] = {
    {103.74, 103.74, 103.92, 95.154, 94.156}, // Cool
    {107.93, 107.8, 107.97, 135.31, 127.1},  // Food
    {70.824, 70.807, 71.055, 176.58, 89.71}, // Leave
    {122.33, 122.32, 122.29, 115.2, 106.74}, // Help
    {81.43, 81.376, 81.581, 106.06, 90.071}, // How
    {105.92, 105.86, 105.86, 95.04, 157.01}  // Nice
};

const float dynamicThreshold[][5] = {
    {3.3782, 3.295, 3.3491, 17.999, 11.401},
    {6.3609, 6.3732, 6.2853, 11.894, 7.1208},
    {4.7239, 4.7469, 4.752, 24.473, 19.264},
    {12.334, 12.314, 12.41, 15.986, 15.906},
    {5.8153, 5.9079, 6.0028, 13.539, 13.007},
    {6.9979, 6.9503, 6.9486, 25.558, 10.607}
};

const int numGestures = 6; // Number of gestures

// Sensor pin definitions
const int thumbPin = A0;
const int indexPin = A1;
const int middlePin = A2;
const int ringPin = A3;
const int littlePin = A4;

void setup() {
    Serial.begin(9600);
    pinMode(thumbPin, INPUT);
    pinMode(indexPin, INPUT);
    pinMode(middlePin, INPUT);
    pinMode(ringPin, INPUT);
    pinMode(littlePin, INPUT);
}

void loop() {
    // Read sensor values
    float sensorVals[5];
    sensorVals[0] = analogRead(thumbPin);
    sensorVals[1] = analogRead(indexPin);
    sensorVals[2] = analogRead(middlePin);
    sensorVals[3] = analogRead(ringPin);
    sensorVals[4] = analogRead(littlePin);

    Serial.print("Thumb: ");
    Serial.print(sensorVals[0]);
    Serial.print("\tIndex: ");
    Serial.print(sensorVals[1]);
    Serial.print("\tMiddle: ");
    Serial.print(sensorVals[2]);
    Serial.print("\tRing: ");
    Serial.print(sensorVals[3]);
    Serial.print("\tLittle: ");
    Serial.println(sensorVals[4]);
    
    // Determine the matching gesture
    int matchedGesture = -1;
    for (int g = 0; g < numGestures; g++) {
        bool match = true;
        for (int s = 0; s < 5; s++) {
            if (abs(sensorVals[s] - meanVals[g][s]) > dynamicThreshold[g][s]) {
                match = false;
                break;
            }
        }
        if (match) {
            matchedGesture = g;
            break;
        }
    }

    // Print the gesture name
    if (matchedGesture != -1) {
        Serial.print("Gesture Detected: ");
        Serial.println(gestureNames[matchedGesture]);
    } else {
        Serial.println("Hello (Default Gesture)");
    }

    delay(1000); // Wait for stability
}
