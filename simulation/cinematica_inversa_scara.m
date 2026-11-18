function [q, FLAG] = cinematica_inversa_scara(x, y, z)
% Cinemática inversa del SCARA (PRR).
% Entradas: x,y,z en metros (coordenadas en el sistema {0}).
% Salidas: q = [q1; q2; q3] (m, rad, rad), FLAG (0 = factible, 1 = fuera workspace).

% Parámetros geométricos (deben coincidir con directa)
a1 = 0.11000;     % m
a2 = 0.11482;
a3 = 0.10000;
d2 = 0.05700;
d3 = 0.06000;

% Límites articulares (ajustados a la máquina real)
q1_min = 0.0;      % m   (carrera mínima del prismático)
q1_max = 0.600;    % m   (carrera máxima, modificar según hardware)
q2_min = -pi/2;    % rad (-90°)
q2_max =  pi/2;    % rad (+90°)
q3_min = -100 * pi / 180;   % rad (-100°)
q3_max =  100 * pi / 180;   % rad (+100°)

FLAG = 0;
q = [0; 0; 0];   % inicialización

% --- 1. Altura: q1 (prismática) ---
q1 = z - (d2 + d3);
if q1 < q1_min || q1 > q1_max
    FLAG = 1;
    fprintf(['Fuera de workspace: altura z = %.3f m requiere q1 = %.3f m, ' ...
        'pero límites son [%.3f, %.3f] m.\n'], z, q1, q1_min, q1_max);
    return;
end

% --- 2. Alcance planar (2R) ---
xp = x - a1;
yp = y;
r = sqrt(xp^2 + yp^2);

r_min = abs(a2 - a3);
r_max = a2 + a3;
if r < r_min || r > r_max
    FLAG = 1;
    fprintf(['Fuera de workspace: distancia radial r = %.3f m, ' ...
        'debe estar entre %.3f y %.3f m.\n'], r, r_min, r_max);
    return;
end

% --- 3. Calcular q3 (dos posibles soluciones) ---
D = (r^2 - a2^2 - a3^2) / (2 * a2 * a3);
D = max(min(D, 1), -1);   % evitar errores de redondeo

% Solución 1: codo abajo (q3 negativa)
q3_1 = -acos(D);
% Solución 2: codo arriba (q3 positiva)
q3_2 =  acos(D);

% Intentar primero con codo abajo
q3 = q3_1;
q2 = atan2(yp, xp) - atan2(a3 * sin(q3), a2 + a3 * cos(q3));
% Normalizar a [-pi, pi]
q2 = atan2(sin(q2), cos(q2));
q3 = atan2(sin(q3), cos(q3));

if q2 >= q2_min && q2 <= q2_max && q3 >= q3_min && q3 <= q3_max
    % solución válida
    q = [q1; q2; q3];
    return;
end

% Si no, probar codo arriba
q3 = q3_2;
q2 = atan2(yp, xp) - atan2(a3 * sin(q3), a2 + a3 * cos(q3));
q2 = atan2(sin(q2), cos(q2));
q3 = atan2(sin(q3), cos(q3));

if q2 >= q2_min && q2 <= q2_max && q3 >= q3_min && q3 <= q3_max
    q = [q1; q2; q3];
    return;
end

% Si ninguna cumple los límites angulares, error
FLAG = 1;
fprintf(['Fuera de workspace: ninguna configuración de q2,q3 ' ...
    'respeta los límites articulares.\n']);
end