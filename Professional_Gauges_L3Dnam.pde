/* *************  L3Dnam - may2015  ****************** 
This sketch demonstrate how to use PNG images from a gauge and an arrow, to make a fully functional
"real like" Gauge responding for the Mouse-X movement, showing angles for a Servo position (0º to 180º) 
for example!  Need 2 PNG images on Data subFolder inside the Sketch folder.
Marshall B&P gauge.png  and  marshall B&P ponteiro.png. -->  Both images must have no Background.
Create your own png images from real gauges or Other Objetcs and Enjoy.
*/

PImage mostrador, ponteiro; //both images on DATA subfolder
PFont fontA;
int Tx, Ty, P0, P180;       // Tx/Ty position text indicator  P0/P180 start & End point of Arrow
int Wsize1 = 300;   //Wsize1  &  Wsize2 = tamanho janela 
int Wsize2 = 300;
int Gauge;       // Gauge1 and Gauge2 are 2 example gauges,  choose one of them on line 20

void settings() {
  size (Wsize1,Wsize2,OPENGL);
}

void setup() {
/******************************************************************/  
 Gauge = 1;     // Gauge Type 1,  choose 2 for another Gauge
/******************************************************************/   
switch(Gauge) {
  case 1: 
      mostrador = loadImage("Gauge B&P Marshall 180.png");
      ponteiro = loadImage("marshall B&P ponteiro.png"); //loadImage("Ponteiro_Vermelho.png");
      Tx=-20 ;  Ty=58; P0=0  ;  P180=272 ;
    break;
  case 2: 
      mostrador = loadImage("gauge.png");
      ponteiro = loadImage("Ponteiro_Vermelho.png"); //loadImage("Ponteiro_Vermelho.png");
      Tx=-17 ;  Ty=74; P0=-226  ;  P180=46 ;
    break;
 }
 imageMode(CENTER);
 fontA = createFont("dutcheb.ttf", 20);; //numeric indication of the Angle
 textFont(fontA);
 
 // Uncomment the following two lines to see the available fonts 
 // String[] fontList = PFont.list();
 //  printArray(fontList);
}


void draw() {
  background(177);
  stroke(153);
  translate(Wsize1/2, Wsize2/2); // posiciona o mostrador no centro da tela
  image(mostrador, 0 , 0 , Wsize1*0.9 , Wsize2*0.9); // imagem, coluna, linha, Widt, Height
  float rodar = map(mouseX, 0,width,P0,P180); //mouseX movement 0 & 360 grauss for Arrow
  float angulo = map(mouseX, 0,width,0,181); //Numeric mouseX movement 0 & 360 grauss
     fill(255,255,255);                      // Text Color = Blank
     text(int(angulo), Tx,Ty);              // Position of Text with Numeric Angle
     rotate(radians(int(rodar)));            // Rotate the Arrow as "rodar" value
switch(Gauge) {
  case 1: 
      image(ponteiro, -22.9 , 23.1 , Wsize1*0.33 , Wsize2*0.33); // imagem, coluna, linha, Widt, Height
    break;
  case 2: 
      image(ponteiro, 21.5 , 0.2 , Wsize1*0.43 , Wsize2*0.06); // imagem, coluna, linha, Widt, Height
    break;     
  }
}