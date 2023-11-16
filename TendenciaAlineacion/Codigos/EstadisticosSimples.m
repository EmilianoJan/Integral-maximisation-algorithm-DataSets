function [Buscador, Media, Varianza, TamHaz, Desplazamientos, DesplSTD, MediaDistancia, STDDistancia] = EstadisticosSimples(Tabla)
%Rutina que calcula los estadísticos básicos de todos los bucadores y genera vectores de salida
%en los cuales cada fila representa un buscador.
% Buscador = Vector con el índice de buscador
% Media = media de la reinyección para cada buscador
% Varianza = varianza de la reinyección para cada buscador
% TamHaz = Tamaño medio del haz sobre la muestra para cada buscador.
%
% Indices de los buscadores:
% Integral = 0
% Bayesiano = 1
% RandomSearch = 2
% ParticleSwarm = 3
% GlobalizedBoundedNelderMead = 4
% BigBung_BigCrunch = 5
% Fireworks = 6

Buscador = transpose(0:6);
Media = zeros(1,6);
Varianza = zeros(1,6);
TamHaz = zeros(1,6);
Desplazamientos = zeros(1,6);
DesplSTD = zeros(1,6);
MediaDistancia = zeros(1,6);
STDDistancia = zeros(1,6);
indice = 1;

tabb = table2array( Tabla(:,[13,2,5,6,12]));

for i = 0:6
	sel = tabb(tabb(:,1) == (indice-1), [2,3,4,5]);
	Media(indice) = mean(sel(:,1));
	Varianza(indice) = std(sel(:,1));
	TamHaz(indice) = mean(sel(:,2));
	Desplazamientos(indice) = mean(sel(:,3));
	DesplSTD(indice) = std(sel(:,3));
	MediaDistancia(indice) = mean(sel(:,4));
	STDDistancia(indice) = std(sel(:,4));
	indice = indice +1;
end

end