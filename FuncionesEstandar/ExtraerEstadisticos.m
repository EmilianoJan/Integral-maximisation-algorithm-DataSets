function [Resultado] = ExtraerEstadisticos(Datos)
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


Resultado.IntegM = mean(Integ);
Resultado.IntegV = std(Integ);

Resultado.DifereM = mean(Difere);
Resultado.DifereV = std(Difere);

Resultado.BayesiM = mean(Bayesi);
Resultado.BayesiV = std(Bayesi);

Resultado.GlobBounM = mean(GlobBoun);
Resultado.GlobBounV = std(GlobBoun);

Resultado.PartcleM = mean(Partcle);
Resultado.PartcleV = std(Partcle);

Resultado.RanSeaM = mean(RanSea);
Resultado.RanSeaV = std(RanSea);

Resultado.BigBangM = mean(BigBang);
Resultado.BigBangV = std(BigBang);

Resultado.FireWoM = mean(FireWo);
Resultado.FireWoV = std(FireWo);



end