close all;
clear all;

%En este script se calcula la media y varianza en la cantidad de desplazamientos de los diferentes 
%algortimos de alineación como para acotar los desplazamientos.

load('Simulaciones/Sim08_09__2023V0.mat');

SimN = length(Sim);

Sinte = zeros(SimN, 1);
SBayes = zeros(SimN, 1);
SGlobBounde = zeros(SimN, 1);
SParticle = zeros(SimN, 1);
SRandomSe = zeros(SimN, 1);
SBigBung = zeros(SimN, 1);
SFireworks = zeros(SimN, 1);
BackSlash = zeros(SimN, 1);

for i = 1:SimN
	
	
	Sinte(i) = Sim{i}.Integral(4);
	SBayes(i) = Sim{i}.Bayes(4);
	SGlobBounde(i) = Sim{i}.GlobBounde(4);
	SParticle(i) = Sim{i}.Particle(4);
	SRandomSe(i) = Sim{i}.RandomSe(4);
	SBigBung(i) = Sim{i}.BigBung(4);
	SFireworks(i) = Sim{i}.Fireworks(4);
	
	BackSlash(i) = Sim{i}.BackSlash;
	
end

%convierto el valor de backlash en distancia media
% BackSlash = BackSlash.*0.1; %paso las unidades a corrientes
% BackSlash = -7.17e-2 .*(BackSlash.^3)- 2.05e-4.*(BackSlash.^2)+ 4.8e-3.*(BackSlash); %posición en metros
% BackSlash = BackSlash.*1e6; %Posición en um.

%conversión nueva:
BackSlash = BackSlash * 490e-6; %dado que es lo que se agrega en la simulación.
BackSlash = BackSlash.*1e6; %paso a micrones


%proceso las simulaciones solo con Bayes.


sb = load('Simulaciones/Sim08_09__2023V1.mat');

SimN = length(sb.Sim);

%Sinte = zeros(SimN, 1);
bSBayes = zeros(SimN, 1);
% SGlobBounde = zeros(SimN, 1);
% SParticle = zeros(SimN, 1);
% SRandomSe = zeros(SimN, 1);
% SBigBung = zeros(SimN, 1);
% SFireworks = zeros(SimN, 1);
bBackSlash = zeros(SimN, 1);

for i = 1:SimN
	
	
	%Sinte(i) = Sim{i}.Integral(1);
	bSBayes(i) = sb.Sim{i}.Bayes(4);
% 	SGlobBounde(i) = Sim{i}.GlobBounde(1);
% 	SParticle(i) = Sim{i}.Particle(1);
% 	SRandomSe(i) = Sim{i}.RandomSe(1);
% 	SBigBung(i) = Sim{i}.BigBung(1);
% 	SFireworks(i) = Sim{i}.Fireworks(1);
	
	bBackSlash(i) = sb.Sim{i}.BackSlash;
	
end

bBackSlash = bBackSlash * 490e-6; %dado que es lo que se agrega en la simulación.
bBackSlash = bBackSlash.*1e6; %paso a micrones



gro1 = 1;
gro2 = 2;
MSize = 12;

%figure
Colores = transpose(parula(8));

figure
plot (bBackSlash, bSBayes,'--', 'linewidth', gro2, 'color', Colores(:,1))
hold on
plot (BackSlash, SBigBung , 'linewidth', gro2, 'color', Colores(:,2))
%plot (BackSlash, TDifere , 'linewidth', gro1)
plot (BackSlash, SFireworks , 'linewidth', gro2, 'color', Colores(:,3))
plot (BackSlash, SGlobBounde , 'linewidth', gro2, 'color', Colores(:,4))
plot (BackSlash, Sinte, '-o' , 'linewidth', gro2, 'color', Colores(:,5))
plot (BackSlash, SParticle , 'linewidth', gro2, 'color', Colores(:,6))
plot (BackSlash, SRandomSe, 'linewidth', gro2, 'color', Colores(:,7))


%set(gca,'ColorOrderIndex',1)

plot (bBackSlash, bSBayes, '.', 'MarkerSize' , MSize, 'MarkerEdgeColor', Colores(:,1))
plot (BackSlash, SBigBung , '.', 'MarkerSize' , MSize,'MarkerEdgeColor', Colores(:,2))
%plot (BackSlash, TDifere , '.', 'MarkerSize' , MSize)
plot (BackSlash, SFireworks , '.', 'MarkerSize' , MSize,'MarkerEdgeColor', Colores(:,3))
plot (BackSlash, SGlobBounde , '.', 'MarkerSize' , MSize,'MarkerEdgeColor', Colores(:,4))
plot (BackSlash, Sinte , '.', 'MarkerSize' , MSize,'MarkerEdgeColor', Colores(:,5))
plot (BackSlash, SParticle , '.', 'MarkerSize' , MSize,'MarkerEdgeColor', Colores(:,6))
plot (BackSlash, SRandomSe, '.', 'MarkerSize' , MSize,'MarkerEdgeColor', Colores(:,7))

grid on
grid minor

xlabel ('Mean statistical backlash [\mum]')
ylabel('Mean displacements')

%legend( 'Big Bung', 'Fireworks', 'Globalized Bounded', 'Integral', 'Particle Swarm', 'Random Search');
legend('Bayesian', 'Big Bung', 'Fireworks', 'Globalized Bounded', 'Integral', 'Particle Swarm', 'Random Search');
