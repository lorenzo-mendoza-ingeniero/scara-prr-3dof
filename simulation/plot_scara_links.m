function h = plot_scara_links(ax, Tt0, q1, q2, q3, a1, a2, a3, d2, d3)
% Dibuja los eslabones físicos de un SCARA PRR.
%   ax   : ejes de la gráfica
%   Tt0  : matriz 4x4 que transforma de {0} a {T} (global)
%   q1   : desplazamiento prismático (m)
%   q2,q3: ángulos rotacionales (rad)
%   a1,a2,a3,d2,d3 : parámetros geométricos constantes (m)
%
%   h    : estructura con handles de los segmentos
%          (campos: base_J1, J1_O1, O1_J2, J2_O2, O2_J3, J3_O3)

% Punto base {0} -> {T}
O0_t = Tt0 * [0;0;0;1];
O0 = O0_t(1:3);
X0 = Tt0(1:3,1);   % dirección X0 en {T}
Y0 = Tt0(1:3,2);
Z0 = Tt0(1:3,3);   % dirección vertical (prismática)

% --- Puntos en {T} ---
J1 = O0 + q1 * Z0;
O1 = J1 + a1 * X0;                      % X1 = X0 (no hay rotación)

J2 = O1 + d2 * Z0;                      % Z1 = Z0
X2 = cos(q2)*X0 + sin(q2)*Y0;
O2 = J2 + a2 * X2;

J3 = O2 + d3 * Z0;                      % Z2 = Z0
X3 = cos(q2+q3)*X0 + sin(q2+q3)*Y0;
O3 = J3 + a3 * X3;

% Dibujar los 6 segmentos
hold(ax, 'on');
h.base_J1 = plot3(ax, [O0(1) J1(1)], [O0(2) J1(2)], [O0(3) J1(3)], ...
    'm', 'LineWidth',2);
h.J1_O1   = plot3(ax, [J1(1) O1(1)], [J1(2) O1(2)], [J1(3) O1(3)], ...
    'm', 'LineWidth',2);
h.O1_J2   = plot3(ax, [O1(1) J2(1)], [O1(2) J2(2)], [O1(3) J2(3)], ...
    'm', 'LineWidth',2);
h.J2_O2   = plot3(ax, [J2(1) O2(1)], [J2(2) O2(2)], [J2(3) O2(3)], ...
    'm', 'LineWidth',2);
h.O2_J3   = plot3(ax, [O2(1) J3(1)], [O2(2) J3(2)], [O2(3) J3(3)], ...
    'm', 'LineWidth',2);
h.J3_O3   = plot3(ax, [J3(1) O3(1)], [J3(2) O3(2)], [J3(3) O3(3)], ...
    'm', 'LineWidth',2);
end