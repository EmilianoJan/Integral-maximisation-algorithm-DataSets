function [mapa] = Rosenbrok(VecX, VecY)
%rutina que partiendo con los vectores VecX y VecY genera la matriz con los valores finales

sali = zeros(length(VecX),length(VecY));

for x = 1:length(VecX)
	vx = VecX(x);
	for y = 1:length(VecY)
		vy = VecY(y);
		valor = 100*(vy - vx^2)^2 + (1-vx)^2;
		sali(x,y) = valor;
	end
end

mapa = sali;
end