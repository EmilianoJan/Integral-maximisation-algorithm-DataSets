close all;
clear all;

%trato de generar un mapa que tenga sufciente diversidad numérica.
cantPuntos = 240;
tamMapa = 50;
tamPuntos = tamMapa*0.9;
pasoMapaFinal = 0.5;
ruidoFinal = 0.0005;

% x = -tamPuntos + 2*tamPuntos*rand(cantPuntos,1);
% y = -tamPuntos + 2*tamPuntos*rand(cantPuntos,1);
% v = 1*rand(cantPuntos,1); %sin(x.*4).^4 .* cos(y.*2);

x = [1;1;-1;-1;0.5;0].*20;
y = [1;-1;-1;1; 0;0].*20;
v = [1;1;1;1; 2;0];


%tengo que agregar los puntos en los extremos como para que el mapa sea completo.
x = [x; -tamMapa; -tamMapa; tamMapa; tamMapa];
y = [y; -tamMapa; tamMapa; tamMapa; -tamMapa];
v = [v; 0;0;0;0];

[xq,yq] = meshgrid(-tamMapa:pasoMapaFinal:tamMapa);
z3 = griddata(x,y,v,xq,yq,'cubic');
[tamx, tamy] = size(z3);

%H = ones(floor(tamx/20),floor(tamy /20));
%z4 = filter2(H,z3,'full');
z4 = z3;

z4 = z4(1:tamx, 1:tamy);
sumaRuido = rand(tamx, tamy)*ruidoFinal;
z4 = z4 + sumaRuido; 
z4 = z4./max(max(z4));

z4 = z4*30;


TamX = [-250 250];
z4 = flip(transpose(z4),1);

imagesc(TamX, TamX , z4);
axis tight;
axis equal;
xlabel('X [\mum]')
ylabel('Y [\mum]')
xticks([-250 -125 0 125 250])
%colormap(map)
%set(gcf,'colormap',copper);
%gra.colormap = copper;

%caxis([-tamBarra tamBarra]);
%a = colorbar;
%a.Label.String = 'Z [\mum]';

a = colorbar;
a.Label.String = 'Height [\mum]';
grid on

print('MapaSup.png','-dpng','-r300')















%f = figure;
%plot3(x,y,v,'mo')
%hold on
%s = surf(yq,xq,z4);
%s.EdgeColor = 'none';
%colormap (f, jet)
%axis equal
%mesh(xq,yq,z3)
%title('Nearest Neighbor')
%legend('Sample Points','Interpolated Surface','Location','NorthWest')

%csvwrite('mapaPrueba1.csv', z4);
