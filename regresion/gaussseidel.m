%   Este programa calcula la solucion a un sistema
%   de ecuaciones lineales por el metodo de Gauss-Seidel
%
%  Marco Antonio Mancha Alfaro  A01206194
%  Victor Hugo Torres Rivera    A01701017
%  Rodolfo Martinez Guevara     A01700609
%   18/09/2017
%
% Datos de entrada: 
%  -- Matriz de coeficientes del sistema:
%      Ejercicio prueba:             A=[3 -.1 -.2;.1 7 -.3;.3 -.2 10] ; 
%      Ejercicio 5 escenario 1:      A=[4 3 2 ;1 3 1;2 1 3] ;
%  -- Vector del lado derecho
%      Ejercicio prueba:             B=[7.85;-19.3;71.4] ; 
%      Ejercicio 5 escenario 1:      B=[960 ; 510 ; 610] ;
% 
%  -- Tolerancia
%
% Datos de salida: Vector "x" solucion del sistema.
%
%

  clear all
  clc

  %Inicializar valores para el error tolerado... 5%

  erpa = 100*ones(3,1);
  tol = .005;

  %Pedir datos de entrada al usuario:

  A = input('  Dame la matriz de coeficientes del sistema: ');

  %A=[3 -.1 -.2;.1 7 -.3;.3 -.2 10] ;

  [m,n] = size(A);

  if m==n
   %la matriz es cuadrada y continuamos
   d = det(A);
    if d == 0
     %la matriz tiene determinante cero y salimos del programa.')
      disp('  ERROR: La matriz es singular.')
      return
    else
     % la matriz tiene determinante distinto de cero, continuamos
     
     b = input('  Dame el vector del lado derecho: ');
     %b=[7.85;-19.3;71.4] ;
     
     [p,q]=size(b);
     if (p==n && q==1)
      %el vector es del tamao correcto y continuamos
      %LOs datos son correctos e inicio el calculo...
      %disp('  Vamos bien :)')
      
      %inicilizar solucion
      x = zeros(n,1);
      old = x;
      cont = 0;
      ERPa = 100 * ones(n,1);
      
      while(sum(ERPa > tol) !=0)
      
      cont = cont + 1
     
        for  i = 1 : n
          sumaAcum = 0;
          for j = 1 : n
              if i != j
                sumaAcum = sumaAcum + A(i,j) * x(j);
              end
          end
          x(i) = ( b(i) - sumaAcum ) / (A(i,i))  
        end
        
        ERPa = abs(( x - old) ./ x) * 100 ;
        old = x;
      end
     
     else
      %el vector es de tamao incorrecto, se avisa y terminamos
      disp('  ERROR: El vector del lado derecho no es del tamao correspondiente.')
      return
     end
    end
   else
   % la matriz no es cuadrada, nos salimos del programa
    disp('  ERROR: La matriz NO es cuadrada.')
   return
   end