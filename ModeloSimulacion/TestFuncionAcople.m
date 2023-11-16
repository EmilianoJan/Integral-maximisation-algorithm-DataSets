close all;
clear all;

%Script que chequea el modelo de acople.

load('ModeloAcomple.mat')

alphaX = 0;
alphaY = 0;
d1x = 1e-6;
d2x = 1e-6;
d1y = 2e-6;
d2y = 2e-6;
f = 3e-3;
h = 0;
lambda = 660e-9;
k = 2*pi/(lambda);
w1 = 2e-6;

deltaFocus = 1e-8;

funcion(alphaX,alphaY,d1x,d2x,d1y,d2y,deltaFocus,f,h,k,w1)