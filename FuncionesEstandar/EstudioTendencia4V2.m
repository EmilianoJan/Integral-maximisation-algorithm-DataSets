close all;
clear all;

%En este script se procesan las simulaciones comparativas entre diferentes maximizadores
%en funciones usuales de maximización.


%load('S2023_08_11Sim0.mat');
%load('S2023_08_28Sim0.mat');

%load('S2023_09_11Sim0.mat');
load('S2023_09_11Sim1.mat'); %simulación de 50 iteraciones

% análisis considerando toda la cantidad de desplazamientos
Ackl = Datos(Datos(:,9) == 1, :);
Rast = Datos(Datos(:,9) == 2, :);
Rose = Datos(Datos(:,9) == 3, :);
Sphe = Datos(Datos(:,9) == 4, :);


AcklD = sqrt(Ackl(:,5).^2 + Ackl(:,6).^2);
RastD = sqrt(Rast(:,5).^2 + Rast(:,6).^2);
RoseD = sqrt((Rose(:,5)-1).^2 + (Rose(:,6)-1).^2); %estas simulaciones hay que mejorarlas dado que dá en un extremo del intervalo a evaluar
SpheD = sqrt(Sphe(:,5).^2 + Sphe(:,6).^2);

%recompongo los vectores de distancia según el tipo de buscador.
Indice = 1;
Integ = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 

Indice = 2;
Difere = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 

Indice = 3;
Bayesi = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 

Indice = 4;
GlobBoun = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 

Indice = 5;
Partcle = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 

Indice = 6;
RanSea = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 

Indice = 7;
BigBang = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 

Indice = 8;
FireWo = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 


%genero las curvas de histograma

% [Iv, Ic] = histcounts(Integ,'BinWidth',0.2 ,'normalization','cdf');
% [Bv, Bc] = histcounts(Bayesi,'BinWidth',0.2, 'normalization','cdf');
puntos = 150;
[Iv, Ic] = hist(Integ, puntos);
[Bv, Bc] =  hist(Bayesi, puntos);
figure
plot(Ic, Iv);
hold on
plot(Bc, Bv);

















