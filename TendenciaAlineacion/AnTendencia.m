close all;
clear all;

addpath('Codigos/') 

%simulaciones que estudian el efecto de incrementar el backlash estadístico en el sistema óptico. 

load('Simulaciones/2023-08-10/Sim2023_08_10_S0.mat');
SimN = 51;

% load('Simulaciones/2023-08-31/Sim2023_08_31_S0.mat');
% SimN = 9;


% Integral = zeros(1,4); %por columnas Media, Varianza, TamHaz, Desplazamientos
% Bayes = zeros(1,4);
% GlobBounde = zeros(1,4);
% Particle = zeros(1,4);
% RandomSe = zeros(1,4);
% BigBung = zeros(1,4);
% Fireworks = zeros(1,4);



Sinte = zeros(SimN, 1);
SBayes = zeros(SimN, 1);
SGlobBounde = zeros(SimN, 1);
SParticle = zeros(SimN, 1);
SRandomSe = zeros(SimN, 1);
SBigBung = zeros(SimN, 1);
SFireworks = zeros(SimN, 1);
BackSlash = zeros(SimN, 1);

for i = 1:SimN
	
	
	Sinte(i) = Sim{i}.Integral(1);
	SBayes(i) = Sim{i}.Bayes(1);
	SGlobBounde(i) = Sim{i}.GlobBounde(1);
	SParticle(i) = Sim{i}.Particle(1);
	SRandomSe(i) = Sim{i}.RandomSe(1);
	SBigBung(i) = Sim{i}.BigBung(1);
	SFireworks(i) = Sim{i}.Fireworks(1);
	
	BackSlash(i) = Sim{i}.BackSlash;
	
end

%convierto el valor de backlash en distancia media

BackSlash = BackSlash.*0.1; %paso las unidades a corrientes

BackSlash = -7.17e-2 .*(BackSlash.^3)- 2.05e-4.*(BackSlash.^2)+ 4.8e-3.*(BackSlash); %posición en metros

BackSlash = BackSlash.*1e6; %Posición en um.

gro1 = 1;
gro2 = 2;
MSize = 16;

figure
plot (BackSlash, SBayes, 'linewidth', gro1)
hold on
plot (BackSlash, SBigBung , 'linewidth', gro1)
%plot (BackSlash, TDifere , 'linewidth', gro1)
plot (BackSlash, SFireworks , 'linewidth', gro1)
plot (BackSlash, SGlobBounde , 'linewidth', gro2)
plot (BackSlash, Sinte , 'linewidth', gro2)
plot (BackSlash, SParticle , 'linewidth', gro2)
plot (BackSlash, SRandomSe, 'linewidth', gro2)


set(gca,'ColorOrderIndex',1)

plot (BackSlash, SBayes, '.', 'MarkerSize' , MSize)
plot (BackSlash, SBigBung , '.', 'MarkerSize' , MSize)
%plot (BackSlash, TDifere , '.', 'MarkerSize' , MSize)
plot (BackSlash, SFireworks , '.', 'MarkerSize' , MSize)
plot (BackSlash, SGlobBounde , '.', 'MarkerSize' , MSize)
plot (BackSlash, Sinte , '.', 'MarkerSize' , MSize)
plot (BackSlash, SParticle , '.', 'MarkerSize' , MSize)
plot (BackSlash, SRandomSe, '.', 'MarkerSize' , MSize)

grid on
grid minor

xlabel ('Mean statistical backlash [\mum]')
ylabel('Normalized power reinjection')


legend('Bayesian', 'Big Bung', 'Fireworks', 'Globalized Bounded', 'Integral', 'Particle Swarm', 'Random Search');

%print(gcf,'ReinyeccionVsBackSlashV2.png','-dpng' ,'-r300')













