import processing.serial.*;

Serial port; // Puerto serial
ArrayList<TEXTBOX> textBoxes = new ArrayList<TEXTBOX>();
String message = ""; // Valor para enviar al cronómetro del micro
boolean send = false;
String cronoHigh = "00"; // valor alto del cronometro para recibir
String cronoLow = "00"; // valor bajo del cronómetro para recibir
String commStatus = "Not connected"; 
color redC,greenC,blueC,redHigh,greenHigh,blueHigh; //Colores de los botones RGB
boolean red,green,blue,comOP,comCLO = false;   //Booleanos para manejar cuando pasa el mouse por el botón
boolean redLED,greenLED,blueLED = false; // Booleanos para enviar por serial y encender cada color

void setup() {
  size(600, 338);
  
  /*Serial setup */
  println(Serial.list()); // Listar los COM-ports 
  //select first com-port from the list (change the number in the [] if your sketch fails to connect to the Arduino)
  /******************************************/
  
  
  /* Colores de los botones RGB*/
  redC = #D50000;
  greenC = #64DD17;
  blueC = #6200EE;
  redHigh = #FF1744;
  greenHigh = #76FF03;
  blueHigh = #7e3ff2;
  /*******************************/
  
  
  /* Inicialización de los cuadros de texto */
  TEXTBOX highTB = new TEXTBOX(width/3, 250, 60, 35);  
  TEXTBOX lowTB = new TEXTBOX(int(width-(width/2.3333)), 250, 60, 35);
  textBoxes.add(highTB);
  textBoxes.add(lowTB);
  /********************************/
  
}

void draw() {
  background(#FFFFFF);
  update(mouseX, mouseY);
 if(commStatus == "Connected"){
   if(port.available() > 0){
     println(port.read());
   }
   
 }
  
  /* Botones para e LED RGB */
  noStroke();
  if (red) {
    fill(redHigh);
  } else {
    fill(redC);
  }  
  circle(width/4, 140, 50);

  noStroke();
  if (green) {
    fill(greenHigh);
  } else {
    fill(greenC);
  }
  circle(width/2, 140, 50);

  noStroke();
  if (blue) {
    fill(blueHigh);
  } else {
    fill(blueC);
  }
  circle(int(width*0.75), 140, 50);
    /* Labels */
    fill(#000000);
    text("RED",(width/4) - textWidth("RED")/2, 190);
    text("GREEN",width/2 - textWidth("GREEN")/2, 190);
    text("BLUE",width*0.75 - textWidth("BLUE")/2, 190);
  /*****************************************************************/
  

  /* Rectángulos para iniciar y finalizar comunicación */
  noStroke();
  if (comOP) {
    fill(blueHigh);
  } else {
    fill(blueC);
  }
  rect(width-100, 25, 20,20);
  noStroke();
  if (comCLO) {
    fill(redHigh);
  } else {
    fill(redC);
  }
  rect(width-50, 25, 20,20);
    /* Labels */
    fill(#000000);
    text("RED",(width/4) - textWidth("RED")/2, 190);
    text("GREEN",width/2 - textWidth("GREEN")/2, 190);
    text("BLUE",width*0.75 - textWidth("BLUE")/2, 190);
    
  /************************************************************/


  /* Valor del cronómetro */
  fill(#000000);
  textSize(15);
  text("Tiempo recibido", 25, 25);
  textSize(30);
  text(cronoHigh + ":" + cronoLow, 25, 50);
  /******************************************************/


  /* Cuadros de texto para recibir datos */
  for (TEXTBOX t : textBoxes) {
    t.DRAW();
  }
  if (send) {
    fill(#3700B3);
    textSize(12);
    text("Se envió: "+message, (width - textWidth("Se envió = "+message))/2, 320);
  }
    /* lables */ 
    fill(#000000); 
    textSize(12);
    text("High", width/3 + 20, 300);
    text("Low", int(width-(width/2.3333))+20, 300);
  /*************************************************************/
  
  
  /* Marca de status de comunicación */
  fill(#3700B3);
  textSize(10);
  text(commStatus,width-textWidth(commStatus)-10, height - 10);
  /***************************************************************/
}

/*Para seleccionar los cuadros de texto  y encender el LED RGB*/
void mousePressed() {
  for (TEXTBOX t : textBoxes) {
    t.PRESSED(mouseX, mouseY);
  }
  if(red){
    redLED = !redLED;
    if(redLED){
      port.write(000);
    }else{
      port.write(001);
    }
  }else if(green){
    greenLED = !greenLED;
    if(greenLED){
      port.write(010);
    }else{
      port.write(011);
    }
  }else if(blue){
    blueLED = !blueLED;
    if(redLED){
      port.write(100);
    }else{
      port.write(101);
    }
  }else if(comOP){
    Iniciar();
  }else if(comCLO){
    Parar();
  }
}

/* Para guardar en message el input de ambos cuadros de texto (Se puede separar)*/
void keyPressed() {
  for (TEXTBOX t : textBoxes) {
    if (t.KEYPRESSED(key, (int)keyCode)) {
      send = true;
      message = textBoxes.get(0).Text +" "+textBoxes.get(1).Text; //Envía al string el contenido de ambos cuadros (Primero el de la derecha, espacio, izquierda.
    }
  }
}

/* Funciones de actualización para pasar por encima de los botones*/
 void update(int x, int y) {
  if ( overCircle(width/4, 140, 50) ) {
    red = true;
    blue = false;
    green = false;
  } else if ( overCircle(width/2, 140, 140) ) {
    blue = false;
    green = true;
    red = false;
  }else if(overCircle(int(width*0.75), 140, 50)){
    blue = true;
    green = false;
    red = false;
  }else if(overRect(width-100, 25, 20,20)){
    comOP = true;
    red = blue = green = comCLO= false;
  }else if(overRect(width-50, 25, 20,20)){
    comCLO = true;
    red = blue = green = comOP= false;
  }else{
    comOP = comCLO =red = blue = green = false;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

void Iniciar(){                              //handler del boton Iniciar
  println("Iniciar COM, en proceso");
  port = new Serial(this, "COM3", 9600);
  println("Iniciar COM, conectado");
  commStatus ="Connected";
}

void Parar(){                                //handler del boton Parar
  println("Parar COM");
  port.stop();
  commStatus ="Not connected";
}
