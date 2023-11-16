function [Resultado] = ExtraerEstadisticosB(Datos)
%Rutina que se encarga de extraer estadisticos de las simulaciones. Devuelve una estructura con todos
%los datos

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

% 
% AcklD = Ackl(:,11);
% RastD = Rast(:,11) ;
% RoseD = Rose(:,11); %estas simulaciones hay que mejorarlas dado que dá en un extremo del intervalo a evaluar
% SpheD = Sphe(:,5).^2 + Sphe(:,6).^2);
% 
% 
% Indice = 1;
% dInteg = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 
% 
% Indice = 2;
% dDifere = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 
% 
% Indice = 3;
% dBayesi = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 
% 
% Indice = 4;
% dGlobBoun = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 
% 
% Indice = 5;
% dPartcle = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 
% 
% Indice = 6;
% dRanSea = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 
% 
% Indice = 7;
% dBigBang = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 
% 
% Indice = 8;
% dFireWo = [AcklD(Ackl(:,7) == Indice); RastD(Rast(:,7) == Indice); RoseD(Rose(:,7) == Indice); SpheD(Sphe(:,7) == Indice)]; 


Resultado.IntegM = mean(Integ);
Resultado.IntegV = std(Integ);
Resultado.dInteg = mean(Datos(Datos(:,7) == 1, 11));
Resultado.sInteg = std(Datos(Datos(:,7) == 1, 11));

Resultado.DifereM = mean(Difere);
Resultado.DifereV = std(Difere);
Resultado.dDifere = mean(Datos(Datos(:,7) == 2, 11));
Resultado.sDifere = std(Datos(Datos(:,7) == 2, 11));

Resultado.BayesiM = mean(Bayesi);
Resultado.BayesiV = std(Bayesi);
Resultado.dBayesi = mean(Datos(Datos(:,7) == 3, 11));
Resultado.sBayesi = std(Datos(Datos(:,7) == 3, 11));

Resultado.GlobBounM = mean(GlobBoun);
Resultado.GlobBounV = std(GlobBoun);
Resultado.dGlobBoun = mean(Datos(Datos(:,7) == 4, 11));
Resultado.sGlobBoun = std(Datos(Datos(:,7) == 4, 11));

Resultado.PartcleM = mean(Partcle);
Resultado.PartcleV = std(Partcle);
Resultado.dPartcle = mean(Datos(Datos(:,7) == 5, 11));
Resultado.sPartcle = std(Datos(Datos(:,7) == 5, 11));

Resultado.RanSeaM = mean(RanSea);
Resultado.RanSeaV = std(RanSea);
Resultado.dRanSea = mean(Datos(Datos(:,7) == 6, 11));
Resultado.sRanSea = std(Datos(Datos(:,7) == 6, 11));

Resultado.BigBangM = mean(BigBang);
Resultado.BigBangV = std(BigBang);
Resultado.dBigBang = mean(Datos(Datos(:,7) == 7, 11));
Resultado.sBigBang = std(Datos(Datos(:,7) == 7, 11));

Resultado.FireWoM = mean(FireWo);
Resultado.FireWoV = std(FireWo);
Resultado.dFireWo = mean(Datos(Datos(:,7) == 8, 11));
Resultado.sFireWo = std(Datos(Datos(:,7) == 8, 11));


end




















