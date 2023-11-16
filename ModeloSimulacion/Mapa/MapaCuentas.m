close all;
clear all;




frecsx = (1./rand(1,10)).^2;
ampsx = rand(1,10)*3;

frecsy = 1./rand(1,10);
ampsy = rand(1,10)*2.3;

[X,Y] = meshgrid(1:0.1:10,1:0.1:20);

Z = sin(X./frecsx(1)).*1 + cos(Y./frecsy(1)).*1;
indice = 1;
for i = 1:6
	Z = Z + sin(X./frecsx(indice)).*ampsx(indice) + cos(Y./frecsy(indice)).*ampsy(indice);
	indice = indice +1;
end



figure
s = surf(X,Y,Z)
s.EdgeColor = 'none';
