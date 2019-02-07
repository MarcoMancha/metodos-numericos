% Equipo 7
% 	Victor Hugo Torres Rivera   ----- A01701017
% 	Marco Antonio Mancha Alfaro ----- A01206194
% 	Rodolfo Martínez Guevara    ----- A01700309
%
% 	Regresión Lineal
% 		Este programa encuentra el modelo de regresion lineal
%
% 	Datos de entrada
% 		- Matriz de coeficientes
%     A = [ B(:,2) B(:,3) ] EJERCICIO 1 a y b
%     A = [ B(:,2) B(:,4) ] EJERCICIO 1 c y d
%
% 	Datos de salida
% 		- Modelo de regresion
% 		- Grafica de regresion
%
%

% --------------------------------EJERCICIO 1----------------------------------------------------%

  clear all
  clc

  %Pedir datos de entrada al usuario:

  %A = input('  Dame la matriz con las coordenadas: ');
  
  B = load('eje1Tarea.txt') ;
  
  %Tamaño matriz A
  
  % A = [ B(:,2) B(:,3) ] EJERCICIO 1 a y b
  
  A = [ B(:,2) B(:,4) ]

  [m,n] = size(A);
  
  %Calculamos la matriz de coeficientes
  
  Coef = [m sum(A(:,1)) ; sum(A(:,1)) sum(A(:,1).^2)] ;
  
  %Calculamos el vector del lado derecho

  derecho = [sum(A(:,2)) ; sum(A(:,1) .* A(:,2))] ;
  
  %Guardar valor de variables
  
  xy = sum( A(:,1) .* A(:,2) ) ; %Sumatoria de x * y
  sx = sum(A(:,1)) ;             %Sumatoria de x
  sy = sum(A(:,2)) ;             %Sumatoria de x
  xc = sum(A(:,1).^2) ;          %Sumatoria de (x ^ 2)
  yc = sum(A(:,2).^2) ;          %Sumatoria de (y ^ 2)
  sxc =sum(A(:,1))^2 ;           %Sumatoria de x ^ 2
  syc =sum(A(:,2))^2 ;           %Sumatoria de y ^ 2
    
  %Calculamos la matriz de soluciones del sistema
  
  sol = inv(Coef) * derecho ;
  
  x = linspace(min(A(:,1))-1,max(A(:,1))+1) ;
  
  %Calculamos el modelo de regresion y desplegamos todos los datos
  
  disp("\n\nModelo de regresion : ")
  
  printf ("\n\na0 = %d \n",sol(1,1));
  
  printf ("\na1 = %d \n",sol(2,1));
  
  disp("\n\nEL MODELO DE REGRESION LINEAL PARA TUS DATOS ES: ")
  
  disp("\nY = a1 x + a0") ;
  
  y = sol(2,1) * x + sol(1,1) ;
  
  printf("\ny = %d x + %d \n",sol(2,1),sol(1,1));
  
  A(:,3) = (sol(2,1) * A(:,1)) + sol(1,1) 
  
  error = sum((A(:,2) - A(:,3)).^2) ;
  
  disp("\n\nValor del error") ;
  
  printf("\n\nerror = %d\n",error);
  
  syx = sqrt(error / (m-2)) ;
  
  disp("\n\nValor del error estandar estimado") ;
  
  printf("\n\nerror estandar = %d\n",syx);
  
  promedio = mean(A(:,2)) ;
  
  disp("\n\nValor del promedio de las y") ;
  
  printf("\n\npromedio = %d\n",promedio);
  
  estandar = std(A(:,2)) ;
  
  disp("\n\nValor desviacion estandar ") ;
  
  printf("\n\ndesviacion estandar = %d\n",estandar);
  
  disp("\n\nCoeficiente de correlacion") ;
  
  r = ( (m * xy) - (sx * sy)  )/( sqrt( (m * xc) - sxc )  * sqrt( (m * yc) - syc ) ) ;
  
  printf("\n\ncorrelacion = %d\n",r);
  
  disp("\n\nCoeficiente de determinacion") ;
  
  r2 = r^2 ;
  
  printf("\n\ndeterminacion = %d\n",r2);
  
  disp("\n\nPorcentaje de Incertidumbre") ;
  
  pm = r^2 * 100 ;
  
  printf("\n\nPIEM = %d\n\n\n",pm);
  
  plot(A(:,1),A(:,2),'o')
  
  hold on
  
  plot(x,y,'r')
  
  if estandar > syx
    disp("EL MODELO ES BUENO")
  else
    disp("EL MODELO NO ES ADECUADO")
  end
  
  z = 0;
  
  while z == 0
 
    z = input("\n\nDesea calcular alguna estimacion? (0/1) : ") ;
    
    if(z == 0)
   
      valor = input("\n\nDame el valor de x: ") ;
      
      calculo = sol(2,1) * valor + sol(1,1) ;
      
      printf("\n\nValor calculado: %d",calculo);
      
    else
      return
    end
  end
    
  