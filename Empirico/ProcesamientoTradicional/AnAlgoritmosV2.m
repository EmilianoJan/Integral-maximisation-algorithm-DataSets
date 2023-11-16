close all;
clear all;

%en este script se procesan todas las mediciones con los diferentes algoritmos de alineación.
%pero únicamente con la muestra curvada de bolilla medida sin los algoritmos correctores.
addpath('Codigos/') 

% %Mediciones al 21-09-2023 (con corrección por histéresis y muestra plana)
% SerieDatos = 1;
% BDfire = load('Mediciones/2023-09-21_Med_0'); %Mediciones deterministico fireworks sobre muestra plana
% BDBig = load('Mediciones/2023-09-20_Med_0'); %Mediciones deterministico Big bang sobre muestra plana
% BDBay = load('Mediciones/2023-09-19_Med_1'); %Mediciones probabilistico Bayes sobre muestra plana
% BDInt = load('Mediciones/2023-09-18_Med_3'); %Mediciones probabilistico Integral sobre muestra plana

%Mediciones al 26-09-2023
% BDBig = load('Mediciones/2023-09-20_Med_0'); %Mediciones deterministico Big bang sobre muestra plana
% BDBay = load('Mediciones/2023-09-19_Med_1'); %Mediciones probabilistico Bayes sobre muestra plana
% BDfire = load('Mediciones/2023-09-25_Med_4'); %Fireworks en bolilla
% BDInt = load('Mediciones/2023-09-26_Med_0'); %Integral en bolilla

%Mediciones al 04-10-2023
% BDBig = load('Mediciones/2023-10-02_Med_0'); %Mediciones deterministico Big bang sobre muestra plana
% BDBay = load('Mediciones/2023-09-19_Med_1'); %Mediciones probabilistico Bayes sobre muestra plana
% BDfire = load('Mediciones/2023-10-03_Med_0'); %Fireworks en bolilla
% BDInt = load('Mediciones/2023-09-26_Med_0'); %Integral en bolilla (este está OK)

%mediciones al 09-10-2023
SerieDatos = 2;
BDBig = load('Mediciones/2023-10-02_Med_0'); %Mediciones deterministico Big bang sobre esferica
BDBay = load('Mediciones/2023-10-04_Med_0'); %Mediciones probabilistico Bayes sobre esferica
BDfire = load('Mediciones/2023-10-03_Med_0'); %Fireworks en bolilla
BDInt = load('Mediciones/2023-10-05_Med_2'); %Integral en bolilla (este está OK)



[BFirew] = AnalisisEstadisticosAlineacion(BDfire.Documento.DifusividadMapa);
[BBigB] = AnalisisEstadisticosAlineacion(BDBig.Documento.DifusividadMapa);
[BBaye] = AnalisisEstadisticosAlineacion(BDBay.Documento.DifusividadMapa);
[BInte] = AnalisisEstadisticosAlineacion(BDInt.Documento.DifusividadMapa);



ColuB = [BInte.PropBuenas; BFirew.PropBuenas ; BBigB.PropBuenas; BBaye.PropBuenas];

DispeB= [BInte.Despersion; BFirew.Despersion ; BBigB.Despersion; BBaye.Despersion];


ErrB= [BInte.ErrorMedio; BFirew.ErrorMedio ; BBigB.ErrorMedio; BBaye.ErrorMedio];

%ErrBDispeLow = [(BInte.ErrorMedio -BInte.ErrorDesvio) ; (BFirew.ErrorMedio - BFirew.ErrorDesvio ); (BBigB.ErrorMedio- BBigB.ErrorDesvio); (BBaye.ErrorMedio - BBaye.ErrorDesvio)];
%ErrBDispeUp = [(BInte.ErrorMedio +BInte.ErrorDesvio) ; (BFirew.ErrorMedio + BFirew.ErrorDesvio ); (BBigB.ErrorMedio + BBigB.ErrorDesvio); (BBaye.ErrorMedio + BBaye.ErrorDesvio)];
%ErrBDispeLow(ErrBDispeLow<0) = 0;

ErrBDispeLow = [(BInte.ErrorDesvio) ; (BFirew.ErrorDesvio ); (BBigB.ErrorDesvio); (BBaye.ErrorDesvio)];
ErrBDispeUp = ErrBDispeLow;
ErrBDispeLow(ErrBDispeLow > ErrB) = ErrB(ErrBDispeLow > ErrB)*0.9;




X = categorical({'Integral','Fireworks','Big Bang','Bayesian'});
X = reordercats(X,{'Integral','Fireworks','Big Bang','Bayesian'});

gris1 = 0.8;
gris2 = 0.4;

Vec1 = [1 1 1]*gris1;
Vec2 = [1 1 1]*gris2;


%grafico los algoritmos con los tres criterios.

f = figure('Renderer', 'painters', 'Position', [10 10 250 250]);
refresh(f)
f.Position = [100 100 350*2 250];
refresh(f) 



y = [DispeB];
subplot(1,3,1)
hb = bar(X,y);
hb(1).FaceColor = Vec1;

hold on

%hb(2).FaceColor = Vec2;
grid on
grid minor
title('(a)')
%ylim=([min(min(y))-5 max(max(y))+5]);
ylim=([0 max(max(y))+5]);
set(gca,'YLim', ylim);
%legend('Type 1', 'Type 2', 'Location','northwest')
ylabel('Dispersal [%]')


y = [ErrB];
subplot(1,3,2)
hb = bar(X,y);
hb(1).FaceColor = Vec1;
%hb(2).FaceColor = Vec2;
hold on
er = errorbar(X,y,ErrBDispeLow,ErrBDispeUp);    
er.Color = [0 0 0];                            
er.LineStyle = 'none'; 

% text(1:length(y),y',num2str(y'),'vert','bottom','horiz','center'); 
% box off

grid on
grid minor
title('(b)')
%ylim=([min(min(y))-0.02 max(max(y))+0.02]);
%set(gca,'YLim', ylim);
%legend('Type 1', 'Type 2', 'Location','northwest')
ylabel('Fitting error')


subplot(1,3,3)
y = [ColuB];
hb = bar(X,y );
hb(1).FaceColor = Vec1;
%hb(2).FaceColor = Vec2;
grid on
grid minor
title('(c)')
%ylim=([min(min(y))-5 max(max(y))+5]);
%set(gca,'YLim', ylim);
%legend('Type 1', 'Type 2')
ylabel('Measurement rate [%]')

f.Position = [100 100 350*2 250];
refresh(f) 
print(gcf, char(strcat("ComparacionesCurvas", num2str(SerieDatos), ".png")) ,'-dpng' ,'-r300')

















