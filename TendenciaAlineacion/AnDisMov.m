close all
clear all;

load('Simulaciones/Sim02_11__2023V0.mat')
%en este script se estudia la distancia de las trayectorias hasta hallar el máximo.
%para el problema del acople a fibra.

datsIM = Sim{1,10};


Inte = datsIM.Integral (end-1: end).*1000
Bayes = datsIM.Bayes (end-1: end).*1000
GlobB = datsIM.GlobBounde (end-1: end).*1000
Particle = datsIM.Particle (end-1: end).*1000
RandomS = datsIM.RandomSe (end-1: end).*1000
BigBung = datsIM.BigBung (end-1: end).*1000
Fire = datsIM.Fireworks (end-1: end).*1000

