% Equipo 7
% 	Victor Hugo Torres Rivera   ----- A01701017
% 	Marco Antonio Mancha Alfaro ----- A01206194
% 	Rodolfo Martínez Guevara    ----- A01700309
%
% 	Regla del Trapecio
% 		Este programa calcula el valor de la integral definida utilizando trapecios.
%
%
% 	Datos de entrada
% 		- Funcion e intervalos


clear all
close all
clc

%  f = @(x) 0.2 + 25 * x - 200 * x.^2 + 675 * x.^3 - 900 * x.^4 + 400 * x.^5;
%Ejercicio 1
  
  f = @(x) (e.^x)./x ;
  a = 0.2;
  b = 4;

 
  real = quadl(f,a,b);

  x1 = linspace(a,b);
  y1 = f(x1);
  plot(x1,y1,'b');
  hold on
  
  n = input('¿Cuantas aplicaciones de Trapecio quieres hacer? ')

  % Primera linea
  plot([a a],[0 f(a)],'k')
  hold on

  Integral = zeros(n,1);
  x = linspace(a,b,n+1);
  
  %Cuando sabes n

  for i = 1: n
      a = x(i);
      b = x(i+1);
      base = b - a;
      altura_promedio = ( f(a) + f(b) )/2;
      Integral(i) = base * altura_promedio;
      
      % Linea derecha
      plot([b b],[0 f(b)],'g')
      hold on
      
      % Techos
      plot([a b],[f(a) f(b)],'r')
      hold on
  endfor
  
   I = sum(Integral)
   
   %Calculo del error:
  
  ERPa = abs((Real - Integral)/Real) * 100
 