//Particle[] p = new Particle[200];
ArrayList<Particle> particles = new ArrayList<Particle>();    //declare and initialize the ArrayList
//particles.add()   adds whatever is in parentheses to the ArrayList
//particles.remove()      remove the specified object from the ArrayList


void setup() {
  size(1200, 800);
  colorMode(HSB, 360, 100, 100, 100);
  particles.add(new Particle(mouseX, mouseY));
}

void draw() {
  println(particles.size());
  background(0, 0, 100);
  particles.add(new Particle(mouseX, mouseY));

  for (int i = 0; i < particles.size(); i++) {
    //particles.get(0)   will get the particle at index 0 from the ArrayList
    //to use this Particle, we have to store it in another Particle object
    Particle p = particles.get(i);
    p.display();
    p.fall();
    if (p.isDead()) {
      p.rebirth(mouseX, mouseY);
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