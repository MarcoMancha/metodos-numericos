% Metodos de Runge-Kutta
%
% Datos de entrada:
% -- Ecuacion diferenciaal ordinaria.
%
% Datos de salida:
% -- Aproximaciones con Heun, Punto Medio, Ralston y Butcher.

clear all
close all
clc

dy = @(x) -2*x.^3 + 12*x.^2 -20*x +8.5
a=0;
b=4;
h=0.5;
cond = [0 1];

% Funcion real
fun = @(x) -0.5*x.^4 + 4*x.^3 - 10*x.^2 +8.5*x +1;
x=linspace(a,b);
yReal = fun(x);
plot(x,yReal)
title('Metodos de Runge-Kutta')
hold on

x = a:h:b;
yEuler = zeros(size(x));
yHeun = zeros(size(x));
yPm = zeros(size(x));
yRalston = zeros(size(x));
yButcher = zeros(size(x));
n = numel(x);

% Por la condicion inicial
yEuler(1)=cond(2);
yHeun(1)=cond(2);
yPm(1)=cond(2);
yRalston(1)=cond(2);
yButcher(1)=cond(2);

% Euler ----------------------
for i=2:n
    m = dy(x(i-1));
    yEuler(i) = yEuler(i-1) + m * h;
end
plot(x,yEuler)
hold on

% Heun ----------------------
for i=2:n
    k1 = dy(x(i-1));
    k2 = dy(x(i));
    m = (k1 + k2)/2;
    yHeun(i) = yHeun(i-1) + m * h;
end
plot(x,yHeun,'g')
hold on

% Punto medio ----------------
for i=2:n
    k2 = dy(x(i-1)+h/2);
    m = k2;
    yPm(i) = yPm(i-1) + m * h;
end
plot(x,yPm,'m')
hold on

% Ralston --------------------
for i=2:n
    k1 = dy(x(i-1));
    k2 = dy(x(i-1)+(h*3/4));
    m = (k1 + 2*k2)/3;
    yRalston(i) = yRalston(i-1) + m * h;
end
plot(x,yRalston,'k')
hold on

% Butcher -------------------
for i=2:n
    k1 = dy(x(i-1));
    k2 = dy(x(i-1)+(h/4));
    k3 = dy(x(i-1)+(h/4));
    k4 = dy(x(i-1)+(h/2));
    k5 = dy(x(i-1)+(h*3/4));
    k6 = dy(x(i-1)+h);
    m = (7*k1 + 32*k3 + 12*k4 + 32*k5 + 7*k6)/90;
    yButcher(i) = yButcher(i-1) + m * h;
end
plot(x,yButcher,'r')
hold on

disp('    X      Y-Euler     Y-Heun     Y-Pm      Ralston     Butcher')
disp([x' yEuler' yHeun' yPm' yRalston' yButcher'])

disp('Analisis: Con un intervalo de 0.5 se puede ver que Butcher da la mejor aproximacion a la solucion. Butcher tiene el valor exacto de la solucion en el valor del intervalo y se aleja menos que los otros metodos. Cuando el intervalo es muy pequenio  Punto Medio, Ralston y Butcher se aproximan casi igua a la solucin mientras que Euler sigue siendo el ultimo que se acerca. Euler es exacto en polinomios de primer grado mientras que los otros metodos son de grado 2 y Butcher es exacto para polinomios de 5 grado. Como nuestro polinomio es de 4 grado Butcher es el que da valores exactos.')

legend('Real','Euler', 'Heun', 'Punto medio', 'Ralston', 'Butcher', 'location', 'northwest')
hold off