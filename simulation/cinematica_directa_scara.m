function [T01, T02, T03] = cinematica_directa_scara(q1, q2, q3)
% Cinemática directa de un manipulador SCARA (PRR).
% q1, q2, q3: variables articulares en metros y radianes.
% Retorna las matrices de transformación homogénea T01, T02, T03.

% Parámetros geométricos constantes (en metros)
a1 = 0.11000;
a2 = 0.11482;
a3 = 0.10000;
d2 = 0.05700;
d3 = 0.06000;

% Matriz A1^0 (prismática)
T01 = [1 0 0 a1;
    0 1 0 0;
    0 0 1 q1;
    0 0 0 1];

% Matriz A2^1 (rotacional 1)
T12 = [cos(q2) -sin(q2) 0 a2*cos(q2);
    sin(q2)  cos(q2) 0 a2*sin(q2);
    0        0       1 d2;
    0        0       0 1];

% Matriz A3^2 (rotacional 2)
T23 = [cos(q3) -sin(q3) 0 a3*cos(q3);
    sin(q3)  cos(q3) 0 a3*sin(q3);
    0        0       1 d3;
    0        0       0 1];

T02 = T01 * T12;
T03 = T02 * T23;
end