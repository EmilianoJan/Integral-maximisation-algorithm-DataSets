close all;
clear all;

%En este script se procesan las simulaciones comparativas entre diferentes maximizadores
%en funciones usuales de maximización.

%En el script se procesan para diferentes cantidades de pasos.


load('S2023_08_11Sim0.mat');
%load('S2023_08_28Sim0.mat');

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


figure('Position',[100 100 900 411]);

g(1,1)=gramm('x',catx,'y',y,'color',c);

%g(1,1)=gramm('x',cars.Origin_Region,'y',cars.Horsepower,'color',cars.Cylinders,'subset',cars.Cylinders~=3 & cars.Cylinders~=5);

%g(1,1).stat_boxplot();
g(1,1).stat_violin('normalization', 'count'); % 'area'); %,'width');
%g(1,1).set_title('stat_boxplot()');
g.axe_property('XTickLabelRotation',30);
g.set_names('color','Origin','x','Minimization algorithm','y','Euclidian distance');
g.draw();

print(gcf,'HistogramaBuscadores2.png','-dpng' ,'-r300')



%analizo la convergencia en función de la cantidad de desplazamientos. 


[Despl1] = ExtraerEstadisticos(Datos(1:8000, :));

[Despl2] = ExtraerEstadisticos(Datos(8001:16000, :));

[Despl3] = ExtraerEstadisticos(Datos(16001:24000, :));

[Despl4] = ExtraerEstadisticos(Datos(24001:end, :));

cantDespla = [128, 256, 384, 512];

TBayesi = [Despl1.BayesiM; Despl2.BayesiM; Despl3.BayesiM; Despl4.BayesiM];
TBigBang = [Despl1.BigBangM; Despl2.BigBangM; Despl3.BigBangM; Despl4.BigBangM];
TDifere = [Despl1.DifereM; Despl2.DifereM; Despl3.DifereM; Despl4.DifereM];
TFireWo = [Despl1.FireWoM; Despl2.FireWoM; Despl3.FireWoM; Despl4.FireWoM];
TGlobBoun = [Despl1.GlobBounM; Despl2.GlobBounM; Despl3.GlobBounM; Despl4.GlobBounM];
TInteg = [Despl1.IntegM; Despl2.IntegM; Despl3.IntegM; Despl4.IntegM];
TPartcle = [Despl1.PartcleM; Despl2.PartcleM; Despl3.PartcleM; Despl4.PartcleM];
TRanSea = [Despl1.RanSeaM; Despl2.RanSeaM; Despl3.RanSeaM; Despl4.RanSeaM];



%Integ; Difere; ; GlobBoun; Partcle; RanSea; BigBang; FireWo
%Bayesi BigBang Difere FireWo GlobBoun Integ Partcle RanSea

gro1 = 1;
gro2 = 2;

MSize = 14;


figure
plot (cantDespla, TBayesi, 'linewidth', gro1)
hold on
plot (cantDespla, TBigBang , 'linewidth', gro1)
plot (cantDespla, TDifere , 'linewidth', gro1)
plot (cantDespla, TFireWo , 'linewidth', gro1)
plot (cantDespla, TGlobBoun , 'linewidth', gro2)
plot (cantDespla, TInteg , 'linewidth', gro2)
plot (cantDespla, TPartcle , 'linewidth', gro2)
plot (cantDespla, TRanSea, 'linewidth', gro2)


set(gca,'ColorOrderIndex',1)

plot (cantDespla, TBayesi, '.', 'MarkerSize' , MSize)
plot (cantDespla, TBigBang , '.', 'MarkerSize' , MSize)
plot (cantDespla, TDifere , '.', 'MarkerSize' , MSize)
plot (cantDespla, TFireWo , '.', 'MarkerSize' , MSize)
plot (cantDespla, TGlobBoun , '.', 'MarkerSize' , MSize)
plot (cantDespla, TInteg , '.', 'MarkerSize' , MSize)
plot (cantDespla, TPartcle , '.', 'MarkerSize' , MSize)
plot (cantDespla, TRanSea, '.', 'MarkerSize' , MSize)


grid on
xlabel('Displacements')
ylabel ('Distance')

legend('Bayesian', 'Big Bung', 'Differental', 'Fireworks', 'Globalized Bounded', 'Integral', 'Particle Swarm', 'Random Search');

print(gcf,'Tendencia medición.png','-dpng' ,'-r300')




