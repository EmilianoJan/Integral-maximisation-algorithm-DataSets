function [SimbolicoSalida] = CalculoAcopleVB (Mx, My)
%Rutina que calcula la función de acople dadas las matrices de rayos para los componentes X e Y
%Devuelve la función simbolica

completoX = Factorizar(Simplificar(Mx));
completoY = Factorizar(Simplificar(My));


disp('inicio calculo proyección')

syms w1 w2 k r2 lambda A B C D BetaVar x tilt1PX tilt2PX trackin1PX trackin2PX LLente tiltMP tiltMPX integer ;
syms f v1 v2 v2prima v1prima no d rc q qprima zcero x y a1x b1x a2x b2x x xo k alphax alphay integer;
%De acá para abajo es cálculo del modelo de acople.

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


BetaVarX = lambda/(pi*(w1)^2);

disp('r2x')
r2X = (Ax^2 + (BetaVarX*Bx)^2)/(Ax*Cx + (BetaVarX^2)*Dx*Bx);
disp('w2x')
w2X = sqrt(Simplificar(-lambda*((Ax^2)+ (BetaVarX*Bx)^2))/Simplificar(BetaVarX*pi*(Bx*Cx-Dx*Ax)));

a1x = 0;
b1x = -lambda/(pi*w1^2);

a2x = 1/r2X;
b2x = -lambda/(pi*w2X^2);

r2X = simplify(subs(r2X, lambda, [2*pi/k]));
a2x = simplify(subs(a2x, lambda, [2*pi/k]));
b1x = simplify(subs(b1x, lambda, [2*pi/k]));
b2x = simplify(subs(b2x, lambda, [2*pi/k]));
w2X = simplify(subs(w2X, lambda, [2*pi/k]));


%Para Y
yo = Ey;
alphay = Fy;

BetaVarY = lambda/(pi*(w1)^2);

disp('r2y')
r2Y = (Ay^2 + (BetaVarY*By)^2)/(Ay*Cy + (BetaVarY^2)*Dy*By);
disp('W2y')
w2Y = sqrt(Simplificar(-lambda*((Ay^2)+ (BetaVarY*By)^2))/Simplificar(BetaVarY*pi*(By*Cy-Dy*Ay)));

a1y = 0;
b1y = -lambda/(pi*w1^2);

a2y = 1/r2Y;
b2y = -lambda/(pi*w2Y^2);

r2Y = simplify(subs(r2Y, lambda, [2*pi/k]));
a2y = simplify(subs(a2y, lambda, [2*pi/k]));
b1y = simplify(subs(b1y, lambda, [2*pi/k]));
b2y = simplify(subs(b2y, lambda, [2*pi/k]));
w2Y = simplify(subs(w2Y, lambda, [2*pi/k]));


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

SimbolicoSalida = TransmisionB;



end