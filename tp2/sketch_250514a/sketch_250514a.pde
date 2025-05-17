PImage[] obras = new PImage[3];
String[] textos = new String[3];
int pantalla = 0;
int tiempoCambio = 5000; 
int tiempoInicio;
int estado = 0;
PFont fuente;

void setup() {
  size(640, 480);
  frameRate(60);

  obras[0] = loadImage("obra1.jpg");
  obras[1] = loadImage("obra.png");
  obras[2] = loadImage("obra3.jpg");

  textos[0] = "Telegarden es una instalación interactiva pionera \nque combina robótica, internet y participación del público";
  textos[1] = "Creada por los artistas Ken Goldberg y Joseph Santarromana.\nPermitió a usuarios interactuar con un jardín real mediante internet.";
  textos[2] = "Los participantes podían plantar semillas, \nregar y observar su crecimiento\nusando una cámara web y un brazo robótico.";


  fuente = createFont("Arial", 32);
  textFont(fuente);

  tiempoInicio = millis();
}

void draw() {
  background(0);

  if (estado == 0) {
    pantallaInicio();
  } else if (estado == 1) {
    mostrarPresentacion();
  } else if (estado == 2) {
    pantallaFinal();
  }
}

void pantallaInicio() {
  fill(255);
  textSize(32);
  textAlign(CENTER, CENTER);
  float y = 200 + sin(frameCount * 0.05) * 10;
  text("Hacé clic para comenzar", width / 2, y);
}

void mostrarPresentacion() {
  image(obras[pantalla], 0, 0, width, height);
  
  textAlign(CENTER, CENTER);
  textLeading(26);

  if (pantalla == 0) {
    float xTexto = width - (millis() - tiempoInicio) * 0.2;
    fill(255);
    textSize(22);
    textAlign(LEFT, CENTER);
    text(textos[0], xTexto, height * 0.25);

  } else if (pantalla == 1) {
    float tiempo = millis() - tiempoInicio;
    float tamaño = map(tiempo, 0, tiempoCambio, 10, 40);
    fill(255);
    textSize(tamaño);
    textAlign (CENTER, CENTER);
    text(textos[1], width / 2, height * 0.6);

  } else if (pantalla == 2) {
    float tiempo = millis() - tiempoInicio;
    float alpha = map(tiempo, 0, tiempoCambio, 0, 255);
    fill(255, constrain(alpha, 0, 255));
    textSize(24);
    textAlign(CENTER,CENTER);
    text(textos[2], width / 2, height / 2);
  }

  if (millis() - tiempoInicio > tiempoCambio) {
    pantalla++;
    tiempoInicio = millis();

    if (pantalla >= 3) {
      estado = 2;
    }
  }
}

void pantallaFinal() {
  fill(255);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Fin de la presentación", width / 2, height / 2 - 20);
  textSize(20);
  text("Hacé clic para reiniciar", width / 2, height / 2 + 30);
}

void mousePressed() {
  if (estado == 0) {
    estado = 1;
    pantalla = 0;
    tiempoInicio = millis();
  } else if (estado == 2) {
    estado = 0; // reinicia
  }
}
