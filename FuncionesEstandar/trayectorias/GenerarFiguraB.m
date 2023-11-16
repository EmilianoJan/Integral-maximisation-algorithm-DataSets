function GenerarFiguraB(Serie, nombre, mapa)

tammarca = 14;

f = figure('Renderer', 'painters', 'Position', [10 10 250 250]);
refresh(f)
f.Position = [100 100 250 250];
refresh(f) 
imagesc([-4, 4], [-4, 4], mapa)

%h = colorbar;
%h.Label.String = "Ackley(X,Y)";

hold on
Serie = [-3 ,-3; Serie];

dmax = length(Serie(:,1))-1;
indice = 1;
for p = 1:(dmax)
	plot(Serie(indice:indice+1,1), Serie(indice:indice+1,2) ,'linewidth',2 , 'color' , [(indice-1)/dmax (indice-1)/dmax  (indice-1)/dmax])
	plot(Serie(indice,1), Serie(indice,2), '.', 'MarkerSize', tammarca , 'color' , [(indice-1)/dmax (indice-1)/dmax  (indice-1)/dmax])
	indice = indice +1;
end 
plot(Serie(1,1), Serie(1,2), 'o', 'color' , [1 0 0])
plot(Serie(end,1), Serie(end,2), '*', 'color' , [1 0 0])
xlabel('X')
ylabel('Y')
grid on
grid minor
title(nombre)
axis equal;
refresh(f) 
%print(nombre,'-dpng','-r300')
%f.Position = [100 100 250 250];
refresh(f) 
%print(gcf, "figura" ,'-dpng' ,'-r300')
print(gcf, char([nombre + ".png"]) ,'-dpng' ,'-r300')
end