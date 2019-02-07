% Equipo 7
% 	Victor Hugo Torres Rivera   ----- A01701017
% 	Marco Antonio Mancha Alfaro ----- A01206194
% 	Rodolfo Martínez Guevara    ----- A01700309
%
% 	Regresión Lineal
% 		Este programa calcula un modelo de regresion por minimos 
%     cuadrados Polinomial de grado 3
%
%
% 	Datos de entrada
% 		- Matriz de coeficientes
%
% 	Datos de salida
% 		- Modelo de regresion para los 3 modelos
% 		- Grafica de regresion para los 3 modelos
%
%

% ----------------------------EJERCICIO 3--------------------------------------------------------%

A = [5 17; 10 24; 15 31; 20 33; 25 37; 30 37; 35 40; 40 40; 45 42; 50 41]
[m,n] = size(A);
%grafica datos
plot(A(:,1), A(:,2), 'o')
hold on

%------------------------Inicio de la recta-------------------------------------

%calcular parametros del polinomimo
coef = [m sum(A(:,1)) ; sum(A(:,1)) sum(A(:,1).^2)];
der = [sum(A(:,2)) ; sum(A(:,1) .* A(:,2))]; 

%resuelve la ecuacion
sol = coef\der

%Calcula A0 y A1
a0 = sol(1);
a1 = sol(2);


%graficar
x1 = linspace(min(A(:,1))-5, max(A(:,1))+5);
y1 = a0 + a1*x1;
plot (x1, y1, 'g')
hold on 

disp('-----------RECTA-------------')

A(:,3) = a0 + a1*A(:,1);
Sr = sum((A(:,2) - A(:,3)).^2);

%Calcular el error estandar del estimado
disp('Error estandar del estimado')
Syx = sqrt(Sr/(m-2))

St = sum((A(:,2) - (mean(A(:,2)))).^2)
%calcular el coeficiente de correlacion
disp('Coeficiente de relacion: ')
r = sqrt((St - Sr)/St)

PIEM = r^2*100


%---------------------------Fin de la recta-------------------------------------

%------------------------Inicio de la potencia----------------------------------

%Transformar los datos:
B = log10(A)

%Calculamos la matriz de coeficientes
  
Coef = [m sum(B(:,1)) ; sum(B(:,1)) sum(B(:,1).^2)] ;

%Calculamos el vector del lado derecho

derecho = [sum(B(:,2)) ; sum(B(:,1) .* B(:,2))] ;
    
%Calculamos la matriz de soluciones del sistema
  
sol = inv(Coef) * derecho ;

ordenada = sol(1) ;
  
pendiente = sol(2) ;

alfa = 1 / ordenada ;
  
beta = pendiente / ordenada ;

x1 = linspace(min(A(:,1))-1,max(A(:,1))+1) ;

y1 = x1 ./ (pendiente + (ordenada * x1)) ;


plot(x1,y1, 'b')

hold on

disp('------------------Potencia--------------------------------')

disp("\n\nMODELO LINEALIZADO ")
  
disp("\nY = m x + b")

printf("\ny = %d x + %d \n",pendiente, ordenada);

disp("\n\nMODELO ORIGINAL ")

printf("\ny = %d x /( %d + x ) \n",alfa,beta);

B(:,3) = ordenada+pendiente*B(:,1)

Sr = sum((B(:,2) - B(:,3)).^2);

%Calcular el error estandar del estimado
disp('Error estandar del estimado')
Syx = sqrt(Sr/(m-2))

St = sum((B(:,2) - (mean(B(:,2)))).^2)
%calcular el coeficiente de correlacion
disp('Coeficiente de relacion: ')
r = sqrt((St - Sr)/St)

PIEM = (r^2)*100

%------------------modelo polinomial-------------------------------------------
%grafica datos
plot(A(:,1), A(:,2), 'o')
hold on

%calcular parametros del polinomimo
coef = [m sum(A(:,1)) sum(A(:,1).^2); sum(A(:,1)) sum(A(:,1).^2) sum(A(:,1).^3); sum(A(:,1).^2) sum(A(:,1).^3) sum(A(:,1).^4)]
der = [sum(A(:, 2)); sum(A(:,1).*A(:, 2)); sum(A(:, 1).^2.*A(:, 2))]

%resuelve la ecuacion
sol = coef\der;

%Calcula A0, A1 y A2
a0 = sol(1);
a1 = sol(2);
a2 = sol(3);

disp('Modelo de un polinomimo de grado 2:')
fprintf('\nY = %f + %f x + %f x^2 \n\n', a0, a1, a2)

%grafica del polinomimo
x3 = linspace(min(A(:,1)), max(A(:,1)));
y3 = a0 + a1*x3 + a2*x3.^2;
plot(x3, y3, 'r')
hold on 

disp('------------------Polinomial--------------------------------')

A(:,3) = a0 + a1*A(:,1) + a2*A(:,1).^2;
Sr = sum((A(:,2) - A(:,3)).^2);

%Calcular el error estandar del estimado
disp('Error estandar del estimado')
Syx = sqrt(Sr/(m-3))

St = sum((A(:,2) - (mean(A(:,2)))).^2)
%calcular el coeficiente de correlacion
disp('Coeficiente de relacion: ')
r = sqrt((St - Sr)/St)

PIEM = r^2*100


