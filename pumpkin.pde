boolean DEBUG = false;

// LEDs are connected pins 9-11
int redPin = 9;
int greenPin = 10;
int bluePin = 11;

// current colour, and destination colour for fading
int colour[3];
int destColour[3];

int currColour;

void setup() {
  currColour = 0;
  setColor(colour, 255, 0, 0);
  setColor(destColour, 255, 0, 0);
  
  if (DEBUG) {
    Serial.begin(9600);
  }
}
 
void loop() {
  boolean dirty = false;

  // fade colour closer to target
  for (int i=0; i<3; i++) {
    int diff = destColour[i] - colour[i];
    if (diff != 0) {
      colour[i] += constrain(diff, -5, 5);
      dirty = true;
    }
  }
  draw(colour);

  // colour matches target, move onto next target  
  if (!dirty) {
    currColour++;
    switch(currColour) {
      case 0: // red
        setColor(destColour, 255, 0, 0);
        break;
      case 1: // yellow
        setColor(destColour, 255, 255, 0);
        break;
      case 2: // green
        setColor(destColour, 0, 255, 0);
        break;
      case 3: // blue-green
        setColor(destColour, 0, 255, 255);
        break;
      case 4: // blue
        setColor(destColour, 0, 0, 255);
        break;
      case 5: // purple
        setColor(destColour, 255, 0, 255);
        break;
      default: // out of bounds, set to red
        currColour = 0;
        setColor(destColour, 255, 0, 0);
    }
  }
  
  delay(30);
}

void setColor(int * c, int r, int g, int b) {
  c[0] = r;
  c[1] = g;
  c[2] = b;
}

void draw(int *colour) {
  if (DEBUG) {
    Serial.print("RGB: ");
    Serial.print(colour[0]);
    Serial.print(",");
    Serial.print(colour[1]);
    Serial.print(",");
    Serial.println(colour[2]);
  }
  analogWrite(redPin, constrain(colour[0], 0, 255));
  analogWrite(greenPin, constrain((int) (0.5 * colour[1]), 0, 255));
  analogWrite(bluePin, constrain((int) (0.75 * colour[2]), 0, 255));
}
