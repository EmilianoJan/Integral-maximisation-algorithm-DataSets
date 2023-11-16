close all;
clear all;

%En este script se procesan las simulaciones comparativas entre diferentes maximizadores
%en funciones usuales de maximización.

%load('Tam1_SimPrevia.mat'); %cargo la simulación previa. 
%load('Tam1_Completo.mat'); %Tiene la totalidad de las simulaciones, pero no son buenas

load('Tam3_BuenaPrueba.mat');

%Calculo la distancia euclidea entre el punto final obtenido y la posición del
%mínimo para cada tipo de función.

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




%calculo las distribuciones y las muestro


catx = repmat({'Integral'},1,length(Integ));
catx = [catx repmat({'Differental'},1,length(Difere))];
catx = [catx repmat({'Bayesian'},1,length(Bayesi))];
catx = [catx repmat({'Globalized Bounded'},1,length(GlobBoun))];
catx = [catx repmat({'Particle Swarm'},1,length(Partcle))];
catx = [catx repmat({'Random Search'},1,length(RanSea))];
catx = [catx repmat({'Big Bung'},1,length(BigBang))];
catx = [catx repmat({'Fireworks'},1,length(FireWo))];

y = transpose([Integ; Difere; Bayesi; GlobBoun; Partcle; RanSea; BigBang; FireWo]);




totCal = length(y); 
c= repmat([1], 1, totCal);


figure('Position',[100 100 700 411]);

g(1,1)=gramm('x',catx,'y',y,'color',c);

%g(1,1)=gramm('x',cars.Origin_Region,'y',cars.Horsepower,'color',cars.Cylinders,'subset',cars.Cylinders~=3 & cars.Cylinders~=5);

%g(1,1).stat_boxplot();
g(1,1).stat_violin('normalization','width');
%g(1,1).set_title('stat_boxplot()');
g.axe_property('XTickLabelRotation',30);
g.set_names('color','Origin','x','Minimization algorithm','y','Euclidian distance');
g.draw();

%print(gcf,'HistogramaBuscadores2.png','-dpng' ,'-r300')

