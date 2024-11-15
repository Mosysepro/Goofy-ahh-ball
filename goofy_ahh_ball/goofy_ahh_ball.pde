int cooldown = 0;
int points;

PGraphics shop;

void setup() {
  fullScreen();
  frameRate(60);
  shop = createGraphics(300, 300);
}



void draw() {

  if (keyPressed) {
    in_menu = false;
  } else if (in_menu) {
    menu_principal();
  } else if (!in_menu) {

    background(0); //Resetear pantalla.
    fill(255);

    //Comprobar si se usan habilidades
    if (mousePressed && cooldown >= 300 && mouseButton == LEFT) {
      dash();
    } else if (mouseButton == RIGHT && cooldown >= 300) {
      masacre();
    }

    //Si el enemigo está activo
    if (enemyActive) {
      dibujarenemigo();
    } else if (enemyActive == false && cooldown == 50) { //Activar enemigo si está desactivado
      enemyActive = true;
    }

    dibujarellipse(mouseX, mouseY, ellipse_easing); //Movimiento del ellipse

    text(cooldown, 10, 10);

    //Score max. 300
    if (cooldown < 300) {
      cooldown += 1;
    }
  }
}

void dash() {
  hitbox = 0;
  background(60);
  cooldown = 0;
  delay(1000);
  line(ellipse_x, mouseX, ellipse_y, mouseY);
  delay(1000);
  ellipse_x = mouseX;
  ellipse_y = mouseY;
  hitbox = ellipse_size;
}

void masacre() {
  cooldown = 0;
  if (dist(ellipse_x, ellipse_y, enemyX + enemySize / 2, enemyY + enemySize / 2) < (300 + enemySize) / 2) {
    enemyActive = false;
  }
}
