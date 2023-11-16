close all;
clear all;

%genero una esfera

%[X,Y,Z] = sphere;
% figure
% surf(X,Y,Z)
% axis equal

nx = 30;

Z = zeros(nx,nx);
X =  zeros(nx,nx);
Y =  zeros(nx,nx);

for x = 1:nx
	for y = 1:nx
		zcal = -(x-nx/2)^2 -(y-nx/2)^2/8;
		Z(x,y) = zcal;
		X(x,y) = x;
		Y(x,y) = y;
	end
end
Z = Z./(max(max(zcal.*-1)));
X = X./nx;
Y = Y./nx;

figure
surf(X,Y,Z)
axis equal
xlabel('x')


%ya tengo mi superficie Calculada
dx = 1/nx;

Xtilt = atan( (Z(:,2:end) - Z(:,1:end-1))/dx) * 180/pi;

Ytilt = atan( (Z(2:end,:) - Z(1:end-1,:))/dx) * 180/pi;

Xtilt = Xtilt(2:end,:);
Ytilt = Ytilt(:,2:end);

% figure 
% imagesc([0 1], [0 1], Xtilt);
% 
% 
% figure 
% imagesc([0 1], [0 1], Ytilt);


%reconstruyo haciendo la inversa de las operaciones que ya hice.
Rx = tan(Xtilt.*pi/180);
Ry = tan(Ytilt.*pi/180);

[colx, filx ] = size(Rx);

Rzy = zeros(filx +1, colx+1);
Rzx = zeros(filx +1, colx+1);

%anda
% for x = 1:colx
% 	Rzx(x+1, 1:end-1) = Rzx(x, 1:end-1)  +transpose(Rx(:,x)*dx);
% end
% 
% for y = 1:colx
% 	Rzy(1:end-1, y+1) = Rzy(1:end-1, y)  +transpose(Ry(y,:)*dx);
% end


for x = 1:colx
	Rzx(x+1, 1:end-1) = Rzx(x, 1:end-1)  + Ry(x,:)*dx;
end

for y = 1:colx
	Rzy(1:end-1, y+1) = Rzy(1:end-1, y)  + Rx(:,y)*dx;
end

Rz = Rzx + Rzy;

% for x = 1:filx
% 	for y = 1:colx
% 		Rzx(x+1, y) = Rzx(x, y) -Rx(x,y)*dx;
% 	end
% end
% 
% for x = 1:filx
% 	for y = 1:colx
% 		Rzy(x, y+1) = Rzy(x, y) -Ry(x,y)*dx;
% 	end
% end
% 
% Rz = Rzx + Rzy;

% for x = 1:filx
% 	
% 	for y = 1:colx
% 		
% 		%Rz(x +1, y+1 ) = Rx(x,y)*dx + 2* Rz(x, y) + Ry(x,y)*dx;
% 		%Rz(x+1,y) = Rz(x,y) + Rx(x,y)*dx;
% 		%Rz(x,y+1) = Rz(x,y) + Ry(x,y)*dx;
% 		
% 		%zx = Rz(x,y) + Rx(x,y)*dx;
% 		
% 		a = Rx(x,y)*dx;
% 		b = Ry(x,y)*dx;
% 		
% 		Rz(x+1,y) = Rz(x,y) + Rx(x,y)*dx;
% 		Rz(x,y+1) = Rz(x,y) + Ry(x,y)*dx;
% 		
% 		Rz(x+1,y) = Rz(x,y) + Rx(x,y)*dx;
% 		Rz(x,y+1) = Rz(x,y) + Ry(x,y)*dx;
% 		
% 	end
% end 

Rz = Rz(1:end-1, 1:end-1);
X = X(1:end-1, 1:end-1);
Y = Y(1:end-1, 1:end-1);
figure
surf(X,Y,Rz)
xlabel('x')
axis equal
% figure
% surf(X,Y,Rzx)
% xlabel('x')
%axis equal



























