close all;
clear all;

%este script reconstruye 3D la superficie.
%load('EstudioAngularMapa.mat')
load('EstudioAngularMapaBolilla.mat')





Xtilt = mapaTiltX;
Ytilt = mapaTiltY;
Rx = tan(Xtilt.*(pi/180));
Ry = tan(Ytilt.*(pi/180));
[colx, filx ] = size(Rx);
Rzy = zeros(filx +1, colx+1);
Rzx = zeros(filx +1, colx+1);

[nx, ny] = size(Xtilt);
X =  zeros(nx+1,nx+1);
Y =  zeros(nx+1,nx+1);

dx = (xintervalo(2) -xintervalo(1))/nx;
dy = (yintervalo(2) -yintervalo(1))/ny;
for x = 1:(nx+1)
	for y = 1:(ny +1)
		X(x,y) = x*dx;
		Y(x,y) = y*dy;
	end
end
X = X-(xintervalo(2) -xintervalo(1))/2;
Y = Y-(yintervalo(2) -yintervalo(1))/2;


for x = 1:colx
	Rzx(x+1, 1:end-1) = Rzx(x, 1:end-1)  + Ry(x,:)*dx;
end

for y = 1:colx
	Rzy(1:end-1, y+1) = Rzy(1:end-1, y)  + Rx(:,y)*dx;
end

Rz = Rzx + Rzy;
Rz = Rz(1:end-1, 1:end-1);
X = X(1:end-1, 1:end-1);
Y = Y(1:end-1, 1:end-1);
Rz = Rz - min(min(Rz));
figure
surf(X,Y,Rz,'LineStyle','none'); %,'FaceColor','interp')
xlabel('x')
axis equal