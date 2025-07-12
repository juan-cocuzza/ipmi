void DibujarCuadrado(int x, int y, int tam, color valor) {
  push();  
  if((y/tam)%2==0){
    if(esNworld(x,y,tam)){
      NyBGrande(x,y,tam,valor);
    } else {
      ByNHorizontal(x,y,tam,valor);
    }
  }else {
    if(esNworld(x,y,tam)){
      NyBChico(x,y,tam,valor);
    } else {
      ByNVertical(x,y,tam,valor);
    }
  }
  pop();
}

void RecrearImagen(){
  for (int y = 0; y < height; y += tam) {
    for (int x = 400; x < width; x += tam) {
      DibujarCuadrado(x, y, tam, valor);
    }
  }
}

boolean esNworld(int x,int y_ ,int tam_){
    return (x / tam_ + y_ / tam)%2==0;   
}

void NyBGrande(int x, int y, int tam, color valor){
      fill(0);
      noStroke();
      rect(x, y, tam, tam);
      fill(valor);
      rect(x+tam/2, y+tam/2, tam/2, tam/2);
}

void ByNHorizontal(int x, int y, int tam, color valor){
      fill(valor);
      noStroke();
      rect(x, y, tam, tam);
      fill(0);
      rect(x, y+tam/2, 5, tam/2);
}

void NyBChico(int x, int y, int tam, color valor){
        fill(0);
      noStroke();
      rect(x, y, tam, tam);
      fill(valor);
      rect(x, y, 5, 5);
}

void ByNVertical(int x, int y, int tam, color valor){
      fill(valor);
      noStroke();
      rect(x, y, tam, tam);
      fill(0);
      rect(x+tam/2, y, tam/2, 5);
}

void mousePressed() { 
    prendido = !prendido;    
  
     if(!prendido){
      valor = color(255);
    }
}

void actualizarColor(){
    if (prendido){
      valor = color (random(255),random(255),random(255));
    }
}
