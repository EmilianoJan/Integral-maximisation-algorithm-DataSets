%El siguiente código genera la funcion parametrica que permite obtener el
%tamaño del haz sobre la muestra
%FUNCIÓN COPIADA DE LA CARPETA 2018-11-02.

%2019-04-30 Modifico la función para tener la información de la posición en
%la cual se encuentran los haces sobre la superficie del material.

close all;
clear all;

syms f v1 v2 v2prima v1prima no d rc q qprima zcero x y a1x b1x a2x b2x x xo k alphax alphay integer;
syms w1 w2 k r2 lambda A B C D beta x tilt1PX tilt2PX trackin1PX trackin2PX LLente tiltMP tiltMPX integer ;
syms tilt1PY tilt2PY trackin1PY trackin2PY a1y b1y a2y b2y tiltMPY v2 v1 integer;

%tiltMP = angulo de la muestra con respecto al eje optico

%matrices definidas de izq a derecha imaginando el sistema de lentes en
%donde el aire es el primer elemento entre la fibra y la lente (y no el
%espejo)




%--------------------------------------------------
%Variables (Comentar las queserán parte del grafico

%v1prima = 0;  %Corrimiento del foco en z
%v2prima = 0;

%tilt1PX = 0; %Tilt lente 1 en eje X
%tilt2PX = 0;

%tilt1PY = 0; %Tilt lente 1 en eje y
%tilt2PY = 0;

%tiltMPX = 0; %Tilt muestra 1 en eje X
%tiltMPY = 0.18;

%trackin1PX = 0; %Tracking lente 1 en eje X
%trackin2PX = 0;

%trackin1PY = 0; %Tracking lente 1 en eje Y
%trackin2PY = 0;

%Nombre de ejes

Eje1 = 'tilt2PY';
Eje2 = 'trackin2PY';

Descripcion = 'tiltMPY = 0.18 v1prima = 1';

RangoEje1 = 1e-3;
RangoEje2 = 20;

%------------------------------------------------------

disp('inicio calculo de las matrices')

NcalculoFoco = 1.5115919;

d = 28.6e-3; %distancia entre lentes
f = 3.32e-3; %Distancia focal de las lentes
lambda = 795e-9; %Longitud de onda del haz
k =2*pi/lambda; 
w1 = 2e-6; %Tamaño inicial del haz
LLente = 4e-3; %Es la profundidad de la lente (distancia entre caras)
zcero = (k*(w1^2))/2; %Distancia confocal 
no = 1;
n1 = 1;
n2 = NcalculoFoco;


v2 = v2prima*zcero; %Normalizo con la distancia de Rayleigh
v1 = v1prima*zcero;

tilt1X = tilt1PX;
tilt2X = tilt2PX;

tilt1Y = tilt1PY;
tilt2Y = tilt2PY;


trackin1X = trackin1PX*zcero;
trackin2X = trackin2PX*zcero;

trackin1Y = trackin1PY*zcero;
trackin2Y = trackin2PY*zcero;

tiltMX = tiltMPX;
tiltMY = tiltMPY;

%mi sistema de lentes

%modelo sin desalineaciones
% aire1 = [1 (f+v1)/no; 0 1];
% lente1 = [1 0; -1/f 1];
% aire2 = [1 (d+v1-v2)/no; 0 1];
% lente2 = lente1;
% aire3 = [1 (f+v2)/no; 0 1];
% espejo = [ 1 0; -2/rc 1];


%modelo con desalineaciones

aire1 = [1 (f+v1)/no 0; 0 1 0 ; 0 0 1];

%separo en partes la lente

L1EX = (LLente)*tilt1X;
L1FX = 1/f*trackin1X + (n2-n1*1)*tilt1X;

L1EY = (LLente)*tilt1Y;
L1FY = 1/f*trackin1Y + (n2-n1*1)*tilt1Y;

L2EX = (LLente)*tilt2X;
L2FX = 1/f*trackin2X + (n2-n1*1)*tilt2X;

L2EY = (LLente)*tilt2Y;
L2FY = 1/f*trackin2Y + (n2-n1*1)*tilt2Y;

lente1X = [1 0 L1EX; -1/f 1 L1FX; 0 0 1];
lente1Y = [1 0 L1EY; -1/f 1 L1FY; 0 0 1];
aire2 = [1 (d-v1+v2)/no 0; 0 1 0; 0 0 1];
lente2X = [1 0 L2EX; -1/f 1 L2FX; 0 0 1];
lente2Y = [1 0 L2EY; -1/f 1 L2FY; 0 0 1];

aire3 = [1 (f-v2)/no 0; 0 1 0; 0 0 1];


%espejo = [ 1 0 0; -2/rc 1 0; 0 0 1];

espejoX = [ 1 0 0; 0 1 tiltMX; 0 0 1];
espejoY = [ 1 0 0; 0 1 tiltMY; 0 0 1];





%r1 = (NcalculoFoco -1)*f;%(1.786156 -1)*f;%-1.8e-3;
r1 = f*(NcalculoFoco-1)/NcalculoFoco;
r2X = 0.1;

t = 1.8e-3; %tamaño de la lente

%LenteCompleja1 = [1 0; 0 n2/n1 ] * [1 t; 0 1]*[1 0; (n1-n2)/(r1*n2) n1/n2];
%LenteCompleja2 = [1 0; (n1-n2)/(r1*n2) n2/n1 ] * [1 t; 0 1]*[1 0; 0 n1/n2];

LenteCompleja1 = [1 0; ((n2-n1)/(r2X*n1)) n2/n1]* [1 t; 0 1]* [1 0; ((n1-n2)/(r1*n2)) n1/n2];
LenteCompleja2 = [1 0; ((n2-n1)/(r1*n1)) n2/n1]* [1 t; 0 1]* [1 0; ((n1-n2)/(r2X*n2)) n1/n2];


%lente2 = LenteCompleja2;
%lente1 = LenteCompleja1;

%Modelo de reinyeccion
%Mx = aire1*lente1X*aire2*lente2X*aire3*espejoX*aire3*lente2X*aire2*lente1X*aire1; %%Con las lentes simples
%My = aire1*lente1Y*aire2*lente2Y*aire3*espejoY*aire3*lente2Y*aire2*lente1Y*aire1; %%Con las lentes simples

%Modelo de tamaño de haz
Mx = aire1*lente1X*aire2*lente2X*aire3; %%Con las lentes simples

My = aire1*lente1Y*aire2*lente2Y*aire3; %%Con las lentes simples



%M =  aire1*lente1*aire2*lente2*aire3*espejo*aire3*lente1*aire2*lente2*aire1;

%M =  aire1*[1 0; ((n2-n1)/(r2*n1)) n2/n1]* [1 t; 0 1]* [1 0; ((n1-n2)/(r1*n2)) n1/n2]*aire2*[1 0; ((n2-n1)/(r1*n1)) n2/n1]* [1 t; 0 1]* [1 0; ((n1-n2)/(r2*n2)) n1/n2]*aire3*espejo*aire3*[1 0; ((n2-n1)/(r2*n1)) n2/n1]* [1 t; 0 1]* [1 0; ((n1-n2)/(r1*n2)) n1/n2]*aire2*[1 0; ((n2-n1)/(r1*n1)) n2/n1]* [1 t; 0 1]* [1 0; ((n1-n2)/(r2*n2)) n1/n2]*aire1;

disp('inicio calculo proyección')

completoX = Factorizar(Simplificar(Mx));

completoY = Factorizar(Simplificar(My));




Ax = completoX(1,1);
Bx = completoX(1,2);
Cx = completoX(2,1);
Dx = completoX(2,2);
Ex = completoX(1,3);
Fx = completoX(2,3);

Ay = completoY(1,1);
By = completoY(1,2);
Cy = completoY(2,1);
Dy = completoY(2,2);
Ey = completoY(1,3);
Fy = completoY(2,3);


%Para X
xo = Ex;
alphax = Fx;


betaX = lambda/(pi*(w1)^2);

disp('r2x')
r2X = (Ax^2 + (betaX*Bx)^2)/(Ax*Cx + (betaX^2)*Dx*Bx);
disp('w2x')
w2X = (Simplificar(-lambda*((Ax^2)+ (betaX*Bx)^2))/Simplificar(betaX*pi*(Bx*Cx-Dx*Ax)))^(1/2);

a1x = 0;
b1x = -lambda/(pi*w1^2);

a2x = 1/r2X;
b2x = -lambda/(pi*w2X^2);

%Para Y
yo = Ey;
alphay = Fy;

betaY = lambda/(pi*(w1)^2);

disp('r2y')
r2Y = (Ay^2 + (betaY*By)^2)/(Ay*Cy + (betaY^2)*Dy*By);
disp('W2y')
w2Y = (Simplificar(-lambda*((Ay^2)+ (betaY*By)^2))/Simplificar(betaY*pi*(By*Cy-Dy*Ay)))^(1/2);

a1y = 0;
b1y = -lambda/(pi*w1^2);

a2y = 1/r2Y;
b2y = -lambda/(pi*w2Y^2);


%NO se necesita calcular la potencia reinyecctada con lo cual se
%simplifican los estudios
disp('Genero funcion numérica')

TamWX = matlabFunction(w2X);
TamWY = matlabFunction(w2Y);

syms R1x R1y R1PrimaX R1PrimaY 
% R1x: desplazamiento del eje optico en el eje X antes de entrar al sistema
% óptico
% R1PrimaX: Pendiente del haz en el eje X antes de entrar al sistema
% óptico.

IniVecX = [R1x; R1PrimaX; 1];
IniVecY = [R1y; R1PrimaY; 1];

disp('Calculo el desplazamiento del haz y su pendiente')

FinVecX = (completoX*IniVecX);
FinVecY = (completoY*IniVecY);




PosMuestraX = matlabFunction(FinVecX(1));
PosMuestraY = matlabFunction(FinVecY(1));
PendienteMuestraX = matlabFunction(FinVecX(2));
PendienteMuestraY = matlabFunction(FinVecY(2));

disp('Fin de calculos')


%@(v1prima,v2prima)sqrt(-((v2prima.*1.0-v1prima.*(v2prima.*4.977848090908266e-7+v2prima.^2.*3.583043152921466e-10+1.580675548975997e-5).*6.32640898790284e4+v1prima.^2.*v2prima.*2.266779640668609e-5).^2.*7.95e-7+(-v1prima.*(v2prima.*2.266779640668609e-5+3.149190290273705e-2)+v1prima.^2.*2.266779640668609e-5+1.0).^2.*7.95e-7)./((v1prima.*(-1.434057509232106)+v2prima.*1.434057509232106+1.992306575700392e3).*(v2prima.*1.580675548975997e-5-v1prima.*(v2prima.*4.977848090908266e-7+v2prima.^2.*3.583043152921466e-10+1.580675548975997e-5)+v1prima.^2.*v2prima.*3.583043152921466e-10).*1.9875e5-(-v1prima.*(v2prima.*2.266779640668609e-5+3.149190290273705e-2)+v1prima.^2.*2.266779640668609e-5+1.0).*(v2prima.*3.149190290273705e-2-v1prima.*v2prima.*2.266779640668609e-5+v2prima.^2.*2.266779640668609e-5+1.0).*1.9875e5))
%((212551867168292266051798606858603515625*v2prima)/9376820902873380299196750682389804834881536 + 8003958103113137690625/254159239847570202165248)*v1prima - (212551867168292266051798606858603515625*v1prima^2)/9376820902873380299196750682389804834881536 - 1
%(-(45178296236727359730263312004439730368152993902687479669348434543609619140625*v2prima)/43962385122281577447284502182627988157751262655416380470445077501856062772533576859648)*v1prima^3 + ((45178296236727359730263312004439730368152993902687479669348434543609619140625*v2prima^2)/21981192561140788723642251091313994078875631327708190235222538750928031386266788429824 + (1701256239553480174926977622296179565158580547045318603515625*v2prima)/595801418215276309629288171469988564872610307078943645736194015232 + 212551867168292266051798606858603515625/4688410451436690149598375341194902417440768)*v1prima^2 + (- (45178296236727359730263312004439730368152993902687479669348434543609619140625*v2prima^3)/43962385122281577447284502182627988157751262655416380470445077501856062772533576859648 - (1701256239553480174926977622296179565158580547045318603515625*v2prima^2)/595801418215276309629288171469988564872610307078943645736194015232 - (66991884942235188121939833111087797451171875*v2prima)/32298459599\\\n947358440583207725491682753749450752 - 8003958103113137690625/127079619923785101082624)*v1prima + (212551867168292266051798606858603515625*v2prima^2)/4688410451436690149598375341194902417440768 + (8003958103113137690625*v2prima)/127079619923785101082624 + 1


%@(v1prima,v2prima)sqrt(-((v2prima.*1.0-v1prima.*(v2prima.*4.977848090908266e-7+v2prima.^2.*3.583043152921466e-10+1.580675548975997e-5).*6.32640898790284e4+v1prima.^2.*v2prima.*2.266779640668609e-5).^2.*7.95e-7+(-v1prima.*(v2prima.*2.266779640668609e-5+3.149190290273705e-2)+v1prima.^2.*2.266779640668609e-5+1.0).^2.*7.95e-7)./((v1prima.*(-1.434057509232106)+v2prima.*1.434057509232106+1.992306575700392e3).*(v2prima.*1.580675548975997e-5-v1prima.*(v2prima.*4.977848090908266e-7+v2prima.^2.*3.583043152921466e-10+1.580675548975997e-5)+v1prima.^2.*v2prima.*3.583043152921466e-10).*1.9875e5-(-v1prima.*(v2prima.*2.266779640668609e-5+3.149190290273705e-2)+v1prima.^2.*2.266779640668609e-5+1.0).*(v2prima.*3.149190290273705e-2-v1prima.*v2prima.*2.266779640668609e-5+v2prima.^2.*2.266779640668609e-5+1.0).*1.9875e5))
%@(v1prima,v2prima)sqrt(-((v2prima.*1.0-v1prima.*(v2prima.*4.977848090908266e-7+v2prima.^2.*3.583043152921466e-10+1.580675548975997e-5).*6.32640898790284e4+v1prima.^2.*v2prima.*2.266779640668609e-5).^2.*7.95e-7+(-v1prima.*(v2prima.*2.266779640668609e-5+3.149190290273705e-2)+v1prima.^2.*2.266779640668609e-5+1.0).^2.*7.95e-7)./((v1prima.*(-1.434057509232106)+v2prima.*1.434057509232106+1.992306575700392e3).*(v2prima.*1.580675548975997e-5-v1prima.*(v2prima.*4.977848090908266e-7+v2prima.^2.*3.583043152921466e-10+1.580675548975997e-5)+v1prima.^2.*v2prima.*3.583043152921466e-10).*1.9875e5-(-v1prima.*(v2prima.*2.266779640668609e-5+3.149190290273705e-2)+v1prima.^2.*2.266779640668609e-5+1.0).*(v2prima.*3.149190290273705e-2-v1prima.*v2prima.*2.266779640668609e-5+v2prima.^2.*2.266779640668609e-5+1.0).*1.9875e5))