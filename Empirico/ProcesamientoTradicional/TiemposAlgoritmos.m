close all;
clear all;

%en este script se calculan los tiempos de simulación de cada algoritmo. 
%Debería dar que el integral es el más rápido


addpath('Codigos/') 

% %Mediciones al 21-09-2023 (con corrección por histéresis y muestra plana)
% SerieDatos = 1;
ADfire = load('Mediciones/2023-09-21_Med_0'); %Mediciones deterministico fireworks sobre muestra plana
ADBig = load('Mediciones/2023-09-20_Med_0'); %Mediciones deterministico Big bang sobre muestra plana
ADBay = load('Mediciones/2023-09-19_Med_1'); %Mediciones probabilistico Bayes sobre muestra plana
ADInt = load('Mediciones/2023-09-18_Med_3'); %Mediciones probabilistico Integral sobre muestra plana

[mediaBig, ASerieBig] = CalculoTiempos(ADBig);
[mediaBay, ASerieBay] = CalculoTiempos(ADBay);
[mediaFire, ASerieFire] = CalculoTiempos(ADfire);
[mediaInt, ASerieInt] = CalculoTiempos(ADInt);

%Mediciones al 26-09-2023
% BDBig = load('Mediciones/2023-09-20_Med_0'); %Mediciones deterministico Big bang sobre muestra plana
% BDBay = load('Mediciones/2023-09-19_Med_1'); %Mediciones probabilistico Bayes sobre muestra plana
% BDfire = load('Mediciones/2023-09-25_Med_4'); %Fireworks en bolilla
% BDInt = load('Mediciones/2023-09-26_Med_0'); %Integral en bolilla

%Mediciones al 04-10-2023
% BDBig = load('Mediciones/2023-10-02_Med_0'); %Mediciones deterministico Big bang sobre muestra plana
% BDBay = load('Mediciones/2023-09-19_Med_1'); %Mediciones probabilistico Bayes sobre muestra plana
% BDfire = load('Mediciones/2023-10-03_Med_0'); %Fireworks en bolilla
% BDInt = load('Mediciones/2023-09-26_Med_0'); %Integral en bolilla (este está OK)

%mediciones al 09-10-2023
% SerieDatos = 2;
BDBig = load('Mediciones/2023-10-02_Med_0'); %Mediciones deterministico Big bang sobre esferica
BDBay = load('Mediciones/2023-10-04_Med_0'); %Mediciones probabilistico Bayes sobre esferica
BDfire = load('Mediciones/2023-10-03_Med_0'); %Fireworks en bolilla
BDInt = load('Mediciones/2023-10-05_Med_2'); %Integral en bolilla (este está OK)

[mediaBig, BSerieBig] = CalculoTiempos(BDBig);
[mediaBay, BSerieBay] = CalculoTiempos(BDBay);
[mediaFire, BSerieFire] = CalculoTiempos(BDfire);
[mediaInt, BSerieInt] = CalculoTiempos(BDInt);
