close all;
clear all;

load('VectoresTiempo.mat')

figure
plot(BSerieInt)
hold on
plot(ASerieInt)

plot(ASerieBig)
plot(ASerieBay)
plot(ASerieFire)
%plot(ASerieInt)
plot(BSerieBig)
plot(BSerieBay)
plot(BSerieFire)
%plot(BSerieInt)


% 
% [mediaBig, ASerieBig] = CalculoTiempos(ADBig);
% [mediaBay, ASerieBay] = CalculoTiempos(ADBay);
% [mediaFire, ASerieFire] = CalculoTiempos(ADfire);
% [mediaInt, ASerieInt] = CalculoTiempos(ADInt);
% 
% [mediaBig, BSerieBig] = CalculoTiempos(BDBig);
% [mediaBay, BSerieBay] = CalculoTiempos(BDBay);
% [mediaFire, BSerieFire] = CalculoTiempos(BDfire);
% [mediaInt, BSerieInt] = CalculoTiempos(BDInt);


%le hago el polifit a todas y me quedo con el término de ordenada al origen

[AInt] = CalculoMedio(ASerieInt)
[ABig] = CalculoMedio(ASerieBig)
[ABay] = CalculoMedio(ASerieBay)
[AFire] = CalculoMedio(ASerieFire)

[BInt] = CalculoMedio(BSerieInt)
[BBig] = CalculoMedio(BSerieBig)
[BBay] = CalculoMedio(BSerieBay)
[BFire] = CalculoMedio(BSerieFire)