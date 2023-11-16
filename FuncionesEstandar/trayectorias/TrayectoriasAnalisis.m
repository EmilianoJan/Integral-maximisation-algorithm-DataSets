close all;
clear all;

%En este script se procede a calcular las trayectorias de los desplazamientos para difernetes
%algoritmos empleando la función a maximizar usual.


%genero la función akerley



xpuntos = linspace(-4, 4, 200);
ypuntos = linspace(-4, 4, 200);

[mapa] = Ackley(xpuntos, ypuntos);

figure
imagesc([-4, 4], [-4, 4], mapa)
grid on
xlabel('X')
ylabel('Y')
h = colorbar;
h.Label.String = "Ackley(X,Y)";
axis equal;


%Ploteo cada serie por separado.
% (0, BuscadorB, 1, "Integral", 0, "")
% (0, BuscadorE, 3, "Bayesian", 0, "")
% (0, BuscadorE, 3, "GlobalizedBoundedNelderMead", 0, "")
% (0, BuscadorE, 3, "ParticleSwarm", 0, "")
% (0,  3, "RandomSearch", 0, "")
% (0, BuscadorF, 7, "BigBung_BigCrunch", 0, "")
% (0, BuscadorF, 8, "Fireworks", 0, "")

% figure
% plot(Record0(:,1), Record0(:,2))
% hold on
% plot(Record0(1,1), Record0(1,2), 'o')
% plot(Record0(end,1), Record0(end,2), '*')
% xlabel('X')
% ylabel('Y')
% title('Integral')

% GenerarFigura(Record0, "Integral");
% GenerarFigura(Record1, "Bayesian");
% GenerarFigura(Record2, "GlobalizedBoundedNelderMead");
% GenerarFigura(Record3, "ParticleSwarm");
% GenerarFigura(Record4, "RandomSearch");
% GenerarFigura(Record5, "BigBung_BigCrunch");
% GenerarFigura(Record6, "Fireworks");


% load('SimTrayectoriasV2.mat');
% load('SimTrayectoriasV1.mat');
% 
% GenerarFiguraB(Record0, "Integral",mapa);
% GenerarFiguraB(Record1, "Bayesian",mapa);
% GenerarFiguraB(Record2, "Globalized Bounded Nelder Mead", mapa);
% GenerarFiguraB(Record3, "Particle Swarm", mapa);
% GenerarFiguraB(Record4, "Random Search", mapa);
% GenerarFiguraB(Record5, "Big Bung Big Crunch", mapa);
% GenerarFiguraB(Record6, "Fireworks", mapa);





load('SimTrayectoriasV3.mat');
GenerarFiguraB(Reg11, "IntegralMALO",mapa);
GenerarFiguraB(Reg11, "Integral",mapa);
GenerarFiguraB(Reg22, "Bayesian",mapa);
GenerarFiguraB(Reg33, "Glob. B.", mapa);
GenerarFiguraB(Reg44, "Par. Swarm", mapa);
GenerarFiguraB(Reg55, "Ran. Search", mapa);
GenerarFiguraB(Reg66, "Big Bang", mapa);
GenerarFiguraB(Reg77, "Fireworks", mapa);




























