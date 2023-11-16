close all;
clear all;

%inicialmente proceso las mediciones de distancia de las funciones usuales de maximización.

load('S2023_10_31Sim0.mat')


[Resultado] = ExtraerEstadisticosB(datos);


Inte = Resultado.dInteg 

Difer = Resultado.dDifere 

Bayesiano = Resultado.dBayesi 

Glob = Resultado.dGlobBoun

Particle = Resultado.dPartcle 

RandomSe = Resultado.dRanSea 

BigBan = Resultado.dBigBang

Fire = Resultado.dFireWo


Inte = Resultado.sInteg 

Difer = Resultado.sDifere 

Bayesiano = Resultado.sBayesi 

Glob = Resultado.sGlobBoun

Particle = Resultado.sPartcle 

RandomSe = Resultado.sRanSea 

BigBan = Resultado.sBigBang

Fire = Resultado.sFireWo

