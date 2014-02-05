// Venation and Growth sketch
// Felix and Vince 2014
// based off the paper by runions et al.
// http://algorithmicbotany.org/papers/venation.sig2005.pdf

import java.util.Iterator;

int auxinCount = 500;

Venatation v;

void setup() {
  size(1200,800);
  background(30);
  v = new Venatation();
}

void draw() {
  background(30);
  v.runVenatation();
}

