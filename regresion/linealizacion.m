% Equipo 7
% 	Victor Hugo Torres Rivera   ----- A01701017
% 	Marco Antonio Mancha Alfaro ----- A01206194
% 	Rodolfo Martínez Guevara    ----- A01700309
%
% 	Regresión Lineal
% 		Este programa encuentra el modelo de regresion lineal
%
% 	Datos de entrada
% 		- Matriz 
%
% 	Datos de salida
% 		- Modelo de regresion linealizado con sus correspondientes graficas


% --------------------------------------EJERCICIO 2----------------------------------------------%
  clc
  clear all
  
  %Datos originales
  DATOS = [0.75 1.2 ; 2 1.95 ; 3 2 ; 4 2.4 ; 6 2.4 ; 8 2.7 ; 8.5 2.6]
  
  %Graficar los datos originales
  subplot(1,2,1)
  plot(DATOS(:,1) , DATOS(:,2), 'o')
  hold on
  
  %Transformar los datos:
  A = 1 ./ DATOS 
  
  %Graficar datos transformar
  subplot(1,2,2)
  plot(A(:,1) , A(:,2), 'o')
  hold on
  
  %Calcular la pendiente y la ordenada al origen del modelo linealizado, con los datos transformados:
  
  %Tamaño matriz A

  [m,n] = size(A);
  
  %Calculamos la matriz de coeficientes
  
  Coef = [m sum(A(:,1)) ; sum(A(:,1)) sum(A(:,1).^2)] ;
  
  %Calculamos el vector del lado derecho

  derecho = [sum(A(:,2)) ; sum(A(:,1) .* A(:,2))] ;
    
  %Calculamos la matriz de soluciones del sistema
  
  sol = inv(Coef) * derecho ;
  
  x = linspace(min(A(:,1))-1,max(A(:,1))+1) ;
  
  %Calculamos el modelo de regresion y desplegamos todos los datos
  
  disp("\n\nModelo de regresion : ")
  
  printf ("\n\na0 = %d \n",sol(1,1));
  
  printf ("\na1 = %d \n",sol(2,1));
  
  disp("\n\nEL MODELO DE REGRESION LINEAL PARA TUS DATOS ES: ")
  
  disp("\nY = a1 x + a0")
  
  ordenada = sol(1) ;
  
  pendiente = sol(2) ;
  
  y = pendiente * x + ordenada ;
  
  printf("\ny = %d x + %d \n",pendiente,ordenada);
  
  subplot(1,2,2)
  
  plot(x,y,'r')
  
  %Regresar al modelo originales
  
  alfa = 1 / ordenada ;
  
  beta = pendiente / ordenada ;
  
  x1 = linspace(min(DATOS(:,1))-1,max(DATOS(:,1))+1) ;
  
  y1 = x1 ./ (pendiente + (ordenada * x1)) ;
  
  subplot(1,2,1)
  
  plot(x1,y1, 'r')
  
  disp("\n\nMODELO LINEALIZADO ")
  
  disp("\nY = m x + b")
  
  printf("\ny = %d x + %d \n",pendiente, ordenada);
  
  disp("\n\nMODELO ORIGINAL ")
  
  printf("\ny = %d x /( %d + x ) \n",alfa,beta);
  
  z = 0;
  
  while z == 0
 
    z = input("\n\nDesea calcular alguna estimacion? (0/1) : ") ;
    
    if(z == 0)
   
      valor = input("\n\nDame el valor de x: ") ;
      
      calculo = valor / (pendiente + (ordenada * valor)) ;
      
      printf("\n\nValor calculado: %d",calculo);
      
      subplot(1,2,1)
  
      plot(valor,calculo, '*')
      
      hold on
      
      title("Orignales")
      
      subplot(1,2,2)
      
      plot(1/valor, 1/calculo, '*')
      
      hold on
      
      title("Transformados")
      
    else
      return
    end
  end
  
  
  
 