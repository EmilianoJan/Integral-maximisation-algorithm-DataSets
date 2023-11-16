close all;
clear all;

%en este script se procesan todas las mediciones con los diferentes algoritmos de alineación.
addpath('Codigos/') 


Dfire = load('Mediciones/2023-09-21_Med_0'); %Mediciones deterministico fireworks sobre muestra plana
DBig = load('Mediciones/2023-09-20_Med_0'); %Mediciones deterministico Big bang sobre muestra plana
DBay = load('Mediciones/2023-09-19_Med_1'); %Mediciones probabilistico Bayes sobre muestra plana
DInt = load('Mediciones/2023-09-18_Med_3'); %Mediciones probabilistico Integral sobre muestra plana


BDBig = load('Mediciones/2023-09-20_Med_0'); %Mediciones deterministico Big bang sobre muestra plana
BDBay = load('Mediciones/2023-09-19_Med_1'); %Mediciones probabilistico Bayes sobre muestra plana

BDfire = load('Mediciones/2023-09-25_Med_4'); %Fireworks en bolilla
BDInt = load('Mediciones/2023-09-26_Med_0'); %Integral en bolilla


[Firew] = AnalisisEstadisticosAlineacion(Dfire.Documento.DifusividadMapa);
[BigB] = AnalisisEstadisticosAlineacion(DBig.Documento.DifusividadMapa);
[Baye] = AnalisisEstadisticosAlineacion(DBay.Documento.DifusividadMapa);
[Inte] = AnalisisEstadisticosAlineacion(DInt.Documento.DifusividadMapa);

[BFirew] = AnalisisEstadisticosAlineacion(BDfire.Documento.DifusividadMapa);
[BBigB] = AnalisisEstadisticosAlineacion(BDBig.Documento.DifusividadMapa);
[BBaye] = AnalisisEstadisticosAlineacion(BDBay.Documento.DifusividadMapa);
[BInte] = AnalisisEstadisticosAlineacion(BDInt.Documento.DifusividadMapa);


ColuA = [Inte.PropBuenas; Firew.PropBuenas ; BigB.PropBuenas; Baye.PropBuenas];
ColuB = [BInte.PropBuenas; BFirew.PropBuenas ; BBigB.PropBuenas; BBaye.PropBuenas];


DispeA= [Inte.Despersion; Firew.Despersion ; BigB.Despersion; Baye.Despersion];
DispeB= [BInte.Despersion; BFirew.Despersion ; BBigB.Despersion; BBaye.Despersion];

ErrA= [Inte.ErrorMedio; Firew.ErrorMedio ; BigB.ErrorMedio; Baye.ErrorMedio];
ErrB= [BInte.ErrorMedio; BFirew.ErrorMedio ; BBigB.ErrorMedio; BBaye.ErrorMedio];


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


y = [DispeA DispeB];
subplot(1,3,1)
hb = bar(X,y);
hb(1).FaceColor = Vec1;
hb(2).FaceColor = Vec2;
grid on
grid minor
title('a)')
ylim=([min(min(y))*0.9 max(max(y))*1.1]);
set(gca,'YLim', ylim);
legend('Type 1', 'Type 2', 'Location','northwest')
ylabel('Dispersal [%]')


y = [ErrA ErrB];
subplot(1,3,2)
hb = bar(X,y);
hb(1).FaceColor = Vec1;
hb(2).FaceColor = Vec2;
grid on
grid minor
title('b)')
ylim=([min(min(y))*0.9 max(max(y))*1.1]);
set(gca,'YLim', ylim);
legend('Type 1', 'Type 2', 'Location','northwest')
ylabel('Fitting error')


subplot(1,3,3)
y = [ColuA ColuB];
hb = bar(X,y );
hb(1).FaceColor = Vec1;
hb(2).FaceColor = Vec2;
grid on
grid minor
title('c)')
ylim=([min(min(y))*0.9 max(max(y))*1.1]);
set(gca,'YLim', ylim);
legend('Type 1', 'Type 2')
ylabel('Measurement rate [%]')

f.Position = [100 100 350*2 250];
refresh(f) 
print(gcf, char(["ComparacionesCurvas.png"]) ,'-dpng' ,'-r300')

% f = figure('Renderer', 'painters', 'Position', [10 10 250 250]);
% refresh(f)
% f.Position = [100 100 350 250];
% refresh(f) 
% 
% hb = bar(X,y );
% hb(1).FaceColor = Vec1;
% hb(2).FaceColor = Vec2;
% grid on
% grid minor
% 
% ylim=([min(min(y))*0.9 max(max(y))*1.1]);
% set(gca,'YLim', ylim);
% legend('Type 1', 'Type 2')
% ylabel('Measurement rate [%]')
% refresh(f) 
% print(gcf, char(["MesuRate.png"]) ,'-dpng' ,'-r300')
% 
% y = [DispeA DispeB];
% 
% 
% f = figure('Renderer', 'painters', 'Position', [10 10 250 250]);
% refresh(f)
% f.Position = [100 100 350 250];
% refresh(f) 
% hb = bar(X,y);
% hb(1).FaceColor = Vec1;
% hb(2).FaceColor = Vec2;
% grid on
% grid minor
% ylim=([min(min(y))*0.9 max(max(y))*1.1]);
% set(gca,'YLim', ylim);
% legend('Type 1', 'Type 2', 'Location','northwest')
% ylabel('Dispersal [%]')
% refresh(f) 
% print(gcf, char(["Dispersion.png"]) ,'-dpng' ,'-r300')
% 
% 













