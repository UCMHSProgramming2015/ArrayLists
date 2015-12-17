Particle[] p = new Particle[200];

void setup() {
  size(1200, 800);
  colorMode(HSB, 360, 100, 100, 100);
  for (int i = 0; i < p.length; i++) {
    p[i] = new Particle(width/2, height*.2);
  }
}

void draw() {
  background(0, 0, 100);
  for (int i = 0; i < p.length; i++)
  {
    p[i].display();
    p[i].fall();
    if (p[i].isDead()) {
      p[i].rebirth(mouseX, mouseY);
    }
  }
}

class Particle {
  PVector loc, vel, acc;
  float hue, sat, bright, alpha;
  float diam;


  Particle(float x, float y) {
    loc = new PVector(x, y);
    vel = PVector.random2D();
    acc = new PVector(0, .1);
    hue = random(360);
    sat = random(70, 90);
    bright = random(80, 100);
    alpha = 80;
    diam = 50;
  }

  void display() {
    fill(hue, sat, bright, alpha);
    ellipse(loc.x, loc.y, diam, diam);
  }

  void fall() {
    vel.add(acc);
    loc.add(vel);
  }

  boolean isDead() {
    if (loc.y > height + diam/2) {
      return true;
    } else {
      return false;
    }
  }

  void rebirth(float x, float y) {
    loc.set(x, y);
    vel = PVector.random2D();
  }
}