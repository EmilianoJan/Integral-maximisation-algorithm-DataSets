close all;
clear all;

%En este script se grafica la señal de reinyección en función del ángulo de incidencia. 

load('MedicionAlgoritmoV1.mat')


%primer serie
pos = TiltX(2:86,2);
rei = reinyeccion(7:(86+5),2);
rei(rei<0) = 1e-3;
rei(32) = 0.02;

% figure
% plot(pos, rei)


%hay que eliminar 40 y 41
vecbase = [pos, rei];
veca = vecbase (1:39, :);
vecb = vecbase (42:end, :);
vecb(:,1) = vecb(:,1) + 0.012;

figure 
plot(veca(:,1), veca(:,2), 'color' , [0 0 0] , 'linewidth', 2);
hold on
plot(vecb(:,1), vecb(:,2), 'color' , [0 0 0], 'linewidth', 2);
grid on
grid minor
xlabel('Controllable position')
ylabel('Measured signal')
%axis tight
xlim([-0.088 0.102])
ylim([0 0.15])













