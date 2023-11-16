close all;
clear all;

%en este script se generan las imágenes de las funciones estándar 
%(como para no emplear las imagenes de la wikipedia)
%Corresponde a la figura 2 del escrito

%Intervalo de evaluación de -4 a 4

xpuntos = linspace(-4, 4, 200);
ypuntos = linspace(-4, 4, 200);

[ack] = Ackley(xpuntos, ypuntos);
[ras] = Rastring(xpuntos, ypuntos);
[shp] = Shpere(xpuntos, ypuntos);
[ros] = Rosenbrok(xpuntos, ypuntos);

tamPunto = 12;

figure 
subplot(2,2,1)
	GenerarFigura('(a) Rastring', ras)
	plot(0,0 , '.', 'color' , [1 0 0],'MarkerSize', tamPunto)
	ylabel('Y')
subplot(2,2,2)
	GenerarFigura('(b) Ackley', ack)
	plot(0,0 , '.', 'color' , [1 0 0], 'MarkerSize', tamPunto)
subplot(2,2,3)
	GenerarFigura('(c) Shpere', shp)
	plot(0,0 , '.', 'color' , [1 0 0], 'MarkerSize', tamPunto)
	ylabel('Y')
	xlabel('X')
subplot(2,2,4)
	GenerarFigura('(d) Rosenbrok', ros)
	plot(1,1 , '.', 'color' , [1 0 0], 'MarkerSize', tamPunto)
	xlabel('X')






