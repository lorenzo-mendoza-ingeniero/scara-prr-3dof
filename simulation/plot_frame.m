function h = plot_frame(ax, T, varargin)
% Dibuja un sistema de coordenadas en el axes 'ax'.
% T: matriz 4x4.
% Argumentos opcionales:
%   'frame', nombre -> etiqueta
%   'length', L     -> longitud de los ejes (defecto 0.1)
% Salida: estructura h con campos x,y,z (quiver) y label (text).

p = inputParser;
addParameter(p, 'frame', '');
addParameter(p, 'length', 0.1);
parse(p, varargin{:});
frameName = p.Results.frame;
len = p.Results.length;

O = T(1:3,4);
ex = T(1:3,1);
ey = T(1:3,2);
ez = T(1:3,3);

% Dibujar ejes
hold(ax, 'on');
h.x = quiver3(ax, O(1),O(2),O(3), ex(1)*len,ex(2)*len,ex(3)*len, ...
    'r', 'LineWidth',1.5, 'MaxHeadSize',0.5);
h.y = quiver3(ax, O(1),O(2),O(3), ey(1)*len,ey(2)*len,ey(3)*len, ...
    'g', 'LineWidth',1.5, 'MaxHeadSize',0.5);
h.z = quiver3(ax, O(1),O(2),O(3), ez(1)*len,ez(2)*len,ez(3)*len, ...
    'b', 'LineWidth',1.5, 'MaxHeadSize',0.5);

if ~isempty(frameName)
    h.label = text(ax, O(1),O(2),O(3), frameName, ...
        'HorizontalAlignment','left', 'VerticalAlignment','bottom');
else
    h.label = [];
end
end