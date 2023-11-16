close all;
clear all;

%En este script se procesan las simulaciones comparativas entre diferentes maximizadores
%en funciones usuales de maximización.

%En el script se procesan para diferentes cantidades de pasos.


%load('S2023_08_11Sim0.mat');
%load('S2023_08_28Sim0.mat');

%load('S2023_09_11Sim0.mat'); %simulaciones parciales

%load('S2023_09_11Sim1.mat'); %simulación de 50 iteraciones
%load('S2023_09_11Sim2.mat'); %simulación de 200 iteraciones
%load('S2023_09_11Sim3.mat'); %simulación de 500 iteraciones
load('S2023_09_12Sim1.mat'); %sim 200
%load('VariasSecuenciasV1.mat'); %Simulacinnes variando la cantidad de iteraciones 

%Calculo la distancia euclidea entre el punto final obtenido y la posición del
%mínimo para cada tipo de función.


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


[val, minInd] = max(Partcle);
Partcle = [Partcle(1: minInd-1); Partcle(minInd+1: end)];
%[val, minInd] = max(Partcle);
%Partcle = [Partcle(1: minInd-1); Partcle(minInd+1: end)];
%calculo las distribuciones y las muestro


catx = repmat({'Integral'},1,length(Integ));
%catx = [catx repmat({'Differental'},1,length(Difere))];
catx = [catx repmat({'Bayesian'},1,length(Bayesi))];
catx = [catx repmat({'GBNM'},1,length(GlobBoun))];
catx = [catx repmat({'Particle Swarm'},1,length(Partcle))];
catx = [catx repmat({'Random Search'},1,length(RanSea))];
catx = [catx repmat({'Big Bang'},1,length(BigBang))];
catx = [catx repmat({'Fireworks'},1,length(FireWo))];

catx = transpose(catx);


y = transpose([Integ; Bayesi; GlobBoun; Partcle; RanSea; BigBang; FireWo]);

y = transpose(y);


totCal = length(y); 
c= repmat([1], 1, totCal);


figure('Position',[100 100 650 300]);

g(1,1)=gramm('x',catx,'y',y,'color',c);

%g(1,1).facet_grid(catx,[]);
%g(1,1).geom_raster();

%g(1,1).facet_grid(catx,[]);
%g(1,1).stat_density();
%g.axe_property('YTickLabelRotation',30);

%strip.text.y.left;
%strip.text.y = element_text(angle = 180);
%g(1,1)=gramm('x',catx,'subset',y);

%g(1,1)=gramm('x',cars.Origin_Region,'y',cars.Horsepower,'color',cars.Cylinders,'subset',cars.Cylinders~=3 & cars.Cylinders~=5);

g(1,1).stat_boxplot('outliers', false);
%g(1,1).stat_boxplot();
%g(1,1).stat_violin('normalization', 'width'); % 'count'); % 'area'); %,'width');

%g(1,1).facet_grid(catx,[]);
%g(1,1).stat_density();
%g.set_names('x','Origin','y','Horsepower','color','# Cyl');
%g(1,1).set_title('stat_boxplot()');
g.set_names('color','Origin','x','Minimization algorithm','y','Euclidian distance');

g(1,1).coord_flip();

g(1,1).axe_property('TickDir','out','XGrid','on','Ygrid','on','GridColor',[0.5 0.5 0.5]);

g.draw();



print(gcf,'HistogramaBuscadores4.png','-dpng' ,'-r300')


%calculo algunos estadísticos copados.

ProbInte =sum(Integ< 0.05)/ length(Integ)

ProbFire =sum(FireWo< 0.05)/ length(FireWo)


%figura detalle

Integ = Integ(Integ<0.06);


catx = repmat({'Integral'},1,length(Integ));
%catx = [catx repmat({'Differental'},1,length(Difere))];
% catx = [catx repmat({'Bayesian'},1,length(Bayesi))];
% catx = [catx repmat({'GBNM'},1,length(GlobBoun))];
% catx = [catx repmat({'Particle Swarm'},1,length(Partcle))];
% catx = [catx repmat({'Random Search'},1,length(RanSea))];
% catx = [catx repmat({'Big Bang'},1,length(BigBang))];
% catx = [catx repmat({'Fireworks'},1,length(FireWo))];
catx = transpose(catx);

y = transpose(Integ);

y = transpose(y);


totCal = length(y); 
c= repmat([1], 1, totCal);


figure('Position',[100 100 300 300]);

g(1,1)=gramm('x',catx,'y',y,'color',c);

g(1,1).stat_boxplot('outliers', false);

g.set_names('color','Origin','x','Minimization algorithm','y','Euclidian distance');

g(1,1).coord_flip();

g(1,1).axe_property('TickDir','out','XGrid','on','Ygrid','on','GridColor',[0.5 0.5 0.5]);

g.draw();

print(gcf,'HistogramaBuscadores4Detalle.png','-dpng' ,'-r300')























