function [mapa] = Ackley(VecX, VecY)
%rutina que partiendo con los vectores VecX y VecY genera la matriz con los valores finales

sali = zeros(length(VecX),length(VecY));

for x = 1:length(VecX)
	vx = VecX(x);
	for y = 1:length(VecY)
		vy = VecY(y);
		valor = -20*exp(-0.2*sqrt(0.5*(vx^2+ vy^2)))- exp(0.5*(cos(2*pi*vx)*cos(2*pi*vy))) + exp(1) +20;
		sali(x,y) = valor;
	end
end

mapa = sali;
end