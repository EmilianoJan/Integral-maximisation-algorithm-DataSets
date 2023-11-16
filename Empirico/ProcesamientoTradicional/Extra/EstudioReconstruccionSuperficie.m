close all;
clear all;

%en este script se busca reconstruir las superficies medidas mediante un estudio de las 
%inclinaciones del haz sobre la muestra.

load('EstudioAngularMapa.mat')

%mapaTiltX
%mapaTiltY

[fi, co ] = size (mapaTiltX);

dx = (xintervalo(2) - xintervalo(1))/co;
dy = (yintervalo(2) - yintervalo(1))/fi;

supA = zeros(fi,co+1);

for x = 1:co
	supA(:,x+1) = supA(:,x) + dx*sin(mapaTiltX(:,x).*pi/180);
end

supA = supA(:,2:end);

Z = supA;

[X,Y] = meshgrid((1:co)*dx,(1:fi)*dy);

figure
%imagescnan(TransformarAImagen(supA),0, xintervalo, yintervalo)
surf(X,Y,Z)
xlabel('Pos Y [um]')
ylabel('Pos X [um]')
zlabel('Altura [um]')

% figure
% imagescnan(TransformarAImagen(mapaRein),0, xintervalo, yintervalo)
% xlabel('Pos Y [um]')
% ylabel('Pos X [um]')
% a = colorbar;
% a.Label.String = 'Reinyeccion (Foto) [V]';




