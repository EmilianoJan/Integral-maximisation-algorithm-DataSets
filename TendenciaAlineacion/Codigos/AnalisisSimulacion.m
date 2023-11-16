function AnalisisSimulacion(Sim )
%rutina que grafica el procesamiento de las simulaciones viendo como es la tendencia de los 
%desplazamientos 


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
% BackSlash = BackSlash.*0.1; %paso las unidades a corrientes
% BackSlash = -7.17e-2 .*(BackSlash.^3)- 2.05e-4.*(BackSlash.^2)+ 4.8e-3.*(BackSlash); %posición en metros
% BackSlash = BackSlash.*1e6; %Posición en um.

%conversión nueva:
BackSlash = BackSlash * 490e-6; %dado que es lo que se agrega en la simulación.
BackSlash = BackSlash.*1e6; %paso a micrones


gro1 = 1;
gro2 = 2;
MSize = 16;

%figure
Colores = transpose(parula(7));

figure
plot (BackSlash, SBayes, 'linewidth', gro2, 'color', Colores(:,1))
hold on
plot (BackSlash, SBigBung , 'linewidth', gro2, 'color', Colores(:,2))
%plot (BackSlash, TDifere , 'linewidth', gro1)
plot (BackSlash, SFireworks , 'linewidth', gro2, 'color', Colores(:,3))
plot (BackSlash, SGlobBounde , 'linewidth', gro2, 'color', Colores(:,4))
plot (BackSlash, Sinte , 'linewidth', gro2, 'color', Colores(:,5))
plot (BackSlash, SParticle , 'linewidth', gro2, 'color', Colores(:,6))
plot (BackSlash, SRandomSe, 'linewidth', gro2, 'color', Colores(:,7))


%set(gca,'ColorOrderIndex',1)

plot (BackSlash, SBayes, '.', 'MarkerSize' , MSize, 'MarkerEdgeColor', Colores(:,1))
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
ylabel('Normalized power reinjection')

legend('Bayesian', 'Big Bung', 'Fireworks', 'Globalized Bounded', 'Integral', 'Particle Swarm', 'Random Search');


end