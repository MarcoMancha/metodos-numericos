% Equipo 7
% 	Victor Hugo Torres Rivera   ----- A01701017
% 	Marco Antonio Mancha Alfaro ----- A01206194
% 	Rodolfo Martínez Guevara    ----- A01700309
%
%Ejercicio 2
  a = 0;
  b = 20;
  
  x1 = [0 2 4 6 8 10 12 14 16 18 20]; 
  y1 = [0 1.8 2 4 4 6 4 3.6 3.4 2.8 0];
  
  plot(x1,y1,'b');
  hold off
  
  %x1 = [0 4 8 12 16 20]; 
  %y1 = [0 2 4 4 3.4 0];
  
  %plot(x1,y1,'b');
  %hold off
  
  %Simpson 1/3
  a = 0;
  b = 20;
  x = [0 2 4 6 8 10 12 14 16 18 20]; 
  y = [0 1.8 2 4 4 6 4 3.6 3.4 2.8 0];

  n = input('¿Cuantas aplicaciones de Simpson 1/3 deseas? ');
  
  n = 5;
 
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
  
  hold off
  
   a = 0;
  b = 4;
   
  x = [0 2 4]; 
  y = [0 1.8 2];

hold on

%Numero de aplicaciones

n = input('¿Cuantas aplicaciones de Simpson 1/3 deseas? ');

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
  
  a = 4;
  b = 16;
  x = [4 6 8 10 12 14 16]; 
  y = [2 4 4 6 4 3.6 3.4];

hold on
  n = input('¿Cuantas aplicaciones de Simpson 3/8 deseas? ')
%Tamaño de paso: 

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
  
  a = 16;
  b = 20;
  %Ejercicio 2 1-b 
  x = [16 18 20]; 
  y = [3.4 2.8 0];
hold on
  
%Numero de aplicaciones

n = input('¿Cuantas aplicaciones de Simpson 1/3 deseas? ');

%Tamaño de paso: 

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

  Integral0 = sum(I) ;
  
  Integral3 = Integral + Integral2 + Integral0
