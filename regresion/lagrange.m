% Equipo 7
% 	Victor Hugo Torres Rivera   ----- A01701017
% 	Marco Antonio Mancha Alfaro ----- A01206194
% 	Rodolfo Martínez Guevara    ----- A01700309
%
% 	Regresión Lineal
% 		Este programa encuentra la interpolacion de lagrange
%
% 	Datos de entrada
% 		- Matriz de datos 
%   A = [ 1 800 ; 3 2310 ; 5 3090 ; 7 3940 ; 13 4755]; ejercicio 3 a.
%   A = [3 2310 ; 5 3090 ; 7 3940 ; 13 4755] ejercicio 3 b.
%   A = [5 3090 ; 7 3940 ; 13 4755] ejercicio 3 c.
%   A = [7 3940 ; 13 4755] ejercicio 3 d.
%   A = [ 2 0.8 ; 3 0.9 ; 4 0.941176 ; 5 0.961538] ejercicio 4d
%
% 	Datos de salida
% 		- Modelo de interpolacion de lagrange
%     - Estimacion

  clear all
  clc
  %Pedir los datos:
  %A = input('Dame el conjunto de puntos en el plano: ')
  %A = [1 4; 3 5 ; -2 6 ; 2 3; -3 -4];
  %A = [ 1 800 ; 3 2310 ; 5 3090 ; 7 3940 ; 13 4755];
  %A = [3 2310 ; 5 3090 ; 7 3940 ; 13 4755]
  %A = [5 3090 ; 7 3940 ; 13 4755]
  %A = [7 3940 ; 13 4755]
  A = [ 2 0.8 ; 3 0.9 ; 4 0.941176 ; 5 0.961538]
  [m,n] = size(A);

  %Ordenar los datos
  A = sortrows(A)

  %Grafica de los puntos
  plot(A(:,1),A(:,2),'o')
  hold on

  %Pedir al usuario la estimacion
  x = input('Dame la estimacion: ');

  if x > min(A(:,1)) && x <max(A(:,1))
    %Calcular la estimacion
    x1 = linspace(min(A(:,1)),max(A(:,1)));
    y1 = zeros(100,1);
    
    for k=1:100
    L = ones(m,1);
      for i=1:m
          for j=1:m
              if j != i
                L(i) =  L(i) .* ( (x1(k) - A(j,1)) /  (A(i,1)- A(j,1)) );
              end;
          endfor;   
      endfor;
      y1(k) =  sum(L.*A(:,2));
    end
    plot(x1,y1,'m');
    hold on
    
    y = 0;
    L = ones(m,1) ;

    for i=1:m
        for j=1:m
            if j == i
                continue;
            endif;
            L(i) =  L(i) * ( (x - A(j)) /  (A(i)- A(j)) );
        endfor;   
    endfor;
      y =  sum(L.*A(:,2));
    %Graficar la estimacion
    plot(x,y,'*r')
    
  else
    disp('Valor fuera del rango, no podemos hacer extrapolaciones')
    return 
  end
  
  