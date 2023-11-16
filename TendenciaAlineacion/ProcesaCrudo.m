close all;
clear all;

%Este script se encarga de calcular todos los estadísticos 

addpath('Codigos/') 


% dire = "PCLabo/2023-04-26/Med_1";
% CantF = 20;


% dire = "PCLabo/2023-04-25/Med_2";
% CantF = 12;

% dire = "Remoto/2023-04-26/Med_0";
% CantF = 6;

% dire = "PCLabo/2023-04-27/Med_0";
% CantF = 15;

%dire = "Simulaciones/2023-08-10";
%CantF = 50;

%dire = "Simulaciones/2023-08-31";
%CantF = 9;

% dire = "Simulaciones/2023-09-01";
% CantF = 19;

%dire = "Simulaciones/2023-09-04"; %Todas las simulaciones excepto Bayes
%CantF = 50;

%dire = "Simulaciones/2023-09-05"; %Simulaciones con bayes.
%CantF = 10;


%dire = "Simulaciones/2023-09-08"; %Todas las simulaciones excepto Bayes
%CantF = 50;

% dire = "Simulaciones/2023-09-08Bayes"; %únicamente la simulación de Bayes.
% CantF = 10;

%dire = "Simulaciones/2023-10-31"; %únicamente la simulación de Bayes.
%dire = "Simulaciones/2023-10-31B"; %únicamente la simulación de Bayes.
dire = "Simulaciones/2023-11-02"; %Todas las simulaciones
CantF = 20;

%Tabb = readtable('PCLabo/2023-04-26/Med_1/TABLA1.csv', 'Delimiter', ';', 'HeaderLines',1);

Sim{1} = 0;
indice = 1;
for i = 0:CantF
	final = strcat(dire, '/TABLA', num2str(i), '.csv' );
	Tabb = readtable(final, 'Delimiter', ';', 'HeaderLines',1);
	
	%[Buscador, Media, Varianza, TamHaz, Desplazamientos, DesplaSTD]
	[Buscador, Media, Varianza, TamHaz, Desplazamientos, DesplaSTD, MediaDistancia, STDDistancia]= EstadisticosSimples(Tabb);
	Integral = zeros(1,7); %por columnas Media, Varianza, TamHaz, DesplazamientosMEAN, DesplazamientosSTD
	Bayes = zeros(1,7);
	GlobBounde = zeros(1,7);
	Particle = zeros(1,7);
	RandomSe = zeros(1,7);
	BigBung = zeros(1,7);
	Fireworks = zeros(1,7);
	
	
	[Integral] = Reconversion(Integral, Media, Varianza, TamHaz, Desplazamientos, DesplaSTD, MediaDistancia, STDDistancia, 0);
	[Bayes] = Reconversion(Bayes, Media, Varianza, TamHaz, Desplazamientos, DesplaSTD, MediaDistancia, STDDistancia, 1);
	[GlobBounde] = Reconversion(GlobBounde, Media, Varianza, TamHaz, Desplazamientos, DesplaSTD, MediaDistancia, STDDistancia, 4);
	[Particle] = Reconversion(Particle, Media, Varianza, TamHaz, Desplazamientos, DesplaSTD, MediaDistancia, STDDistancia, 3);
	[RandomSe] = Reconversion(RandomSe, Media, Varianza, TamHaz, Desplazamientos, DesplaSTD, MediaDistancia, STDDistancia, 2);
	[BigBung] = Reconversion(BigBung, Media, Varianza, TamHaz, Desplazamientos, DesplaSTD, MediaDistancia, STDDistancia, 5);
	[Fireworks] = Reconversion(Fireworks, Media, Varianza, TamHaz, Desplazamientos, DesplaSTD, MediaDistancia, STDDistancia,6);
	
	
	
	Integral = Integral(2:end,:);
	Bayes = Bayes(2:end,:);
	GlobBounde = GlobBounde(2:end,:);
	Particle = Particle(2:end,:);
	RandomSe = RandomSe(2:end,:);
	BigBung = BigBung(2:end,:);
	Fireworks = Fireworks(2:end,:);
	
	Resultado.Crudo = Tabb;
	Resultado.Integral = Integral;
	Resultado.Bayes = Bayes;
	Resultado.GlobBounde = GlobBounde;
	Resultado.Particle = Particle;
	Resultado.RandomSe = RandomSe;
	Resultado.BigBung = BigBung;
	Resultado.Fireworks = Fireworks;
	
	Resultado.BackSlash = table2array(Tabb(1,17));
	Sim{indice} = Resultado;
	indice = indice +1;
end


AnalisisSimulacion(Sim);




