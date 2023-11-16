function [mapa] = Rastring(VecX, VecY)
%rutina que partiendo con los vectores VecX y VecY genera la matriz con los valores finales

sali = zeros(length(VecX),length(VecY));

for x = 1:length(VecX)
	vx = VecX(x);
	for y = 1:length(VecY)
		vy = VecY(y);
		valor = 2 + vx^2- cos(2*pi*vx) + vy^2- cos(2*pi*vy);
		sali(x,y) = valor;
	end
end

mapa = sali;
end