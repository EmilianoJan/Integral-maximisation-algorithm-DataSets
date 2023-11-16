close all;
clear all;

%en este script se describen los modelos ópticos empleados para calcular la reinyección.


%subs(x*y, {x, y}, {[0 1; -1 0], [1 -1; -2 1]})
%En este script se busca plotear el desplazamiento de la lente tilts y la reinyeccion.

syms f v1 v2 v2prima v1prima no d rc q qprima zcero x y a1x b1x a2x b2x x xo k alphax alphay integer;
syms w1 w2 k r2 lambda A B C D beta x tilt1PX tilt2PX trackin1PX trackin2PX LLente tiltMP tiltMPX integer ;
syms tilt1PY tilt2PY trackin1PY trackin2PY a1y b1y a2y b2y tiltMPY v2 v1 integer;

%tiltMP = angulo de la muestra con respecto al eje optico

%matrices definidas de izq a derecha imaginando el sistema de lentes en
%donde el aire es el primer elemento entre la fibra y la lente (y no el
%espejo)




%--------------------------------------------------
%Variables (Comentar las queserán parte del grafico

v1prima = 0;  %Corrimiento del foco en z
v2prima = 0;

tilt1PX = 0; %Tilt lente 1 en eje X
tilt2PX = 0;

tilt1PY = 0; %Tilt lente 1 en eje y
%tilt2PY = 0;

tiltMPX = 0; %Tilt muestra 1 en eje X
tiltMPY = 0.18;

trackin1PX = 1.5; %Tracking lente 1 en eje X
trackin2PX = 0;

trackin1PY = 0; %Tracking lente 1 en eje Y
%trackin2PY = 0;

%Nombre de ejes

Eje1 = 'tilt2PY';
Eje2 = 'trackin2PY';

Descripcion = 'tiltMPY = 0.18 trackin1PX = 1.5';

RangoEje1 = 1e-3;
RangoEje2 = 20;

%------------------------------------------------------

disp('inicio calculo de las matrices')

NcalculoFoco = 1.5115919;

d = 28.6e-3; %distancia entre lentes
f = 3.32e-3; %Distancia focal de las lentes
lambda = 660e-9; %Longitud de onda del haz
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

Mx = aire1*lente1X*aire2*lente2X*aire3*espejoX*aire3*lente2X*aire2*lente1X*aire1; %%Con las lentes simples

My = aire1*lente1Y*aire2*lente2Y*aire3*espejoY*aire3*lente2Y*aire2*lente1Y*aire1; %%Con las lentes simples

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
w2X = sqrt(Simplificar(-lambda*((Ax^2)+ (betaX*Bx)^2))/Simplificar(betaX*pi*(Bx*Cx-Dx*Ax)));

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
w2Y = sqrt(Simplificar(-lambda*((Ay^2)+ (betaY*By)^2))/Simplificar(betaY*pi*(By*Cy-Dy*Ay)));

a1y = 0;
b1y = -lambda/(pi*w1^2);

a2y = 1/r2Y;
b2y = -lambda/(pi*w2Y^2);

%Calculo todos los exponentes y todas las normas (Con el planteo de Kevin
%J. Garcia)

ArgExpB = -1i*k*(((x-xo)^2)*(a2x + 1i*b2x) + ((y- yo)^2)*(a2y + 1i*b2y)) - 1i*k*alphax*x - 1i*k*alphay*y;

ArgExpA = -1i*k*(((x)^2)*(a1x + 1i*b1x) + (y^2)*(a1y + 1i*b1y));

disp('Exponentes de <a,a>')
% Exponentes  para <a, a>
%ArgumentoA_A = collect(simplify(ArgExpA+ conj(ArgExpA))); %Descomentar para calcular los coeficientes
%2*b1x*k*x^2 + 2*b1y*k*y^2
ExpAX_a = 2*b1x*k/-1;
ExpAY_a = 2*b1y*k/-1;

NormP1X = (sqrt(pi()/ExpAX_a));
NormP1Y = (sqrt(pi()/ExpAY_a));

NormAA = ( NormP1X*NormP1Y);


disp('Exponentes de <b,b>')
%Exponentes para <b, b>
%ArgumentoB_B = collect(simplify(ArgExpB+ conj(ArgExpB)),  [x y]); %Descomentar para calcular los coeficientes

%2*b2x*k*x^2 - 4*b2x*k*xo*x + 2*b2y*k*y^2 - 4*b2y*k*yo*y + 2*k*(b2x*xo^2 + b2y*yo^2)

ExpBX_a = 2*b2x*k/-1;
ExpBX_b = (- 4*b2x*k*xo)/-2;


ExpBY_a = 2*b2y*k/-1;
ExpBY_b = (-4*b2y*k*yo)/-2;

NumBB = exp( 2*k*(b2x*xo^2 + b2y*yo^2));


NormP2X = ((pi()/ExpBX_a))^(1/2)*exp((ExpBX_b^2/ExpBX_a));
NormP2Y = ((pi()/ExpBY_a))^(1/2)*exp((ExpBY_b^2/ExpBY_a));

NormBB = Simplificar(NormP2X*NormP2Y*NumBB);

disp('Exponentes de <a,b>')
%Exponentes de <a,b>
%ArgumentoA_B = collect(simplify(ArgExpA+ conj(ArgExpB)), [x y]); %Descomentar para calcular los coeficientes
%a = (- k*(a1x + b1x*1i)*1i + k*(a2x - b2x*1i)*1i)*x^2 + (alphax*k*1i - k*xo*(a2x - b2x*1i)*2i)*x + (- k*(a1y + b1y*1i)*1i + k*(a2y - b2y*1i)*1i)*y^2 + (alphay*k*1i - k*yo*(a2y - b2y*1i)*2i)*y + k*((a2x - b2x*1i)*xo^2 + (a2y - b2y*1i)*yo^2)*1i;

%(- k*(a1x + b1x*1i)*1i + k*(a2x - b2x*1i)*1i)*x^2
%(alphax*k*1i - k*xo*(a2x - b2x*1i)*2i)*x
%(- k*(a1y + b1y*1i)*1i + k*(a2y - b2y*1i)*1i)*y^2 
%+ (alphay*k*1i - k*yo*(a2y - b2y*1i)*2i)*y
%+ k*((a2x - b2x*1i)*xo^2 + (a2y - b2y*1i)*yo^2)*1i

ExpABX_a = ((-k*(a1x + b1x*1i)*1i + k*(a2x - b2x*1i)*1i)/-1);
ExpABX_b = ((alphax*k*1i - k*xo*(a2x - b2x*1i)*2i)/-2);

ExpABY_a = ((-k*(a1y + b1y*1i)*1i + k*(a2y - b2y*1i)*1i)/-1);
ExpABY_b = ((alphay*k*1i - k*yo*(a2y - b2y*1i)*2i)/-2);

NumAB = ( exp((k*((a2x - b2x*1i)*xo^2 + (a2y - b2y*1i)*yo^2)*1i)));


NormABX = ((pi()/(ExpABX_a))^(1/2)*exp((ExpABX_b^2)/ExpABY_a));
NormABY = ((pi()/(ExpABY_a))^(1/2)*exp((ExpABY_b^2)/ExpABY_a));

NormAB = ((NormABX*NormABY*NumAB));



disp('Planteo la transmisión ')
%Planteo la transmisión 


TransmisionB= (((real(NormAB)^2 + imag(NormAB)^2))/ ((Simplificar(NormBB*NormAA))))^(1/2);

disp('Genero funcion numérica')
funcion = matlabFunction(TransmisionB);





puntos = linspace(-3e5 , 3e5, 500);
%subs(x*y, {x, y}, {[0 1; -1 0], [1 -1; -2 1]})
inda = 1;
indb = 1;
disp('Evalúo funcion numérica');
StepTrack1 = linspace(-1*RangoEje1, RangoEje1, 200); %tilt
%qsep = linspace(0 , 0.04, 500);
StepTrack2 = linspace(-1*RangoEje2, RangoEje2, 200); %tracking

for e = StepTrack1
    inda = 1;
   for i =  StepTrack2
       salidab = funcion(e, i);
       reg(inda,indb) = salidab;
       inda = inda+1;
   end
   indb = indb +1;
end

disp('Grafico');




figure
%plot(puntos , salidab )
surfc(StepTrack1,StepTrack2,reg, 'LineStyle' , 'none')
az = 180;
el = 90;

% az = -270;
% el = -90;
% 
view(az, el);
xlabel(Eje1)
ylabel(Eje2)
title(Descripcion)
zlabel('\tau')
grid on
grid minor
axis tight
colorbar
disp('Guardo todo')

NombreDocumento = [ Eje1 '_Ran_' num2str(RangoEje1) '_VS_' Eje2  '_Ran_' num2str(RangoEje2) '  ' Descripcion ];

%savefig ( [NombreDocumento '.fig'])

%save([NombreDocumento '.mat'])