ArrayList<Particle> particles = new ArrayList<Particle>();
PVector[]pv = new PVector[5];


void setup() {
  size(1000, 600);
  background(50);
  for (int i = 0; i<pv.length ; i++){
    pv[i] = new PVector(random(0, 1000), random(0,600));
  }
}

void draw() {
  background(80);
  
  particles.add(new Particle(width/2, height/2));
  
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.addAttract(mouseX, mouseY, 10);
    for (int j = 0; j<pv.length ; j++){
        p.addRepel(pv[j].x, pv[j].y, 1);
        fill(255,0,0);
        ellipse(pv[j].x, pv[j].y, 12, 12);
    }
    p.update();
    p.display();
    
    if (p.life < 0) {
      particles.remove(i);
    }
  }
}