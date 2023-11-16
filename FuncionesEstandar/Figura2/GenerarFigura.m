function GenerarFigura(nombre, mapa)

%f = figure('Renderer', 'painters', 'Position', [10 10 250 250]);
%refresh(f)
%f.Position = [100 100 250 250];
%refresh(f) 
imagesc([-4, 4], [-4, 4], mapa)
hold on
%xlabel('X')
%ylabel('Y')
grid on
grid minor
title(nombre)
axis equal;
colorbar()
%set ( gca, 'ydir', 'reverse' )
set(gca,'YDir','normal')
%refresh(f) 
%print(nombre,'-dpng','-r300')
%f.Position = [100 100 250 250];
%refresh(f) 
%print(gcf, "figura" ,'-dpng' ,'-r300')
%print(gcf, char([nombre + ".png"]) ,'-dpng' ,'-r300')
end