close all;
clear all;

%Script que genera los modelos de acople a fibra empleando la geometría del sistema implementado

syms d1 d2 alpha deltaFocus dlente f dtraking h

%Definición de variables:
% f = distancia focal de las lentes
% d1, d2 = desplazamiento lateral de las muestras
% deltaFocus = Corriemiento en focus de la lente L2
% alpha = Inclinación de la muestra
% dlente = f;
% dtraking  = Auxiliar (equivale a d1 o d2)
% h = altura de la muestra
% alpha = Inclinación de la muestra

%calculo la propagación de una distancia + una lente

MatrizAireLente = [1 dlente; 0 1]*[1 0;-1/f 1];


%defino los términos de E y F de la nueva matriz
E = (1- MatrizAireLente(1,1))* dtraking;
F =  MatrizAireLente(2,1)* dtraking;

MatrizLenteBasica = [MatrizAireLente(1,1) MatrizAireLente(1,2) E; MatrizAireLente(2,1) MatrizAireLente(2,2) F; 0 0 1];

L1 = MatrizLenteBasica;
L1 = subs(L1, [dlente dtraking], [f d1]);
L2 = MatrizLenteBasica;
L2 = subs(L2, [dlente dtraking], [f d2]);

%ploteo la matriz L2
%disp(L2);


%defino las matrices intermedias (distancias)


dis1 = [0 (f-deltaFocus) 0 ; 0  1 0 ; 0 0 1]; %Distancia entre L1 y L2
dis2 = [0 (f+deltaFocus -h) 0 ; 0  1 0 ; 0 0 1]; %distancia entre L2 y la muestra

Muestra = [1 0 0; 0 1 2*alpha; 0 0 1]; %Matriz que modela la superficie inclinada de la muestra


%calculo la matriz hasta la muestra
MIda = dis2*L2*dis1*L1;

MVuelta =  simplify(L1*dis1*L2*dis2*Muestra*MIda);

%tengo las matrices de rayos para la ida y la vuelta.
disp('Tengo las matrices de rayos para la ida y la vuelta.');



%defino el vector P1 (posición sobre la muestra);

PosMuestra = MIda*[1;0;1];

disp('Tengo la posición sobre la muestra');


%Calculo la matriz de salida:

SA = MVuelta(1,1);
SB = MVuelta(1,2);
SC = MVuelta(2,1);
SD = MVuelta(2,2);
SE = MVuelta(1,3);
SF = MVuelta(2,3);

%tengo los coeficientes de la matriz final.

%calculo haz de salida del sistema

hazVueltaFibra = simplify (MVuelta*[1;0;1]);


%calculo la función de transferencia


%Para X

%defino las cuentas para cada dirección 
%realizo todas la cuentas devuelta como para asegurarme 


%defino el radio de curvatura complejo para el haz de salida

syms lambda omegaF omegaI

%qIniInv = 1/Rini - 1i*lambda/(pi*omega^2);
% qIniInv = - 1i*lambda/(pi*omega^2);
% 
% qIni = 1/qIniInv;

%Calculo la expresión del acople a fibra.

%el exponente queda:

syms k AlphaX AlphaY xo yo DisZ lambda

A = 1;
D = 1;
C = 0;
B = DisZ;



Mb = -1i* (2/(k*omegaI));
Ma = (A/Mb + B)/(C/Mb + D);

omegaFNum =  sqrt(2/(k*imag(Ma)));

AcopleXNum = sqrt(pi/(k*1i*(Ma - Mb)))*exp((1i*k*(AlphaX-2*xo*Ma))^2/(1i*k*(Ma-Mb)))*exp(-1i*k*Ma*xo^2);
AcopleXDen = sqrt(2/(pi*omegaF^2))*sqrt(2/(pi*omegaI^2));


AcopleFinal = (AcopleXNum/AcopleXDen)*(AcopleXNum/AcopleXDen);

%pruebo un caso simple (pap Nelly)


AcopleEva = subs(AcopleFinal, [omegaF], [omegaFNum]);
AcopleEva = subs(AcopleEva, [xo, AlphaX,  k, omegaF], [0, 0,  (2*pi/lambda),omegaFNum]);

funcion = matlabFunction(AcopleEva);

VecPos = zeros(100,1);
VecVal = zeros(100,1);
lambdav = 660e-9;
omegaIv = 1e-6;
for i = 1:100
	p = i*1e-6;
	VecPos(i) = p;
	VecVal(i) = abs(funcion(p,lambdav,omegaIv));
end

figure
plot (VecPos,VecVal)



% AcopleX = sqrt(pi/(-2*k*Bx))*exp((xo*2*k*Bx - AlphaX/2)^2/(-2*k*Bx))*exp(2*k*Bx*xo^2);
% AcopleY = sqrt(pi/(-2*k*By))*exp((yo*2*k*By - AlphaY/2)^2/(-2*k*By))*exp(2*k*By*yo^2);
% 
% syms A1 A2 wx wy wo DisZ
% A1 = sqrt(2/(pi*wx*wy));
% A2 = sqrt(2/(pi*wo^2));
% 
% AcopleFinal = AcopleX*AcopleY/(A1*A2);
% 
% %verifico que la función de acople que se obtuvo sea correcta.
% AcopleEstudio = subs(AcopleFinal, [k], [2 *pi / lambda]); 
% AcopleEstudio = subs(AcopleEstudio, [wo, lambda], [1e-6, 660e-9]); %reemplazo el haz de salida y longitud de onda
% 
% 
% AcopleEstudio = subs(AcopleEstudio, [AlphaX AlphaY xo yo wy], [0 0 0 0 wx]); %no le pongo ángulos ni desviaciones
% AcopleEstudio = subs(AcopleEstudio, [By], [Bx]);
% 
% A = 1;
% D = 1;
% C = 0;
% B = DisZ;
% %BxCalculo =  complex((A*qIni + B)/(C*qIni + D));
% BxCalculo = (pi*omega^2*1i)/lambda;
% AcopleEstudio = subs(AcopleEstudio, [Bx], [BxCalculo]);


disp('Genero funcion numérica')
%funcion = matlabFunction(TransmisionB);


















