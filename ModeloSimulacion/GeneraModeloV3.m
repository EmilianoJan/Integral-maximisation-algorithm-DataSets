close all;
clear all;

%Script que genera los modelos de acople a fibra empleando la geometría del sistema implementado

%Definición de variables:
% f = distancia focal de las lentes
% d1, d2 = desplazamiento lateral de las muestras
% deltaFocus = Corriemiento en focus de la lente L2
% alpha = Inclinación de la muestra
% dlente = f;
% dtraking  = Auxiliar (equivale a d1 o d2)
% h = altura de la muestra
% alpha = Inclinación de la muestra



%syms f v1 v2 v2prima v1prima no d rc q qprima zcero x y a1x b1x a2x b2x x xo k alphax alphay integer;
%syms w1 w2 k r2 lambda A B C D beta x tilt1PX tilt2PX trackin1PX trackin2PX LLente tiltMP tiltMPX integer ;
%syms tilt1PY tilt2PY trackin1PY trackin2PY a1y b1y a2y b2y tiltMPY v2 v1 integer;

disp('inicio calculo de las matrices')


syms d1 d2 alpha deltaFocus dlente f dtraking h

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %calculo la propagación de una distancia + una lente
% MatrizAireLente = [1 dlente; 0 1]*[1 0;-1/f 1];
% 
% %defino los términos de E y F de la nueva matriz
% E = (1- MatrizAireLente(1,1))* dtraking;
% F =  MatrizAireLente(2,1)* dtraking;
% 
% MatrizLenteBasica = [MatrizAireLente(1,1) MatrizAireLente(1,2) E; MatrizAireLente(2,1) MatrizAireLente(2,2) F; 0 0 1];
% 
% L1 = MatrizLenteBasica;
% L1 = subs(L1, [dlente dtraking], [f d1]);
% L2 = MatrizLenteBasica;
% L2 = subs(L2, [dlente dtraking], [f d2]);
% 
% %defino las matrices intermedias (distancias)
% dis1 = [1 (f-deltaFocus) 0 ; 0  1 0 ; 0 0 1]; %Distancia entre L1 y L2
% dis2 = [1 (f+deltaFocus -h) 0 ; 0  1 0 ; 0 0 1]; %distancia entre L2 y la muestra
% 
% Muestra = [1 0 0; 0 1 2*alpha; 0 0 1]; %Matriz que modela la superficie inclinada de la muestra
% %calculo la matriz hasta la muestra
% MIda = dis2*L2*dis1*L1;
% 
% MVuelta =  simplify(L1*dis1*L2*dis2*Muestra*MIda);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

md1 = [1 f 0; 0 1 0 ; 0 0 1];
md2 = [1 (2*f + deltaFocus) 0; 0 1 0 ; 0 0 1];
md3 = [1 (f - deltaFocus -h) 0; 0 1 0 ; 0 0 1];

LGene = [1 0 0; -1/f 1 -dtraking/f; 0 0 1];

L1 = subs(LGene , dtraking, d1);
L2 = subs(LGene , dtraking, d2);

Muestra = [1 0 0; 0 1 2*alpha; 0 0 1];

MIda = simplify(md3*L2*md2*L1*md1);

disp('Coeficientes ida')

%escribo los coeficientes de la matriz de transferencia solo de la ida
disp('A')
latex(MIda(1,1))
disp('B')
latex(MIda(1,2))
disp('C')
latex(MIda(2,1))
disp('D')
latex(MIda(2,2))
disp('E')
latex(MIda(1,3))
disp('F')
latex(MIda(2,3))


MVuelta = md1*L1*md2*L2*md3*Muestra*md3*L2*md2*L1*md1;



syms d1x d1y d2x d2y alphaY alphaX k lambda w1

Mx = simplify( subs(MVuelta, [d1, d2, alpha], [d1x, d2x, alphaX]));
My = simplify(subs(MVuelta, [d1, d2, alpha], [d1y, d2y, alphaY]));

%escribo los coeficientes de la matriz de trasnferencia completa
disp('-------------------------------')
disp('Coeficientes ida y vuelta')
disp('A')
latex(Mx(1,1))
disp('B')
latex(Mx(1,2))
disp('C')
latex(Mx(2,1))
disp('D')
latex(Mx(2,2))
disp('E')
latex(Mx(1,3))
disp('F')
latex(Mx(2,3))


[TransmisionB] = CalculoAcopleVB (Mx, My);






disp('Genero funcion numérica')
funcion = matlabFunction(TransmisionB);


%calculo la posición del haz sobre la muestra usando las matrices ya definidas para la ida

PosEnMustra = MIda*[0;0;1];
FPosEnMustra = matlabFunction(PosEnMustra(1));

%escribo la función en latex
disp('Función posición sobre la muestra')
latex(PosEnMustra(1))



%Me fijo que condición queda cuando h = 0 y d1 y d2 son iguales

SPunto = simplify(subs(PosEnMustra(1), [d2 h deltaFocus], [d1 0 0])); %verifica que ande bien sin embargo aparece un - de más


%Calculo el tamaño del haz sobre la muestra 

Ax = MIda(1,1);
Bx = MIda(1,2);
Cx = MIda(2,1);
Dx = MIda(2,2);
BetaVarX = lambda/(pi*(w1)^2);
w2X = sqrt(Simplificar(-lambda*((Ax^2)+ (BetaVarX*Bx)^2))/Simplificar(BetaVarX*pi*(Bx*Cx-Dx*Ax)));

w2Salida = matlabFunction(w2X);



%funcion = simplify(subs(funcion, [k] , [2*pi/lambda]));


%chequeo que todo quede de forma razonable.
%Planteo que no haya desplazamientos ni inclinaciones de la muestra. Solo 
%variación del focus.


% Mxb = subs(MVuelta, [d1, d2, alpha, h], [0, 0, 0, 0]);
% Myb = subs(MVuelta, [d1, d2, alpha, h], [0, 0, 0, 0]);

% [TransmisionC] = simplify(subs(funcion,  [d1x, d2x, alphaX, d1y, d2y, alphaY, h], [0, 0, 0, 0, 0, 0, 0]));
% 
% disp('Genero funcion numérica')
% funcionC = matlabFunction(TransmisionC);



























