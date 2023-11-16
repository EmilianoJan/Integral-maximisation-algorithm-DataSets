close all;
clear all;
%Este script busca recalcular la integral de acople de Facundo

syms k a1 b1 a2 b2 xo x alpha A1 A2 real
syms yo y beta real
syms q1 q2

assume(k,"positive")
assume(a2,"positive")
% assume(b1,"positive")
% assume(b2,"positive")


%phi1x = exp(-1i*k*x^2*(1i*b1));
%phi2x = exp(-1i*k*((x-xo)^2*(a2 + 1i*b2) + alpha*x));

phi1x = exp(-1i*k*x^2/q1);
phi2x = exp(-1i*k*((x-xo)^2/(q2) + alpha*x));

Ainte = simplify(A1*phi1x*conj(A2*phi2x));
Integralx =  int(Ainte, x, -inf, inf);

%Salida = simplify(Integralx*);

% phi1y = subs(phi1x, [x, xo, alpha], [y, yo, beta]);
% phi2y = subs(phi2x, [x, xo, alpha], [y, yo, beta]);
% 
% 
% Ainte = simplify(A1*phi1x*phi1y*conj(A2*phi2x*phi2y));
% 
% Integralx =  int(Ainte, x, -inf, inf);
% Integraly =  int(Integralx, y, -inf, inf);
% 
% Salida = simplify(abs(Integraly^2));
% 
% latex(Salida);

%ValorSalida = (A1^2*A2^2*abs(pi^(1/2)*exp(-(k*(a2 - a1 + b1*1i + b2*1i)*(alpha^2*1i - a2*alpha*x0*4i - 4*alpha*b2*x0 + a1*a2*x0^2*4i + 4*a1*b2*x0^2 - 4*a2*b1*x0^2 + b1*b2*x0^2*4i))/(4*(a1^2 - 2*a1*a2 + a2^2 + b1^2 + 2*b1*b2 + b2^2)))*limit(erf((k*(2*a1*x - alpha - 2*a2*x + 2*a2*x0 + b1*x*2i + b2*x*2i - b2*x0*2i))/(2*(k*(a2*1i + b1 + b2 - a1*1i))^(1/2))), x, -Inf)*1i - pi^(1/2)*exp(-(k*(a2 - a1 + b1*1i + b2*1i)*(alpha^2*1i - a2*alpha*x0*4i - 4*alpha*b2*x0 + a1*a2*x0^2*4i + 4*a1*b2*x0^2 - 4*a2*b1*x0^2 + b1*b2*x0^2*4i))/(4*(a1^2 - 2*a1*a2 + a2^2 + b1^2 + 2*b1*b2 + b2^2)))*limit(erf((k*(2*a1*x - alpha - 2*a2*x + 2*a2*x0 + b1*x*2i + b2*x*2i - b2*x0*2i))/(2*(k*(a2*1i + b1 + b2 - a1*1i))^(1/2))), x, Inf)*1i)^2)/(4*abs(k*(b1 + a2*1i - a1*1i + b2)));

%(A1^2*A2^2*abs(pi^(1/2)*exp(-(k*(a2 - a1 + b1*1i + b2*1i)*(beta^2*1i - a2*beta*yo*4i - 4*b2*beta*yo + a1*a2*yo^2*4i + 4*a1*b2*yo^2 - 4*a2*b1*yo^2 + b1*b2*yo^2*4i))/(4*(a1^2 - 2*a1*a2 + a2^2 + b1^2 + 2*b1*b2 + b2^2)))*limit(erf((k*(2*a1*y - beta - 2*a2*y + 2*a2*yo + b1*y*2i + b2*y*2i - b2*yo*2i))/(2*(k*(a2*1i + b1 + b2 - a1*1i))^(1/2))), y, -Inf)*1i - pi^(1/2)*exp(-(k*(a2 - a1 + b1*1i + b2*1i)*(beta^2*1i - a2*beta*yo*4i - 4*b2*beta*yo + a1*a2*yo^2*4i + 4*a1*b2*yo^2 - 4*a2*b1*yo^2 + b1*b2*yo^2*4i))/(4*(a1^2 - 2*a1*a2 + a2^2 + b1^2 + 2*b1*b2 + b2^2)))*limit(erf((k*(2*a1*y - beta - 2*a2*y + 2*a2*yo + b1*y*2i + b2*y*2i - b2*yo*2i))/(2*(k*(a2*1i + b1 + b2 - a1*1i))^(1/2))), y, Inf)*1i)^2*abs(pi^(1/2)*exp(-(k*(a2 - a1 + b1*1i + b2*1i)*(alpha^2*1i - a2*alpha*xo*4i - 4*alpha*b2*xo + a1*a2*xo^2*4i + 4*a1*b2*xo^2 - 4*a2*b1*xo^2 + b1*b2*xo^2*4i))/(4*(a1^2 - 2*a1*a2 + a2^2 + b1^2 + 2*b1*b2 + b2^2)))*limit(erf((k*(2*a1*x - alpha - 2*a2*x + 2*a2*xo + b1*x*2i + b2*x*2i - b2*xo*2i))/(2*(k*(a2*1i + b1 \\\n+ b2 - a1*1i))^(1/2))), x, -Inf)*1i - pi^(1/2)*exp(-(k*(a2 - a1 + b1*1i + b2*1i)*(alpha^2*1i - a2*alpha*xo*4i - 4*alpha*b2*xo + a1*a2*xo^2*4i + 4*a1*b2*xo^2 - 4*a2*b1*xo^2 + b1*b2*xo^2*4i))/(4*(a1^2 - 2*a1*a2 + a2^2 + b1^2 + 2*b1*b2 + b2^2)))*limit(erf((k*(2*a1*x - alpha - 2*a2*x + 2*a2*xo + b1*x*2i + b2*x*2i - b2*xo*2i))/(2*(k*(a2*1i + b1 + b2 - a1*1i))^(1/2))), x, Inf)*1i)^2)/(16*abs(k*(a2*1i + b1 + b2 - a1*1i))^2)


%piecewise(
% a1 == a2 & b1 + b2 < 0,(A1^2*A2^2*pi^2*exp((k*((alpha^2 + 4*b1*b2*xo^2)*(b1 + b2) + 4*a2^2*xo^2*(b1 + b2) - 4*a2*alpha*xo*(b1 + b2)))/(2*(b1^2 + 2*b1*b2 + b2^2)))*exp((k*((beta^2 + 4*b1*b2*yo^2)*(b1 + b2) + 4*a2^2*yo^2*(b1 + b2) - 4*a2*beta*yo*(b1 + b2)))/(2*(b1^2 + 2*b1*b2 + b2^2))))/(k^2*(b1 + b2)^2),
% a1 == a2 & 0 < b1 + b2 | a1 < a2 & b1 + b2 == 0 | a2 < a1 & b1 + b2 == 0 | a1 < a2 & 0 < b1 + b2 | a1 < a2 & b1 + b2 < 0 | a2 < a1 & 0 < b1 + b2 | a2 < a1 & b1 + b2 < 0, (A1^2*A2^2*abs(pi^(1/2)*exp(-(k*(a2 - a1 + b1*1i + b2*1i)*(alpha^2*1i - a2*alpha*xo*4i - 4*alpha*b2*xo + a1*a2*xo^2*4i + 4*a1*b2*xo^2 - 4*a2*b1*xo^2 + b1*b2*xo^2*4i))/(4*(a1^2 - 2*a1*a2 + a2^2 + b1^2 + 2*b1*b2 + b2^2)))*limit(erf((k^(1/2)*(2*a1*x - alpha - 2*a2*x + 2*a2*xo + b1*x*2i + b2*x*2i - b2*xo*2i))/(2*(- a1*1i + a2*1i + b1 + b2)^(1/2))), x, -Inf)*1i - pi^(1/2)*exp(-(k*(a2 - a1 + b1*1i + b2*1i)*(alpha^2*1i - a2*alpha*xo*4i - 4*alpha*b2*xo + a1*a2*xo^2*4i + 4*a1*b2*xo^2 - 4*a2*b1*xo^2 + b1*b2*xo^2*4i))/\\\n(4*(a1^2 - 2*a1*a2 + a2^2 + b1^2 + 2*b1*b2 + b2^2)))*limit(erf((k^(1/2)*(2*a1*x - alpha - 2*a2*x + 2*a2*xo + b1*x*2i + b2*x*2i - b2*xo*2i))/(2*(- a1*1i + a2*1i + b1 + b2)^(1/2))), x, Inf)*1i)^2*abs(pi^(1/2)*exp(-(k*(a2 - a1 + b1*1i + b2*1i)*(beta^2*1i - a2*beta*yo*4i - 4*b2*beta*yo + a1*a2*yo^2*4i + 4*a1*b2*yo^2 - 4*a2*b1*yo^2 + b1*b2*yo^2*4i))/(4*(a1^2 - 2*a1*a2 + a2^2 + b1^2 + 2*b1*b2 + b2^2)))*limit(erf((k^(1/2)*(2*a1*y - beta - 2*a2*y + 2*a2*yo + b1*y*2i + b2*y*2i - b2*yo*2i))/(2*(- a1*1i + a2*1i + b1 + b2)^(1/2))), y, -Inf)*1i - pi^(1/2)*exp(-(k*(a2 - a1 + b1*1i + b2*1i)*(beta^2*1i - a2*beta*yo*4i - 4*b2*beta*yo + a1*a2*yo^2*4i + 4*a1*b2*yo^2 - 4*a2*b1*yo^2 + b1*b2*yo^2*4i))/(4*(a1^2 - 2*a1*a2 + a2^2 + b1^2 + 2*b1*b2 + b2^2)))*limit(erf((k^(1/2)*(2*a1*y - beta - 2*a2*y + 2*a2*yo + b1*y*2i + b2*y*2i - b2*yo*2i))/(2*(- a1*1i + a2*1i + b1 + b2)^(1/2))), y, Inf)*1i)^2)/(16*k^2*abs(- a1*1i + a2*1i + b1 + b2)^2))



%(A1^2*A2^2*abs(pi^(1/2)*exp((k*(a2 + b1*1i + b2*1i)*(4*alpha*b2*xo + a2*alpha*xo*4i - alpha^2*1i + 4*a2*b1*xo^2 - b1*b2*xo^2*4i))/(4*(a2^2 + b1^2 + 2*b1*b2 + b2^2)))*limit(erf((k^(1/2)*(alpha + 2*a2*x - 2*a2*xo - b1*x*2i - b2*x*2i + b2*xo*2i))/(2*(b1 + b2 + a2*1i)^(1/2))), x, -Inf)*1i - pi^(1/2)*exp((k*(a2 + b1*1i + b2*1i)*(4*alpha*b2*xo + a2*alpha*xo*4i - alpha^2*1i + 4*a2*b1*xo^2 - b1*b2*xo^2*4i))/(4*(a2^2 + b1^2 + 2*b1*b2 + b2^2)))*limit(erf((k^(1/2)*(alpha + 2*a2*x - 2*a2*xo - b1*x*2i - b2*x*2i + b2*xo*2i))/(2*(b1 + b2 + a2*1i)^(1/2))), x, Inf)*1i)^2*abs(pi^(1/2)*exp((k*(a2 + b1*1i + b2*1i)*(4*b2*beta*yo + a2*beta*yo*4i - beta^2*1i + 4*a2*b1*yo^2 - b1*b2*yo^2*4i))/(4*(a2^2 + b1^2 + 2*b1*b2 + b2^2)))*limit(erf((k^(1/2)*(beta + 2*a2*y - 2*a2*yo - b1*y*2i - b2*y*2i + b2*yo*2i))/(2*(b1 + b2 + a2*1i)^(1/2))), y, -Inf)*1i - pi^(1/2)*exp((k*(a2 + b1*1i + b2*1i)*(4*b2*beta*yo + a2*beta*yo*4i - beta^2*1i + 4*a2*b1*yo^2 - b1*b2*yo^2*4i))/(4*(a2^2 + b1^2 + 2*b1*b2 + b2^2)))*limit(erf((k^(1/2\\\n)*(beta + 2*a2*y - 2*a2*yo - b1*y*2i - b2*y*2i + b2*yo*2i))/(2*(b1 + b2 + a2*1i)^(1/2))), y, Inf)*1i)^2)/(16*k^2*abs(b1 + b2 + a2*1i)^2)

%piecewise(
%conj(q2) == q1, int(A1*A2*exp(k*(x*alpha + (x - xo)^2/conj(q2))*1i)*exp(-(x^2*k*1i)/q1), x, -Inf, Inf), 
%conj(q2) ~= q1, A1*A2*((pi^(1/2)*exp((k*xo^2*1i)/conj(q2))*exp(-(alpha*k^2*q1*xo*conj(q2)*1i)/(k*conj(q2)^2 - k*q1*conj(q2)))*exp((k^2*q1*xo^2*1i)/(k*conj(q2)^2 - k*q1*conj(q2)))*exp((alpha^2*k^2*q1*conj(q2)^2*1i)/(4*(k*conj(q2)^2 - k*q1*conj(q2))))*limit(erf(((k*(2*xo - alpha*conj(q2)))/(2*conj(q2)) - (x*(k*q1 - k*conj(q2)))/(q1*conj(q2)))/((k*q1*1i - k*conj(q2)*1i)/(q1*conj(q2)))^(1/2)), x, -Inf)*1i)/(2*((k*q1*1i - k*conj(q2)*1i)/(q1*conj(q2)))^(1/2)) - (pi^(1/2)*exp((k*xo^2*1i)/conj(q2))*exp(-(alpha*k^2*q1*xo*conj(q2)*1i)/(k*conj(q2)^2 - k*q1*conj(q2)))*exp((k^2*q1*xo^2*1i)/(k*conj(q2)^2 - k*q1*conj(q2)))*exp((alpha^2*k^2*q1*conj(q2)^2*1i)/(4*(k*conj(q2)^2 - k*q1*conj(q2))))*limit(erf(((k*(2*xo - alpha*conj(q2)))/(2*conj(q2)) - (x*(k*q1 - k*conj(q2)))/(q1*conj(q2)))/((k*q1*1i - k*conj(q2)*1i)/(q1*conj(q2)))^(1/2)), x, Inf)*1i)/(2*((k*q1*1i - k*conj(q2)*1i)/(q1*conj(q2))\\\n)^(1/2))))



