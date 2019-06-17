import processing.serial.*;

import org.gicentre.utils.stat.*;    // For chart classes.
 
Serial port; // Puerto serial
String commStatus = "Not connected";  
BarChart barrasDatos;
volatile int S1 = 1024;
volatile int S2 = 1024;
volatile int S3 = 1024;
volatile int S4 = 1024;
volatile int S5 = 1024;
volatile int S6 = 1024;
volatile int S7 = 1024;
volatile int S8 = 1024;
boolean comOP, comCLO = false;   //Booleanos para manejar cuando pasa el mouse por el botón
color redOFF= color(250, 100, 100), blueOFF= color(100, 100, 250), redON = color(255, 0, 0), blueON= color(0, 0, 255); //Colores de los botones RGB
color redC,greenC,blueC,redHigh,greenHigh,blueHigh; //Colores de los botones RGB
int channel = 0;
char c1, c2, c3, c4,c ; 
int lecturaByte = 0;

 
// Initialises the sketch and loads data into the chart.
void setup()
{
  
  size(500,350);
   /*Serial setup */
 println(Serial.list()); // Listar los COM-ports 
 
 
   redC = #D50000;
  greenC = #64DD17;
  blueC = #6200EE;
  redHigh = #FF1744;
  greenHigh = #76FF03;
  blueHigh = #7e3ff2;
  /*******************************/
 
  
  barrasDatos = new BarChart(this);
  //Valores de 10 bits (1024) que llegan al micro
  barrasDatos.setData(new float[] {S1, S2, S3, S4, S5, S6, S7, S8});
     
  // Axis scaling
  barrasDatos.setMinValue(0);
  barrasDatos.setMaxValue(1024);
  // Axis appearance
  textFont(createFont("Serif",10),10); 
  barrasDatos.showValueAxis(true);
  barrasDatos.setBarLabels(new String[] {"S1","S2","S3","S4","S5","S6","S7","S8"});
  barrasDatos.showCategoryAxis(true);
  // Bar colours and appearance
  barrasDatos.setBarColour(greenHigh);
  barrasDatos.setBarGap(2);
   
  
}
 
// Draws the chart in the sketch
void draw()
{
  
    //////////Lectura de datos
  barrasDatos.setData(new float[] {S1, S2, S3, S4, S5, S6, S7, S8});
 
 /**********************************************************/
  background(255);
  update(mouseX, mouseY);
  if (commStatus == "Connected") {
    if (port.available() > 0) {
      lecturaByte = port.read();
    }
    if(lecturaByte == 49){  ////////////////////////////////S1
      println(port.read()); //para leer el dos puntos
      lecturaByte = port.read(); //leer primer dígito
      int temp = lecturaByte;
      temp = temp-48;
      S1 = temp;
      lecturaByte = port.read(); //leer segundo dígito
      temp = lecturaByte;
      temp = temp-48;
      S1 = S1*10 + temp;
      lecturaByte = port.read(); //leer tercero dígito
      temp = lecturaByte;
      temp = temp-48;
      S1 = S1*10 + temp;
      lecturaByte = port.read(); //leer cuarto dígito
      temp = lecturaByte;
      temp = temp-48;
      S1 = S1*10 + temp;
    } else if(lecturaByte == 50){ ////////////////////////////////S2
      println(port.read()); //para leer el dos puntos
      lecturaByte = port.read(); //leer primer dígito
      int temp = lecturaByte;
      temp = temp-48;
      S2 = temp;
      lecturaByte = port.read(); //leer segundo dígito
      temp = lecturaByte;
      temp = temp-48;
      S2 = S2*10 + temp;
      lecturaByte = port.read(); //leer tercero dígito
      temp = lecturaByte;
      temp = temp-48;
      S2 = S2*10 + temp;
      lecturaByte = port.read(); //leer cuarto dígito
      temp = lecturaByte;
      temp = temp-48;
      S2 = S2*10 + temp;
    } else if(lecturaByte == 51){ ////////////////////////////////S3
      println(port.read()); //para leer el dos puntos
      lecturaByte = port.read(); //leer primer dígito
      int temp = lecturaByte;
      temp = temp-48;
      S3 = temp;
      lecturaByte = port.read(); //leer segundo dígito
      temp = lecturaByte;
      temp = temp-48;
      S3 = S3*10 + temp;
      lecturaByte = port.read(); //leer tercero dígito
      temp = lecturaByte;
      temp = temp-48;
      S3 =S3*10 + temp;
      lecturaByte = port.read(); //leer cuarto dígito
      temp = lecturaByte;
      temp = temp-48;
      S3 = S3*10 + temp;
    } else if(lecturaByte == 51){ ////////////////////////////////S4
      println(port.read()); //para leer el dos puntos
      lecturaByte = port.read(); //leer primer dígito
      int temp = lecturaByte;
      temp = temp-48;
      S4 = temp;
      lecturaByte = port.read(); //leer segundo dígito
      temp = lecturaByte;
      temp = temp-48;
      S4 = S4*10 + temp;
      lecturaByte = port.read(); //leer tercero dígito
      temp = lecturaByte;
      temp = temp-48;
      S4 = S4*10 + temp;
      lecturaByte = port.read(); //leer cuarto dígito
      temp = lecturaByte;
      temp = temp-48;
      S4 = S4*10 + temp;
    } else if(lecturaByte == 51){ ////////////////////////////////S5
      println(port.read()); //para leer el dos puntos
      lecturaByte = port.read(); //leer primer dígito
      int temp = lecturaByte;
      temp = temp-48;
      S5 = temp;
      lecturaByte = port.read(); //leer segundo dígito
      temp = lecturaByte;
      temp = temp-48;
      S5 = S5*10 + temp;
      lecturaByte = port.read(); //leer tercero dígito
      temp = lecturaByte;
      temp = temp-48;
      S5 = S5*10 + temp;
      lecturaByte = port.read(); //leer cuarto dígito
      temp = lecturaByte;
      temp = temp-48;
      S5 = S5*10 + temp;
    } else if(lecturaByte == 51){ ////////////////////////////////S6
      println(port.read()); //para leer el dos puntos
      lecturaByte = port.read(); //leer primer dígito
      int temp = lecturaByte;
      temp = temp-48;
      S6 = temp;
      lecturaByte = port.read(); //leer segundo dígito
      temp = lecturaByte;
      temp = temp-48;
      S6 = S6*10 + temp;
      lecturaByte = port.read(); //leer tercero dígito
      temp = lecturaByte;
      temp = temp-48;
      S6 = S6*10 + temp;
      lecturaByte = port.read(); //leer cuarto dígito
      temp = lecturaByte;
      temp = temp-48;
      S6 = S6*10 + temp;
    } else if(lecturaByte == 51){ ////////////////////////////////S7
      println(port.read()); //para leer el dos puntos
      lecturaByte = port.read(); //leer primer dígito
      int temp = lecturaByte;
      temp = temp-48;
      S7 = temp;
      lecturaByte = port.read(); //leer segundo dígito
      temp = lecturaByte;
      temp = temp-48;
      S7 = S7*10 + temp;
      lecturaByte = port.read(); //leer tercero dígito
      temp = lecturaByte;
      temp = temp-48;
      S7 = S7*10 + temp;
      lecturaByte = port.read(); //leer cuarto dígito
      temp = lecturaByte;
      temp = temp-48;
      S7 = S7*10 + temp;
    } else if(lecturaByte == 51){ ////////////////////////////////S8
      println(port.read()); //para leer el dos puntos
      lecturaByte = port.read(); //leer primer dígito
      int temp = lecturaByte;
      temp = temp-48;
      S8 = temp;
      lecturaByte = port.read(); //leer segundo dígito
      temp = lecturaByte;
      temp = temp-48;
      S8 = S8*10 + temp;
      lecturaByte = port.read(); //leer tercero dígito
      temp = lecturaByte;
      temp = temp-48;
      S1 = S1*10 + temp;
      lecturaByte = port.read(); //leer cuarto dígito
      temp = lecturaByte;
      temp = temp-48;
      S8 = S8*10 + temp;
    }
  }
  
  barrasDatos.draw(15,40,width-30,height-45); 

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
 
}


void mousePressed() {
  if(comOP){
    Iniciar();
  }else if(comCLO){
    Parar();
  }
}

/* Funciones de actualización para pasar por encima de los botones*/
void update(int x, int y) {
  if (overRect(width-100, 25, 20,20)) {    

    comOP = true;
    comCLO= false;
  } else if (overRect(width-50, 25, 20,20)) {
    comCLO = true;
    comOP= false;
  } else {
    comOP = comCLO  = false;
  }
}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void Iniciar() { //handler del boton Iniciar
  fill(255);
  println("Start COM, processing");
  port = new Serial(this, "COM8", 9600);
  println("Start COM, connected");
  commStatus ="Connected";
}

void Parar() {                                //handler del boton Parar
  fill(255);
  println("Stop COM");
  port.stop();
  commStatus ="Not connected";
}
