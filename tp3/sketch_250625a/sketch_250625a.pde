//https://www.youtube.com/watch?v=to_PoHeRSyY
//Jun cruz cocuzza alao 43798469

PImage refImg;
int tam = 50;
color valor= color(255);
boolean prendido = false;

void setup() {
  size(800, 400);
  refImg = loadImage("M_18.jpg");
}

void draw() {
  background(255);
  image(refImg, 0, 0, 400, 400);
  actualizarColor();
  RecrearImagen();
}
