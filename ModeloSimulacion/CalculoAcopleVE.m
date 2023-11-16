close all;
clear all;
%en este script se calcula la función de acople completa

syms ax bx ay by qx1 qx2 cqx2 k alphax xo;


phix = sqrt(pi/ax)*exp(bx^2/(4*ax));

Tx = phix*conj(phix);

Ty = subs(Tx , [ax bx], [ay, by]);


etax = bx^2/(4*ax);



etaxR = subs(etax, [bx ax], [1i*k*(alphax - xo/cqx2) 1i*k*(1/cqx2 - 1/qx1)]);

%etaxR = subs(etax, [bx], [1i*k*(alphax - xo/cqx2)]);
%etaxR = subs(etaxR, [ax], [1i*k*(1/cqx2 - 1/qx1)]);













