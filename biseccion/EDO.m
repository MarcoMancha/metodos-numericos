% Equipo 8
% Victor Hugo Torres Rivera
% Marco Mancha Alfaro
% Rodolfo Martinez Guevara
% 
% Metodos de Runge-Kutta
% 

clear all
close all
clc

dy = @(x,y) y.*sin(x).*sin(x).*sin(x);

a=0;
b=3;

h=0.5;

cond = [0 1];

% Funcion real
fun = @(x) exp(-cos(x) + cos(x).*cos(x).*cos(x)./3 + 2./3);

x=a:h:b;
yReal = fun(x);
plot(x,yReal)
title('Metodos de Runge-Kutta')
hold on


x = a:h:b;
x = x'
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
    m = dy(x(i-1), yEuler(i-1));
    yEuler(i) = yEuler(i-1) + m * h;
end
plot(x,yEuler)
hold on

% Heun ----------------------
for i=2:n
    k1 = dy(x(i-1), yHeun(i-1));
    k2 = dy(x(i-1)+h,yHeun(i-1)+k1*h);
    m = (k1 + k2)/2;
    yHeun(i) = yHeun(i-1) + m * h;
end
plot(x,yHeun,'g')
hold on

% Punto medio ----------------
for i=2:n
    k1 = dy(x(i-1),yPm(i-1));
    k2 = dy(x(i-1)+h/2, yPm(i-1)+k1*h/2);
    m = k2;
    yPm(i) = yPm(i-1) + m * h;
end
plot(x,yPm,'m')
hold on

% Ralston --------------------
for i=2:n
    k1 = dy(x(i-1),yRalston(i-1));
    k2 = dy(x(i-1)+(h*3/4),yRalston(i-1)+3*k1*h/4);
    m = (k1 + 2*k2)/3;
    yRalston(i) = yRalston(i-1) + m * h;
end
plot(x,yRalston,'k')
hold on

% Butcher -------------------
for i=1:n-1
    k1 = dy(x(i),yButcher(i));
    k2 = dy(x(i)+h/4,yButcher(i)+k1*h/4);
    k3 = dy(x(i)+h/4,yButcher(i)+k1*h/8 + k2*h/8);
    k4 = dy(x(i)+h/2,yButcher(i)-k2*h/2 + k3*h);
    k5 = dy(x(i)+3*h/4,yButcher(i)+3*k1*h/16+9*k4*h/16);
    k6 = dy(x(i)+h,yButcher(i)-3*k1*h/7+2*k2*h/7+12*k3*h/7-12*k4*h/7+8*k5*h/7);
  
    m = (7*k1 + 32*k3 + 12*k4 + 32*k5 + 7*k6)/90;
    yButcher(i+1) = yButcher(i) + m * h;
end
plot(x,yButcher,'r')
hold on

[i,j] = ode45(dy,[0 1],[0 1]);
plot(i,j(:,2),'g')
hold on

fun = @(x) exp(-cos(x) + (cos(x).^3)/3 + 2/3);
yreal = fun(x);
plot(x,yreal,'y')
hold on


legend('Real','Euler', 'Heun', 'Punto medio', 'Ralston', 'Butcher','Ode45', 'location', 'northwest')


disp("   x         yReal     yEuler    yHeun     PM        Ralston   Butcher")
disp([x,yreal,yEuler,yHeun,yPm,yRalston,yButcher])