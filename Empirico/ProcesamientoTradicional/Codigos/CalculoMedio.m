function [Ordenada] = CalculoMedio(Serie)
%Rutina que calcula el valor medio de la serie.

x = transpose(linspace(0,1, length(Serie)));

pBInt = polyfit(x ,Serie, 1);

Ordenada = pBInt(2);


end
