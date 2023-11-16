function [media, desvio] = CalculoTiempos(Medicion)

serie = Medicion.Documento.DifusividadMapa(:, 14);

Diferencias = serie(2:end) - serie(1:end-1);

media = nanmean(Diferencias);
desvio = Diferencias;

end
