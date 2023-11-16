function GenerarFigura(Serie, nombre)

figure
plot(Serie(:,1), Serie(:,2))
hold on
plot(Serie(1,1), Serie(1,2), 'o')
plot(Serie(end,1), Serie(end,2), '*')
xlabel('X')
ylabel('Y')
grid on
grid minor
title(nombre)
axis equal;

end