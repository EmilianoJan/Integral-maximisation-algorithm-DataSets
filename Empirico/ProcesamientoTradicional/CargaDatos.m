close all;
clear all;

%este script se encarga de generar los archivos necesarios para el procesamiento de las figuras medidas
%mediante AnGenerico.m

%carpeta = '2023-10-04/Med_0'; %Bayes
carpeta = '2023-10-05/Med_2'; %Integral
%carpeta = '2023-10-03/Med_0'; % Fireworks sobre bolilla
%carpeta = '2023-10-02/Med_0'; % Big bung sobre bolilla
%carpeta = '2023-09-28/Med_1';  % Otro más de big bang
%carpeta = '2023-09-26/Med_0'; % Integral en bolilla
%carpeta = '2023-09-25/Med_4'; % Fireworks en bolilla
%carpeta = '2023-09-21/Med_0'; %Mediciones deterministico fireworks
%carpeta = '2023-09-20/Med_0'; %Mediciones deterministico Big bang
%carpeta = '2023-09-19/Med_1'; %Mediciones probabilistico Bayes
%carpeta = '2023-09-18/Med_3'; %Mediciones probabilistico Integral
%carpeta = '2023-08-01/Med_0'; %Mediciones de polimero de Pagnola
%carpeta = '2023-06-26/Med_1'; % 4140 zona sin tratar
%carpeta = '2023-06-23/Med_1'; % 4140 impacto 4
%carpeta = '2023-06-22/Med_0'; % 4140 impacto 4
%carpeta = '2023-06-15/Med_3'; % 4140 impacto 4
%carpeta = '2023-06-14/Med_3'; % 4140 impacto 4
%carpeta = '2023-06-12/Med_1'; 
%carpeta = '2023-06-08/Med_0'; 
%carpeta = '2023-06-07/Med_9'; 
%carpeta = '2023-06-05/Med_6'; 
%carpeta = '2023-06-01/Med_3'; %inicio A4140 Impacto 4
%carpeta = '2023-05-10/Med_0';
%carpeta = '2023-05-09/Med_0';
%carpeta = '2023-05-08/Med_2';
%carpeta = '2023-05-04/Med_0';
%carpeta = '2023-04-27/Med_0';
%carpeta = '2023-04-26/Med_0';
%carpeta = '2023-04-25/Med_0';
%carpeta = '2023-04-24/Med_1';
%carpeta = '2023-04-24/Med_0';
%carpeta = '2023-04-18/Med_0';
%carpeta = '2023-04-17/Med_0';
%carpeta = '2023-04-13/Med_0';
%carpeta = '2023-04-11/Med_1';
%carpeta = '2023-04-04/Med_3';
%carpeta = '2023-04-03/Med_1';
%carpeta = '2023-03-27/Med_4';
% carpeta = '2023-03-23/Med_0';
% carpeta = '2023-03-22/Med_1';
% carpeta = '2023-03-21/Med_1';
% carpeta = '2023-03-18/Med_0';
% carpeta = '2023-03-06/Med_0';
% carpeta = '2023-03-06/Med_1';
% carpeta = '2023-03-05/Med_0';
% carpeta = '2023-03-04/Med_0';
% carpeta = '2023-03-03/Med_0';
% carpeta = '2023-03-02/Med_0';
% carpeta = '2023-03-02/Med_1';
% carpeta = '2023-03-01/Med_0';
% carpeta = '2023-02-28/Med_0';
% carpeta = '2023-02-27/Med_0';
% carpeta = '2023-02-26/Med_0';
% carpeta = '2023-02-25/Med_0';
% carpeta = '2023-02-08/Med_2';
% carpeta = '2023-02-01/Med_2';
% carpeta = '2023-01-30/Med_0';
% carpeta = '2023-01-11/Med_2';
% carpeta = '2023-01-10/Med_1';
%carpeta = '2023-02-08/Med_2';
%carpeta = '2023-02-08/Med_2';
%carpeta = '2023-02-01/Med_2';
%carpeta = '2023-01-30/Med_0';
%carpeta = '2023-01-11/Med_2';
%carpeta = '2023-01-10/Med_1';

archivos = dir(carpeta);


%final = strcat(dire, '/TABLA', num2str(i), '.csv' );
%Tabb = readtable(final, 'Delimiter', ';', 'HeaderLines',1);ç



indice = 0;

Documento.Nombre = carpeta;

%recorro todos los archivos
for i = 3:length(archivos)
	nombreArch = archivos(i).name;
	desina = lower(nombreArch(end-3:end));
	if desina == '.csv'
		%es uno de los archivos que hay que cargar
		final = strcat(carpeta, '/', nombreArch);
		tabcal = readtable(final, 'Delimiter', ',', 'HeaderLines',1);
		avar = str2double(table2array(tabcal));
		[filas, columnas] = size(avar);
		
		if columnas > 15
			Documento.DifusividadMapa = avar;
			Documento.TablaDifusividad = tabcal;
			Documento.DifuNombre = nombreArch;
		else
			Documento.FotoMapa = avar;
			Documento.TablaFoto = tabcal;
			Documento.FotoNombre = nombreArch;
		end
		
		indice = indice +1;
	end
	
end

fileSali = strcat('Mediciones/', strrep(carpeta,'/','_'));

save (fileSali, 'Documento')