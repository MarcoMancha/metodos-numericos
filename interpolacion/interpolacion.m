% Equipo 7
% 	Victor Hugo Torres Rivera   ----- A01701017
% 	Marco Antonio Mancha Alfaro ----- A01206194
% 	Rodolfo Martínez Guevara    ----- A01700309
%
% 	Regresión Lineal
% 		Este programa encuentra la interpolacion de un polinomio.
%
% 	Datos de entrada
%     A = [ 12 2.48490665 ; 8 2.07944152 ; 14 2.63905733 ; 6 1.791759469 ]  Ejercicio 1 a y b
%     A = [ 11 2.397895273 ; 8 2.079441542 ; 12 2.48490665 ; 9 2.1977224577 ]  Ejercicio 1 c y d
%
% 	Datos de salida
% 		- Modelo de interpolacion.

clear all
clc
%Pedir los datos:
%A = input('Dame el conjunto de puntos en el plano: ')
%A = [2 3 ; 3 1 ; 1 1 ; 5 2 ; -2 4 ; 0 -7] 
%A = [ 12 2.48490665 ; 8 2.07944152 ; 14 2.63905733 ; 6 1.791759469 ]
A = [ 11 2.397895273 ; 8 2.079441542 ; 12 2.48490665 ; 9 2.1977224577 ]
%Ordenar los datos
A = sortrows(A)

%Grafica de los puntos
plot(A(:,1),A(:,2),'o')
hold on

%Grafica de la interpolacion
plot(A(:,1),A(:,2),'g')
hold on

%Pedir al usuario la estimacion
x = input('Dame la estimacion: ');

if x > min(A(:,1)) && x <max(A(:,1))
  %Calcular la estimacion
  pos = sum(A(:,1)<x) ;
  x0 = A(pos,1)  ;
  y0 = A(pos,2) ;
  x1 = A(pos+1,1) ;
  y1 = A(pos+1,2)  ;
  
  y = y0 + ((y1 - y0)/(x1 - x0)) * (x-x0) ;
  
  fprintf("y = %f + ( (%f - %f) / (%f - %f) ) * (%d - %f)\n",y0,y1,y0,x1,x0,x,x0)
  
  %Graficar la estimacion
  plot(x,y,'*r')
  
else
  disp('Valor fuera del rango, no podemos hacer extrapolaciones')
  return 
end