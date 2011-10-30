boolean DEBUG = true;

// LEDs are connected pins 9-11
int redPin = 11;
int greenPin = 9;
int bluePin = 10;

// current color, and destination color for fading
int color[3];
int destcolor[3];

int currcolor;

void setup() {
  currcolor = 0;
  setColor(color, 255, 0, 0);
  setColor(destcolor, 255, 0, 0);
  
  if (DEBUG) {
    Serial.begin(9600);
  }
}

boolean sameColor(int *c1, int *c2) {
  return c1[0] == c2[0] && c1[1] == c2[1] && c1[2] == c2[2];
}

void fadeTo(int *target, int maxDiffPerStep, int t) {
  int diffR = abs(target[0] - color[0]);
  int diffG = abs(target[1] - color[1]);
  int diffB = abs(target[2] - color[2]);
  float diffMax = (float) max(max(diffR, diffG), diffB);

  float diffPerStep[3];
  diffPerStep[0] = maxDiffPerStep * diffR / diffMax;
  diffPerStep[1] = maxDiffPerStep * diffG / diffMax;
  diffPerStep[2] = maxDiffPerStep * diffB / diffMax;
  
  Serial.println("diffPerStep");
  Serial.println(diffPerStep[0]);
  Serial.println(diffPerStep[1]);
  Serial.println(diffPerStep[2]);
  Serial.println();
  
  while(!sameColor(target, color)) {
    for (int i=0; i<3; i++) {
      int diff = target[i] - color[i];
      if (diff != 0) {
        color[i] = round(color[i] + constrain(diff, -diffPerStep[i], diffPerStep[i]));
        constrain(color[i], 0, 255);
      }
    }
    draw(color);
    delay(t);
  } 
}

void loop() {
  currcolor++;

  switch(currcolor) {
    case 0: // red
      setColor(destcolor, 255, 0, 0);
      break;
    case 1: // yellow
      setColor(destcolor, 255, 255, 0);
      break;
    case 2: // green
      setColor(destcolor, 0, 255, 0);
      break;
    case 3: // blue-green
      setColor(destcolor, 0, 255, 255);
      break;
    case 4: // blue
      setColor(destcolor, 0, 0, 255);
      break;
    case 5: // purple
      setColor(destcolor, 255, 0, 255);
      break;
    default: // out of bounds, set to red
      currcolor = 0;
      setColor(destcolor, 255, 0, 0);
  }

  fadeTo(destcolor, 5, 5);
}

void setColor(int * c, int r, int g, int b) {
  c[0] = r;
  c[1] = g;
  c[2] = b;
}

void draw(int *color) {
  if (DEBUG) {
    Serial.print("RGB: ");
    Serial.print(color[0]);
    Serial.print(",");
    Serial.print(color[1]);
    Serial.print(",");
    Serial.println(color[2]);
  }
  analogWrite(redPin, constrain(color[0], 0, 255));
  analogWrite(greenPin, constrain(color[1], 0, 255));
  analogWrite(bluePin, constrain(color[2], 0, 255));
}

