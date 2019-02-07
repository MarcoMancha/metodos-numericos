% Equipo 7
% 	Victor Hugo Torres Rivera   ----- A01701017
% 	Marco Antonio Mancha Alfaro ----- A01206194
% 	Rodolfo Martínez Guevara    ----- A01700309
%
% 	Metodo de Newton-Raphson
% 		Este programa encuentra la raiz de una funcion lineal
% 		por el metodo de Newton-Raphson.
%
% 	Datos de entrada
% 		- Funcion que se desea evaluar.
% 		- Derivada de la funcion a evaluar.
% 		- Aproximacion inicial de la raiz.
% 		- Limite de pasos.
% 		- Tolerancia maxima.
%
% 	Datos de salida
% 		- Aproximacion de la raiz.
% 		- ERPA.
% 		- No. de pasos.
%
%
% Ejercicio 1:
%
% Funcion entre apostrofes: 'exp(-x)-x'
% Funcion derivada: '-exp(-x)-1'
% Punto de inicio: 1
% Cantidad máxima iteraciones: 50
% Tolerancia:
%                   Ejercicio a) 10e-6 b) eps
%
% Ejercicio 2:
%
% Funcion entre apostrofes: '0.5*x^3 - 4 * x^2+ 5.5 * x- 1'
% Funcion derivada: '1.5 * x^2 - 8 * x + 5.5'
% Punto de inicio:
%                   Ejercicio a) 4.52 b) 4.5
%
% Cantidad máxima iteraciones: 50
% Tolerancia: eps

% ------------------------------------------------------------------------------------%

% Pedir al usuario la funcion a evaluar.
cadena = input('Introduce la funcion que se desea evaluar (entre apostrofes): ');
fun = inline(cadena);

% Pedir al usuario la derivada de la funcion a evaluar.
cadena_derivada = input('Introduce la derivada de la funcion a evaluar: ');
der = inline(cadena_derivada)

% Pedir al usuario el valor aproximado inicial.

aprox = input('Introduce el valor aproximado inicial:');

% Pedir al usuario el numero maximo de pasos por evaluar.
max_step = input('Introduce el numero de pasos maximo por evaluar:');

% Pedir al usuario el error maximo aceptado
error_max = input('Introduce el valor maximo de error aceptado: ');

fx = fun(aprox);

dx = der(aprox);

x = 0;

error = 100;

fprintf("\n\n\tIteración\t\tXr\t\t\tf(Xr)\t\t\tERPa\n\n");

i = 0;

while error > error_max && i < max_step

    x = aprox - (fx/dx) ;

    fx = fun(x);

    dx = der(x);

    error = abs((x - aprox) / x) * 100 ;

    aprox = x;

    i = i + 1;

    disp([i aprox fx error]);

end
