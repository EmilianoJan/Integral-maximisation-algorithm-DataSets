close all;
clear all;

%En este script se procesan las simulaciones comparativas entre diferentes maximizadores
%en funciones usuales de maximización.


%load('S2023_08_11Sim0.mat');
%load('S2023_08_28Sim0.mat');

%load('S2023_09_11Sim0.mat');
%load('S2023_09_11Sim1.mat'); %simulación de 50 iteraciones

load('VariasSecuenciasV1.mat');

% análisis considerando toda la cantidad de desplazamientos
Ackl = Datos(Datos(:,9) == 1, :);
Rast = Datos(Datos(:,9) == 2, :);
Rose = Datos(Datos(:,9) == 3, :);
Sphe = Datos(Datos(:,9) == 4, :);


AcklD = sqrt(Ackl(:,5).^2 + Ackl(:,6).^2);
RastD = sqrt(Rast(:,5).^2 + Rast(:,6).^2);
RoseD = sqrt((Rose(:,5)-1).^2 + (Rose(:,6)-1).^2); %estas simulaciones hay que mejorarlas dado que dá en un extremo del intervalo a evaluar
SpheD = sqrt(Sphe(:,5).^2 + Sphe(:,6).^2);

%recompongo los vectores de distancia según el tipo de buscador.
Indice = 1;
Integ = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 

Indice = 2;
Difere = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 

Indice = 3;
Bayesi = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 

Indice = 4;
GlobBoun = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 

Indice = 5;
Partcle = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 

Indice = 6;
RanSea = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 

Indice = 7;
BigBang = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 

Indice = 8;
FireWo = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 


% catx = repmat({'Integral'},1,length(Integ));
% %catx = [catx repmat({'Differental'},1,length(Difere))];
% catx = [catx repmat({'Bayesian'},1,length(Bayesi))];
% catx = [catx repmat({'Globalized Bounded'},1,length(GlobBoun))];
% catx = [catx repmat({'Particle Swarm'},1,length(Partcle))];
% catx = [catx repmat({'Random Search'},1,length(RanSea))];
% catx = [catx repmat({'Big Bung'},1,length(BigBang))];
% catx = [catx repmat({'Fireworks'},1,length(FireWo))];
% 
% catx = transpose(catx);
% 
% y = transpose([Integ; Bayesi; GlobBoun; Partcle; RanSea; BigBang; FireWo]);
% y = transpose(y);
% 
% totCal = length(y); 
% c= repmat([1], 1, totCal);
% 
% figure('Position',[100 100 650 300]);
% g(1,1)=gramm('x',catx,'y',y,'color',c);
% g(1,1).stat_boxplot();
% g.set_names('color','Origin','x','Minimization algorithm','y','Euclidian distance');
% 
% g(1,1).coord_flip();
% g.draw();

%-----------------------------------------------------------------------------------
%realizo el análisis particular para cada cantidad de desplazamientos.


[P(1)] = MediaValores(Datos(1:960,:));
[P(2)] = MediaValores(Datos(961:960*2,:));
[P(3)] = MediaValores(Datos(960*2+1:960*3,:));
[P(4)] = MediaValores(Datos(960*3+1:960*4,:));
[P(5)] = MediaValores(Datos(960*4+1:960*5,:));


figure

for se = 3:8
	xpunto = zeros(5,1);
	ypunto = zeros(5,1);
	for i = 1:5
		xpunto(i) = P(i).MediaDespla;
		ypunto(i) = P(i).Vec(se);
	end
	plot(xpunto, ypunto);
	hold on
end

xpunto = zeros(5,1);
ypunto = zeros(5,1);
for i = 1:5
	xpunto(i) = P(i).MediaDespla;
	ypunto(i) = P(i).Vec(1);
end

plot(xpunto, ypunto);
xlabel('Evaluaciones')
ylabel('Distancia media')

Salida.Vec(1) = mean(Integ);
Salida.Vec(2) = mean(Difere);
Salida.Vec(3) = mean(Bayesi);
Salida.Vec(4) = mean(GlobBoun);
Salida.Vec(5) = mean(Partcle);
Salida.Vec(6) = mean(RanSea);
Salida.Vec(7) = mean(BigBang);
Salida.Vec(8) = mean(FireWo);




legend('Bayesian', 'Globalized Bounded', 'Particle Swarm', 'Random Search' , 'Big Bung',  'Fireworks', 'Integral');








































