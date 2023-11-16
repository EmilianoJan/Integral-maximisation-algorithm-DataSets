function [Salida] = Simplificar(Entrada)
if isUnit(Entrada) == 0
    Salida = Entrada;
else
    Salida = simplify(Entrada);
end
end