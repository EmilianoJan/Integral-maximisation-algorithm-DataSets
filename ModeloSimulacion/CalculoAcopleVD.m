close all;
clear all;
%Integrales de prueba.


syms a b
syms k a1 b1 a2 b2 xo x alpha A1 A2 real
syms yo y beta w1 w2 r2 real
syms q1 q2c 



% assume(a,"positive")
% assume(b,"positive")
% 
% funci = exp(1i*a*x^2)*exp(1i*b*x);
% 
% Integralx =  int(funci, x);

%(pi^(1/2)*exp(-(b^2*1i)/(4*a))*erf((b + 2*a*x)/(2*(a*1i)^(1/2)))*1i)/(2*(a*1i)^(1/2))


%(pi^(1/2)*exp(-(b^2*1i)/(4*a))*limit(erf((b + 2*a*x)/(2*(a*1i)^(1/2))), x, -Inf)*1i)/(2*(a*1i)^(1/2)) + (pi^(1/2)*exp(-(b^2*1i)/(4*a))*limit(erf((b + 2*a*x)/(2*(a*1i)^(1/2))), x, Inf)*1i)/(2*(a*1i)^(1/2))



phi = sqrt(pi/a)*exp(b^2/(4*a));

acalc = 1i*k*(1/q2c - 1/q1);
bcalc = 1i*k*(alpha -xo/(q2c));

phib = subs(phi, [a b], [acalc bcalc]);

completo = phib*conj(phib);

invq1 = -2*1i/(k*w1^2);
invq2c = 1/r2 + 1i*2/(k*w2^2);

phic = subs(phib, [1/q1 1/q2c], [invq1, invq2c]);

completoc = simplify( phic*conj(phic));

completoc = collect(completoc);









