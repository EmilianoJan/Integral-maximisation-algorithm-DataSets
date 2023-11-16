function [Salida] = Factorizar(Entrada)
if isUnit(Entrada) == 0
    Salida = Entrada;
else
    Salida = collect(Entrada);
end
end