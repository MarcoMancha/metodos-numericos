% Equipo 7
% 	Victor Hugo Torres Rivera   ----- A01701017
% 	Marco Antonio Mancha Alfaro ----- A01206194
% 	Rodolfo Martínez Guevara    ----- A01700309
%


clear all
close all
clc

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
  
  ERPa = abs((real - I)/real) * 100
  
  hold off
  
  %Simpson 1/3
  
  f = @(x) (e.^x)./x ;
  a = 0.2;
  b = 4;
  
  x1 = linspace(a,b);
  y1 = f(x1); 
  plot(x1,y1,'b');
  hold on 
  
  n = input('¿Cuantas aplicaciones de Simpson 1/3 deseas? ');
  
  h = (b-a) / (2*n);
  
  x = a:h:b;
  
  y = f(x);

  I = zeros(n,1);

%Grafica pared izquierda de la primer aplicacion:

plot([x(1) x(1)],[0 y(1)],'g')
hold on

for i=1:n
  base = x(2*i+1) - x(2*i-1);
  alturaProm = (y(2*i-1) + 4 * y(2*i) + y(2*i+1))/6;
  I(i) = base * alturaProm;
  
  plot([x(2*i+1) x(2*i+1)],[0 y(2*i+1)],'g')  
  hold on
   
  plot([x(2*i) x(2*i)],[0 y(2*i)],'r')
  hold on
  
  %Grafica del "techo de cada aplicacion (parabola):
  
  x1 = linspace(x(2*i-1),x(2*i+1));
  y1 = zeros(100,1);
  A = [x(2*i-1) y(2*i-1); x(2*i) y(2*i) ; x(2*i+1) y(2*i+1)];
  for k=1:100
  L = ones(3,1);
    for z=1:3
        for j=1:3
            if j != z
              L(z) =  L(z) .* ( (x1(k) - A(j,1)) /  (A(z,1)- A(j,1)) );
            end;
        endfor;   
    endfor;
    y1(k) =  sum(L.*A(:,2));
  end
  plot(x1,y1,'m');
  hold on
end

  Integral = sum(I) 
  
  %TRAMPA:
  %Calculo del area "real"
  
  Real = quadl(f,a,b);
  
  %Calculo del error:
  
  ERPa = abs((Real - Integral)/Real) * 100
  
  %Simspon 3/8
  
  hold off
  
   fun = @(x) (e.^x)./x ;

a = 0.2;
b = 4;

%Grafica de la curva:

x1 = linspace(a,b);
y1 = fun(x1);
plot(x1,y1,'b');
hold on


%Numero de aplicaciones

n = input('¿Cuantas aplicaciones de Simpson 3/8 deseas? ')

%Tamaño de paso: 

h = (b-a) / (3*n)

x = a:h:b;
y = fun(x);

I = zeros(n,1);

%Grafica pared izquierda de la primer aplicacion:

plot([x(1) x(1)],[0 y(1)],'g')
hold on

for i=1:n
  base = x(3*i+1) - x(3*i-2);
  alturaProm = (y(3*i-2) + 3*y(3*i-1) + 3*y(3*i) + y(3*i+1))/8;
  I(i) = base * alturaProm;
  
  %Calcular la grafica de la pared derecha de cada aplicacion
  plot([x(3*i+1) x(3*i+1)],[0 y(3*i+1)],'g')  
  hold on
   
   %Grafica de las paredes centrales de cada aplicacion
  plot([x(3*i-1) x(3*i-1)],[0 y(3*i-1)],'r')
  hold on
  
    plot([x(3*i) x(3*i)],[0 y(3*i)],'r')
  hold on
  
  %Grafica del "techo de cada aplicacion (cubica):
  
  x1 = linspace(x(3*i-2),x(3*i+1));
  y1 = zeros(100,1);
  A = [x(3*i-2) y(3*i-2); x(3*i-1) y(3*i-1) ; x(3*i) y(3*i); x(3*i+1) y(3*i+1)];
  for k=1:100
  L = ones(4,1);
    for z=1:4
        for j=1:4
            if j != z
              L(z) =  L(z) .* ( (x1(k) - A(j,1)) /  (A(z,1)- A(j,1)) );
            end;
        endfor;   
    endfor;
    y1(k) =  sum(L.*A(:,2));
  end
  plot(x1,y1,'m');
  hold on
end

  Integral = sum(I)
  
  %TRAMPA:
  %Calculo del area "real"
  
  Real = quadl(fun,a,b);
  
  %Calculo del error:
  
  ERPa = abs((Real - Integral)/Real) * 100
  
  hold off
  
  %Simpson 1/3 y simpson 3/8
  
  fun = @(x) (e.^x)./x ;

a = 0.2;
b = 3.30;

%Grafica de la curva:

x1 = linspace(a,b);
y1 = fun(x1); 
plot(x1,y1,'b');
hold on

%Numero de aplicaciones

n = input('¿Cuantas aplicaciones de Simpson 1/3 deseas? ');

%Tamaño de paso: 

h = (b-a) / (2*n);

x = a:h:b;
y = fun(x); %Tenemos que poner los valores como matriz si no se conoce la funcion.

I = zeros(n,1);

%Grafica pared izquierda de la primer aplicacion:

plot([x(1) x(1)],[0 y(1)],'g')
hold on

for i=1:n
  base = x(2*i+1) - x(2*i-1);
  alturaProm = (y(2*i-1) + 4 * y(2*i) + y(2*i+1))/6;
  I(i) = base * alturaProm;
  
  plot([x(2*i+1) x(2*i+1)],[0 y(2*i+1)],'g')  
  hold on
   
  plot([x(2*i) x(2*i)],[0 y(2*i)],'r')
  hold on
  
  %Grafica del "techo de cada aplicacion (parabola):
  
  x1 = linspace(x(2*i-1),x(2*i+1));
  y1 = zeros(100,1);
  A = [x(2*i-1) y(2*i-1); x(2*i) y(2*i) ; x(2*i+1) y(2*i+1)];
  for k=1:100
  L = ones(3,1);
    for z=1:3
        for j=1:3
            if j != z
              L(z) =  L(z) .* ( (x1(k) - A(j,1)) /  (A(z,1)- A(j,1)) );
            end;
        endfor;   
    endfor;
    y1(k) =  sum(L.*A(:,2));
  end
  plot(x1,y1,'m');
  hold on
end

  Integral = sum(I) ;
  
  a = 3.30
  b = 4
  n = input('¿Cuantas aplicaciones de Simpson 3/8 deseas? ')
%Tamaño de paso: 

h = (b-a) / (3*n)

x = a:h:b;
y = fun(x);

I = zeros(n,1);

%Grafica pared izquierda de la primer aplicacion:

plot([x(1) x(1)],[0 y(1)],'g')
hold on

for i=1:n
  base = x(3*i+1) - x(3*i-2);
  alturaProm = (y(3*i-2) + 3*y(3*i-1) + 3*y(3*i) + y(3*i+1))/8;
  I(i) = base * alturaProm;
  
  %Calcular la grafica de la pared derecha de cada aplicacion
  plot([x(3*i+1) x(3*i+1)],[0 y(3*i+1)],'g')  
  hold on
   
   %Grafica de las paredes centrales de cada aplicacion
  plot([x(3*i-1) x(3*i-1)],[0 y(3*i-1)],'r')
  hold on
  
    plot([x(3*i) x(3*i)],[0 y(3*i)],'r')
  hold on
  
  %Grafica del "techo de cada aplicacion (cubica):
  
  x1 = linspace(x(3*i-2),x(3*i+1));
  y1 = zeros(100,1);
  A = [x(3*i-2) y(3*i-2); x(3*i-1) y(3*i-1) ; x(3*i) y(3*i); x(3*i+1) y(3*i+1)];
  for k=1:100
  L = ones(4,1);
    for z=1:4
        for j=1:4
            if j != z
              L(z) =  L(z) .* ( (x1(k) - A(j,1)) /  (A(z,1)- A(j,1)) );
            end;
        endfor;   
    endfor;
    y1(k) =  sum(L.*A(:,2));
  end
  plot(x1,y1,'m');
  hold on
end

  Integral2 = sum(I);
  
  Integral3 = Integral + Integral2
  
  %TRAMPA:
  %Calculo del area "real"
  
  Real = quadl(fun,0.2,4);
  
  %Calculo del error:
  
  ERPa = abs((Real - Integral3)/Real) * 100