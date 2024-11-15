float ellipse_x;
float ellipse_y;
float ellipse_easing = 0.2;
int ellipse_size = 20;
int hitbox = ellipse_size;

void dibujarellipse(float targetX, float targetY, float easing) {
  fill(255);
  stroke(cooldown/2.5);
  strokeWeight(cooldown);

  float dx = targetX - ellipse_x;
  ellipse_x += dx * easing;

  float dy = targetY - ellipse_y;
  ellipse_y += dy * easing;

  ellipse(ellipse_x, ellipse_y, abs(dx)/2.5  + ellipse_size, abs(dy)/2.5 + ellipse_size);
}


float enemyX;
float enemyY;
float enemySpeedX;
float enemySpeedY;
int enemySize = 50;
boolean enemyActive = true;
PImage enemyskin;

void dibujarenemigo() {
  fill(255, 0, 0);
  noStroke();
  fill(255, 0, 0);
  enemyskin = loadImage("baixa.jpeg");
  image(enemyskin, enemyX, enemyY);

  // Mover los enemigos hacia la esfera con dificultad ajustada
  enemyX += (ellipse_x - enemyX) * 0.01;
  enemyY += (ellipse_y - enemyY) * 0.01;


  // Comprobar colisión
  if (dist(ellipse_x, ellipse_y, enemyX + enemySize / 2, enemyY + enemySize / 2) < (hitbox + enemySize) / 2) {
    exit();
  }
}
