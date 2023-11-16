function [salida] = Reconversion(Entrada, Media, Varianza, TamHaz, Desplazamientos, DesplaSTD,  MediaDistancia, STDDistancia, Indice)
Indice = Indice + 1;
salida = [Entrada; Media(Indice), Varianza(Indice), TamHaz(Indice), Desplazamientos(Indice), DesplaSTD(Indice), MediaDistancia(Indice), STDDistancia(Indice) ];
end