close all;
clear all;

%Este sript se encarga de generar las figuras ordenadas para la distribución del archivo itinerario principal

addpath('Codigos/') 


load('Mediciones/2023-10-03_Med_0') % Fireworks sobre bolilla
%load('Mediciones/2023-10-02_Med_0') % Big bung sobre bolilla
%load('Mediciones/2023-09-28_Med_1')  % Otro más de big bang

%load('Mediciones/2023-09-21_Med_0') %Mediciones deterministico fireworks
%load('Mediciones/2023-09-20_Med_0') %Mediciones deterministico Big bang
%load('Mediciones/2023-09-19_Med_1') %Mediciones probabilistico Bayes
%load('Mediciones/2023-09-18_Med_3') %Mediciones probabilistico Integral
%load('Mediciones/2023-08-01_Med_0.mat') %mediciones para Pagnola sobre polimeros
%load('Mediciones/2023-06-23_Med_1.mat') % A4140 impacto 4
%load('Mediciones/2023-06-22_Med_0.mat') % A4140 impacto 4
%load('Mediciones/2023-06-15_Med_3.mat') % A4140 impacto 4
%load('Mediciones/2023-06-14_Med_3.mat') % A4140 impacto 4 MALA medicion datos incompletos
%load('Mediciones/2023-06-12_Med_1.mat')
%load('Mediciones/2023-06-08_Med_0.mat') %mediciones en lo general malas sobre A4140 Impacto 4
%load('Mediciones/2023-06-07_Med_9.mat')
%load('Mediciones/2023-06-05_Med_6.mat') %muchas mediciones, varias parecen aceptables
%load('Mediciones/2023-06-01_Med_3.mat') %A4140 Impacto 4 (3 sets) Malas
%load('Mediciones/2023-05-10_Med_0.mat')
%load('Mediciones/2023-04-27_Med_0') %Mediciones en zona sueper rugosa.
%load('Mediciones/2023-04-26_Med_0') %Mediciones sobre muy alta rugosidad (no resuelve bien)
%load('Mediciones/2023-04-25_Med_0') %Varias mediciones pero que parecen bastante malas (va a paper subindice 1)
%load('Mediciones/2023-04-24_Med_1.mat') %Zona bien pulida, lija 1000 (va a paper)
%load('Mediciones/2023-04-24_Med_0.mat') %no carga
%load('Mediciones/2023-04-18_Med_0.mat')
%load('Mediciones/2023-04-17_Med_0.mat')
%load('Mediciones/2023-04-13_Med_0.mat')
%load('Mediciones/2023-04-11_Med_1.mat')
%load('Mediciones/2023-04-04_Med_3.mat')
%load('Mediciones/2023-04-03_Med_1.mat') %Corregir intervalos
%load('Mediciones/2023-03-23_Med_0.mat')
%load('Mediciones/2023-03-22_Med_1.mat')
%load('Mediciones/2023-03-03_Med_0.mat')
%load('Mediciones/2023-03-04_Med_0.mat') %Pulido espejo referencia (va a paper)
%load('Mediciones/2023-03-05_Med_0.mat')
%load('Mediciones/2023-03-06_Med_1.mat')
%load('Mediciones/2023-03-02_Med_1.mat') %Problemas en el procesamiento
%load('Mediciones/2023-03-01_Med_0.mat')
%load('Mediciones/2023-02-28_Med_0.mat') %Superficie curvada bolilla (va a paper la supertficie)
%load('Mediciones/2023-02-27_Med_0.mat')
%load('Mediciones/2023-02-26_Med_0.mat')
%load('Mediciones/2023-02-25_Med_0.mat')
%load('Mediciones/2023-02-08_Med_2.mat') %Hay problemas para el procesamiento
%load('Mediciones/2023-01-30_Med_0.mat') %medición paper A4140
%load('Mediciones/2023-01-11_Med_2.mat')
%load('Mediciones/2023-01-10_Med_1.mat')


%IDifu_Fig = [0.04, 0.12]; %intervalo de visualización de las figuras
IDifu_Fig = [0.019, 0.035]; %Acero 304
%IDifu_Fig = [0.02, 0.075]; %otros aceros
%IDifu_Fig = [0.0025, 0.0075]; %polimeros

Tramo = 1; %establece el intervalo de mediciones que se va a estudiar
OmitirIniciales = 0;
GenFigFile = 1; %Establece si se generan los archivos de las figuras 1 = si, 0 = no
MaxErrorChi = 0.10;

CriterioDifu = 0; 
%		0 = Promedio entre mediciones
%		1 = Valor máximo entre mediciones
%		2 = Valor mínimo entre mediciones
%		3 = Moda entre valores

datos = Documento.DifusividadMapa;
datos = datos((OmitirIniciales+1):end, :);
tammapa = CalculaTamMapa(datos);
tammapaP = tammapa ;
rangoMapaPosta = max(datos(:,2)) - min(datos(:,2)) ;
rangoMapa = rangoMapaPosta + 0.001;



mapaRein = zeros(tammapaP,tammapaP);
mapaTiltX = zeros(tammapaP,tammapaP);
mapaTiltY = zeros(tammapaP,tammapaP);
mapaBuenaMed = zeros(tammapaP,tammapaP);
mapaReinBuena = zeros(tammapaP,tammapaP);
mDifuA = zeros(tammapaP,tammapaP);
mDifuB = zeros(tammapaP,tammapaP);
mDifuC = zeros(tammapaP,tammapaP);
mDiErA = zeros(tammapaP,tammapaP);
mDiErB = zeros(tammapaP,tammapaP);
mDiErC = zeros(tammapaP,tammapaP);
mFocus = zeros(tammapaP,tammapaP);
mErroAju = zeros(tammapaP,tammapaP);
mFotoVal = zeros(tammapaP,tammapaP);
mPPrueba = zeros(tammapaP,tammapaP);
Mtiempos  = zeros(tammapaP,tammapaP);
VarDifu = zeros(tammapaP,tammapaP);

indiceAux = floor(tammapa/2) +1 ;
PosX = round((datos(:,2)+ rangoMapa/2 )  ./(rangoMapa/(tammapa-1))) + 1;
PosY = round((datos(:,3)+ rangoMapa/2 )  ./(rangoMapa/(tammapa-1))) + 1;


%calculado con referencia a fotografía caracterizada
yintervalo = [-96.13; 96.13]*(rangoMapaPosta/0.2);
xintervalo = [-96.13; 96.13]*(rangoMapaPosta/0.2);

[filas, columnasArchivo] = size(datos);

SignalExtra = 'Fototérmica [mV]';

switch columnasArchivo
	case 162
		ReinVC = 11;
		TiempMedi = 14;
		Fototermica = 89;
		tiltXVC = 56;
		tiltyVC = 62;
		focusVC = 70;
		difuAVC = 103;
		errAVC = 107;
		difuBVC = 120;
		errBVC = 124;
		difuCVC = 137;
		errCVC = 141;
		HazPrueba = 96;
		
	case 165 %formato AlFast_FotoThermV4_5.tmc
		ReinVC = 11; %
		TiempMedi = 14; %
		Fototermica = 89; %
		tiltXVC = 56; %
		tiltyVC = 62; %
		focusVC = 70; %
		difuAVC = 106; %
		errAVC = 110; %
		difuBVC = 123; %
		errBVC = 127; %
		difuCVC = 140; %
		errCVC = 144; %
		HazPrueba = 99;
		
	case 154 %formato Tab_AlFast_FotoThermV4_5Polimero.tmc
		ReinVC = 11; %
		TiempMedi = 14; %
		Fototermica = 89; %
		tiltXVC = 56; %
		tiltyVC = 62; %
		focusVC = 70; %
		difuAVC = 95; %
		errAVC = 99; %
		difuBVC = 112; %
		errBVC = 116; %
		difuCVC = 129; %
		errCVC = 133; %
		HazPrueba = 92;
		
	case 157
		ReinVC = 11;
		TiempMedi = 14;
		Fototermica = 0;
		tiltXVC = 60;
		tiltyVC = 66;
		focusVC = 43;
		difuAVC = 108;
		errAVC = 112;
		difuBVC = 125;
		errBVC = 129;
		difuCVC = 142;
		errCVC = 146;
		HazPrueba = 105;
		
	case 167
		%posible archivo de linea
		ReinVC = 11;
		TiempMedi = 14;
		Fototermica = 0;
		tiltXVC = 60;
		tiltyVC = 66;
		focusVC = 74;
		HazPrueba = 105;
		difuAVC = 108;
		errAVC = 112;
		difuBVC = 125;
		errBVC = 129;
		difuCVC = 142;
		errCVC = 146;
	
	case 468
		%posible archivo de linea
		disp('Medicion con submatrices, solo se muestra las alineadas')
		ReinVC = 11;
		TiempMedi = 14;
		Fototermica = 0;
		tiltXVC = 57;
		tiltyVC = 63;
		focusVC = 71;
		HazPrueba = 102;
		difuAVC = 105;
		errAVC = 109;
		difuBVC = 122;
		errBVC = 126;
		difuCVC = 139;
		errCVC = 143;
	otherwise
		error('No se reconoce el tipo de archivo')
end

%Hasta le día 2023-03-21 CREO
% ReinVC = 11;
% ReinyeccionFinal = 94;
% BuenaMed = 4;
% tiltXVC = 60;
% tiltyVC = 66;
% focusVC = 74;
% difuAVC = 108;
% errAVC = 112;
% difuBVC = 125;
% errBVC = 129;
% difuCVC = 142;
% errCVC = 146;

%Desde el día 2023-03-22





IniP = (Tramo-1)*tammapa^2 +1 ;
FinP = (Tramo)*tammapa^2;

for e = IniP:FinP
	x = PosX(e);
	y = PosY(e);
	mapaRein(x,y) = datos(e,ReinVC);
	mapaBuenaMed(x,y) = datos(e,4);
	if Fototermica ~= 0
		mFotoVal(x,y) = datos(e,Fototermica);
	end
	mPPrueba(x,y) = datos(e,HazPrueba);
	%filtro por buenas mediciones
	%if (datos(e,4) == 1)
		
		mapaTiltX(x,y) = datos(e,tiltXVC); %9
		mapaTiltY(x,y) = datos(e,tiltyVC); %10
		mapaReinBuena(x,y) = datos(e,ReinVC);
		mFocus(x,y) = datos(e,focusVC);
		Mtiempos(x,y) = datos(e, TiempMedi);
		
		if(datos(e,errAVC) < MaxErrorChi)
			if (datos(e,difuAVC) < 0.15)
				mDifuA(x,y) = datos(e,difuAVC);
				mErroAju(x,y) = datos(e,errAVC);
				mDiErA(x,y) = datos(e,errAVC);
			end 
		end
		if(datos(e,errBVC) < MaxErrorChi)
			if (datos(e,difuBVC) < 0.15)
				mDifuB(x,y) = datos(e,difuBVC);
				mDiErB(x,y) = datos(e,errBVC);
			end 
		end
		if(datos(e,errCVC) < MaxErrorChi)
			if (datos(e,difuCVC) < 0.15)
				mDifuC(x,y) = datos(e,difuCVC);
				mDiErC(x,y) = datos(e,errCVC);
			end 
		end
		
	%end
end

mapaRein(mapaRein(:,:) == 0) = NaN;
mapaReinBuena(mapaReinBuena(:,:) == 0) = NaN;
mapaTiltX(mapaTiltX(:,:) == 0) = NaN;
mapaTiltY(mapaTiltY(:,:) == 0) = NaN;
mDifuA(mDifuA(:,:) == 0) = NaN;
mDifuB(mDifuB(:,:) == 0) = NaN;
mDifuC(mDifuC(:,:) == 0) = NaN;
mDiErA(mDiErA(:,:) == 0) = NaN;
mDiErB(mDiErB(:,:) == 0) = NaN;
mDiErC(mDiErC(:,:) == 0) = NaN;
mFocus(mFocus(:,:) == 0) = NaN;
mFocus = mFocus.*6.56e-3*100*1e3;
mFocus(mFocus(:,:) < -200) = NaN;
mErroAju(mErroAju(:,:) == 0) = NaN;
mFotoVal(mFotoVal(:,:) == 0) = NaN;
mPPrueba(mPPrueba(:,:) == 0) = NaN;
Mtiempos(Mtiempos(:,:) == 0) = NaN;
Mtiempos = Mtiempos - min(min(Mtiempos));

%calculo el mapa promediado de difusividad térmica.
mProme = zeros(tammapaP,tammapaP);
mErPro = zeros(tammapaP,tammapaP);

for x = 1:tammapaP
	for y = 1:tammapaP
		
		switch CriterioDifu
			case 0 %0 = Promedio entre mediciones
				cuenta = 0;
				avar = 0;
				erocu = 0;
				valSe = 0;
				if isnan(mDifuA(x,y)) == 0
					avar = avar  + mDifuA(x,y);
					erocu = erocu + mDiErA(x,y);
					valSe = [valSe; mDifuA(x,y)];
					cuenta = cuenta +1;
				end

				if isnan(mDifuB(x,y)) == 0
					avar = avar  + mDifuB(x,y);
					erocu = erocu + mDiErB(x,y);
					valSe = [valSe; mDifuB(x,y)];
					cuenta = cuenta +1;
				end

				if isnan(mDifuC(x,y)) == 0
					avar = avar  + mDifuC(x,y);
					erocu = erocu + mDiErC(x,y);
					valSe = [valSe; mDifuC(x,y)];
					cuenta = cuenta +1;
				end

				if cuenta == 0 
					mProme(x,y) = NaN;
					mErPro(x,y) = NaN;
					VarDifu(x,y) = NaN;
				else
					mProme(x,y) = avar/cuenta;
					mErPro(x,y) = erocu/cuenta;
					valSe = valSe(2:end);
					VarDifu(x,y) = std(valSe);
				end
				
			case 1 % 1 = Valor máximo entre mediciones
				dvectab = [mDifuA(x,y), mDifuB(x,y), mDifuC(x,y)];
				evectab = [mDiErA(x,y), mDiErB(x,y), mDiErC(x,y)];
				evectab = evectab(~isnan(dvectab));
				dvectab = dvectab(~isnan(dvectab));
				if isempty( dvectab ) 
					mProme(x,y) = NaN;
					mErPro(x,y) = NaN;
				else
					[dval, indice] = max(dvectab);
					mProme(x,y) = dval;
					mErPro(x,y) = evectab(indice);
				end
			case 2 % 2 = Valor mínimo entre mediciones
				dvectab = [mDifuA(x,y), mDifuB(x,y), mDifuC(x,y)];
				evectab = [mDiErA(x,y), mDiErB(x,y), mDiErC(x,y)];
				evectab = evectab(~isnan(dvectab));
				dvectab = dvectab(~isnan(dvectab));
				if isempty( dvectab ) 
					mProme(x,y) = NaN;
					mErPro(x,y) = NaN;
				else
					[dval, indice] = min(dvectab);
					mProme(x,y) = dval;
					mErPro(x,y) = evectab(indice);
				end
				
			case 3 % 3 = Moda entre valores
				
				
				
		end 
	end
end

TamHaz = 2.2e-6/2;
serieColor = 0;
NombreCampo = 'Difusividad promedio [cm^2/s]';
CantPixels = 850;
tamPixel = (96.13e-6*2*(0.01/0.1))/CantPixels;
DireccionImagen = 'AreaRecorte1.png';

figure %Mapa promedio
%subplot(1,3,1)
imagescnan(TransformarAImagen(mProme),0, xintervalo, yintervalo)
xlabel('Pos Y [um]')
ylabel('Pos X [um]')
a = colorbar;
a.Label.String = 'Difusividad promedio [cm^2/s]';
caxis(IDifu_Fig);
%saveas(gcf,'Imagenes/Fig1.png','-dpng' ,'-r60')
if GenFigFile == 1
	print(gcf,'Imagenes/Fig1.png','-dpng' ,'-r94')
end 
xintervalob = (xintervalo - xintervalo(1)).*1e-6;
yintervalob = (yintervalo - yintervalo(1)).*1e-6;

figure  %Interpolado
%subplot(1,3,3)
PlotGaussiano (mProme, xintervalob, yintervalob,TamHaz, 50, NombreCampo)
caxis(IDifu_Fig);
AlphaVal = 0.5;
if GenFigFile == 1
	print(gcf,'Imagenes/Fig2.png','-dpng' ,'-r94')
end

mPromeb = mProme;
reshape(mPromeb,1,[]); 
mPromeb = mPromeb(~isnan(mPromeb));

mDif = mean(mPromeb);
stdDif = std(mPromeb);
Disper = (stdDif/mDif)*100;

figure %Distribución difusividad
histogram(mPromeb, 15)
title (['D_{media} = ' , num2str(round(mDif, 3)) , '+/-', num2str(round(stdDif, 3)) , '[cm^2/s]  Disp = ' , num2str(round(Disper, 0)) , '%' ]);
grid on
grid minor
xlabel('Difusividad [cm^2/s]')
if GenFigFile == 1
	print(gcf,'Imagenes/Fig3.png','-dpng' ,'-r94')
end

mErPro(mErPro(:,:) > 0.5) = 0.5;
figure %Chi cuadrado
%subplot(1,3,1)
imagescnan(TransformarAImagen(mErPro),0, xintervalo, yintervalo)
xlabel('Pos Y [um]')
ylabel('Pos X [um]')
a = colorbar;
a.Label.String = 'Error Chi^2 promedio';
if GenFigFile == 1
	print(gcf,'Imagenes/Fig4.png','-dpng' ,'-r94')
end

figure
imagescnan(TransformarAImagen(mapaTiltX),0, xintervalo, yintervalo)
xlabel('Pos Y [um]')
ylabel('Pos X [um]')
a = colorbar;
a.Label.String = 'Tilt X [º]';
if GenFigFile == 1
	print(gcf,'Imagenes/Fig5.png','-dpng' ,'-r94')
end

figure
imagescnan(TransformarAImagen(mapaTiltY),0, xintervalo, yintervalo)
xlabel('Pos Y [um]')
ylabel('Pos X [um]')
a = colorbar;
a.Label.String = 'Tilt Y [º]';
if GenFigFile == 1
	print(gcf,'Imagenes/Fig6.png','-dpng' ,'-r94')
end

if Fototermica ~= 0
	mFotoVal(mFotoVal(:,:) > 5) = 5;
	figure
	imagescnan(TransformarAImagen(mFotoVal),0, xintervalo, yintervalo)
	xlabel('Pos Y [um]')
	ylabel('Pos X [um]')
	a = colorbar;
	a.Label.String = 'Fototérmica [mV]';
	if GenFigFile == 1
		print(gcf,'Imagenes/Fig7.png','-dpng' ,'-r94')
	end
	
	figure
	MapaHisto(mFotoVal, "Foto", "", 'Fototérmica [mV]')
	if GenFigFile == 1
		print(gcf,'Imagenes/Fig8.png','-dpng' ,'-r94')
	end
end 


figure
imagescnan(TransformarAImagen(mPPrueba),0, xintervalo, yintervalo)
xlabel('Pos Y [um]')
ylabel('Pos X [um]')
a = colorbar;
a.Label.String = 'Tension Laser Prueba [V]';
if GenFigFile == 1
	print(gcf,'Imagenes/Fig9.png','-dpng' ,'-r94')
end

figure
MapaHisto(mPPrueba, "Foto", "[V]", 'Tension Laser Prueba [V]')
if GenFigFile == 1
	print(gcf,'Imagenes/Fig10.png','-dpng' ,'-r94')
end

%mapa de dispersiones
figure
imagescnan(TransformarAImagen(VarDifu),0, xintervalo, yintervalo)
xlabel('Pos Y [um]')
ylabel('Pos X [um]')
a = colorbar;
a.Label.String = 'Dispersion en difusividad [cm^2/s]';
if GenFigFile == 1
	print(gcf,'Imagenes/Fig16.png','-dpng' ,'-r94')
end


%realizo la reconstrucción fototérmica.

[Xpos, Ypos, Zpos] = Gen3DPlot (mapaTiltX, mapaTiltY, xintervalo, yintervalo);
if GenFigFile == 1
	print(gcf,'Imagenes/Fig12.png','-dpng' ,'-r94')
end

%realizo el estudio de la altura vs la difusividad.
ZVec = reshape(Zpos,[],1);
DifVec = reshape(mProme,[],1);
DifVecTotal = DifVec;

ZVec = ZVec(~isnan(DifVec));
DifVec = DifVec(~isnan(DifVec));


PlotSerieTendencia(ZVec, DifVec, 'Altura [\mum]', 'Difusividad [cm^2/s]')
if GenFigFile == 1
	print(gcf,'Imagenes/Fig13.png','-dpng' ,'-r94')
end


figure
imagescnan(TransformarAImagen(Zpos),0, xintervalo, yintervalo)
xlabel('Pos Y [um]')
ylabel('Pos X [um]')
a = colorbar;
a.Label.String = 'Altura [\mum]';

if GenFigFile == 1
	print(gcf,'Imagenes/Fig14.png','-dpng' ,'-r94')
end


%genero el archivo stl
if GenFigFile == 1
	surf2stl('Imagenes/Salida.stl',Xpos, Ypos, Zpos,'ascii')
end


%Hasta acá el script fototérmico



%calculo diferentes estadísticos con la información que tengo. La idea es después guardar esa información
%como una línea de texto.

[DMed, DDes, DDis] = EstadisticosMapa(mProme);
[EMed, EDes, EDis] = EstadisticosMapa(mErPro);
[TxMed, TxDes, TxDis] = EstadisticosMapa(mapaTiltX);
[TyEMed, TyEDes, TyEDis] = EstadisticosMapa(mapaTiltY);


%calculo vector temporal: 
IniP = (Tramo-1)*tammapa^2 +1 ;
FinP = (Tramo)*tammapa^2;
TempoMed = Documento.DifusividadMapa(IniP:FinP, TiempMedi) ;
TempoMed = TempoMed(~isnan(TempoMed));
DeltaT = TempoMed(2:end) - TempoMed(1:end-1);
TMed = mean(DeltaT);
TDes = std(DeltaT);


%Hago print de los numeros
prueba = num2str([DMed, DDes, DDis, EMed, EDes, EDis, TxMed, TxDes, TxDis, TyEMed, TyEDes, TyEDis, TMed, TDes]);
%prueba = num2str([DMed, DDes, DDis]);
sali = strrep(prueba, '  ', ' ');
sali = strrep(sali, '  ', ' ');
sali = strrep(sali, '  ', ' ');
sali = strrep(sali, '  ', ' ');
sali = strrep(sali, '  ', ' ');
sali = strrep(sali, '  ', ' ');
sali = strrep(sali, '  ', ' ');
sali = strrep(sali, '  ', ' ');
sali = strrep(sali, ' ', '; ')


%calculo la tasa de aciertos.
TasaAli = length(DifVec) / length( DifVecTotal)




%Inicio de los mapas foto:

hayMapa = sum(strcmp(fieldnames(Documento), 'FotoMapa'));
if hayMapa == 1
	datos = Documento.FotoMapa;
	tammapa = CalculaTamMapa(datos);
	tammapaP = tammapa ;
	rangoMapaPosta = max(datos(:,2)) - min(datos(:,2)) ;
	rangoMapa = rangoMapaPosta + 0.001;
	mapaRein = zeros(tammapaP,tammapaP);
	indiceAux = floor(tammapa/2) +1 ;
	PosX = round((datos(:,2)+ rangoMapa/2 )  ./(rangoMapa/(tammapa-1))) + 1;
	PosY = round((datos(:,3)+ rangoMapa/2 )  ./(rangoMapa/(tammapa-1))) + 1;

	%calculado con referencia a fotografía caracterizada
	yintervalo = [-96.13; 96.13]*(rangoMapaPosta/0.2);
	xintervalo = [-96.13; 96.13]*(rangoMapaPosta/0.2);

	IniP = (Tramo-1)*tammapa^2 +1 ;
	FinP = (Tramo)*tammapa^2;

	for e = IniP:FinP
		x = PosX(e);
		y = PosY(e);
		if (x > 0) && (x<tammapa+1) && (y > 0) && (y<tammapa+1)
			mapaRein(x,y) = datos(e,4);
		end 
	end
	mapaRein(mapaRein(:,:) == 0) = NaN;

	figure
	imagescnan(TransformarAImagen(mapaRein),0, xintervalo, yintervalo)
	xlabel('Pos Y [um]')
	ylabel('Pos X [um]')
	a = colorbar;
	a.Label.String = 'Reinyeccion (Foto) [V]';
	if GenFigFile == 1
		print(gcf,'Imagenes/Fig11.png','-dpng' ,'-r94')
	end
end 
























