function [estadisticos] = AnalisisEstadisticosAlineacion(Tabla)

%constantes de la tabla de interés
difuAVC = 103;
errAVC = 107;
difuBVC = 120;
errBVC = 124;
difuCVC = 137;
errCVC = 141;

TablaPrin = [Tabla(:,difuAVC), Tabla(:,errAVC); Tabla(:,difuBVC), Tabla(:,errBVC); Tabla(:,difuCVC), Tabla(:,errCVC)];

estadisticos.Tabla = TablaPrin;

tama = length(TablaPrin(:,1));

filtrada = TablaPrin(TablaPrin(:,2)<0.12,:);

estadisticos.PropBuenas = (length(filtrada)/tama)*100;
estadisticos.TotalMed = tama;
estadisticos.BuenasMed = length(filtrada);
estadisticos.Media = mean(filtrada(:,1));
estadisticos.Std = std(filtrada(:,1));
estadisticos.Despersion = (estadisticos.Std/estadisticos.Media)*100;

avar = TablaPrin(~isnan(TablaPrin(:,2)),2);
avar(avar == 10) = 1;

estadisticos.ErrorMedio = mean(avar);
estadisticos.ErrorDesvio = std(avar(avar < 1));


end
