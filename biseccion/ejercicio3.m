% Equipo 7
% 	Victor Hugo Torres Rivera   ----- A01701017
% 	Marco Antonio Mancha Alfaro ----- A01206194
% 	Rodolfo Martínez Guevara    ----- A01700309
%


clear all
close all
clc


  a = 0;
  b = 0.12;
  
  x = [0 0.12]; 
  y = [0.2 1.309729 ];
  
  n = 1

  Integral = zeros(n,1);
  x = linspace(a,b,n+1);
  
  %Cuando sabes n

  for i = 1: n
      a = x(i);
      b = x(i+1);
      base = b - a;
      altura_promedio = ( y(i) + y(i+1) )/2;
      Integral(i) = base * altura_promedio;
  endfor
  
  I0 = sum(Integral)
   
  a = 0.64;
  b = 0.70;
  
  x = [0.64 0.70]; 
  y = [3.181929 2.363 ];
  
  n = 1

  Integral = zeros(n,1);
  x = linspace(a,b,n+1);
  
  %Cuando sabes n

  for i = 1: n
      a = x(i);
      b = x(i+1);
      base = b - a;
      altura_promedio = ( y(i) + y(i+1) )/2;
      Integral(i) = base * altura_promedio;
  endfor
  
   I1 = sum(Integral)
   
  a = 0.70;
  b = 0.80;
  
  x = [0.70 0.80]; 
  y = [2.363 0.232];
  
  n = 1

  Integral = zeros(n,1);
  x = linspace(a,b,n+1);
  
  %Cuando sabes n

  for i = 1: n
      a = x(i);
      b = x(i+1);
      base = b - a;
      altura_promedio = ( y(i) + y(i+1) )/2;
      Integral(i) = base * altura_promedio;
  endfor
  
  I2 = sum(Integral)
   
   
  a = 0.12;
  b = 0.32;
  
  x = [0.12 0.22 0.32]; 
  y = [1.309729 1.305241 1.743393];
  
  n = 1

  I = zeros(n,1);

  for i=1:n
    base = x(2*i+1) - x(2*i-1);
    alturaProm = (y(2*i-1) + 4 * y(2*i) + y(2*i+1))/6;
    I(i) = base * alturaProm;
  endfor

    I3 = sum(I)
   
    a = 0.44;
    b = 0.64;
    
    x = [0.44 0.54 0.64]; 
    y = [2.842985 3.5077929 3.181929];
    
    n = 1

    I = zeros(n,1);

for i=1:n
  base = x(2*i+1) - x(2*i-1);
  alturaProm = (y(2*i-1) + 4 * y(2*i) + y(2*i+1))/6;
  I(i) = base * alturaProm;
endfor;

  I4 = sum(I)  
  
  
  %3/8
  a = 0.32;
  b = 0.44;
  
  x = [0.32 0.36 0.40 0.44]; 
  y = [1.743393 2.074903 2.456 2.842985];
  
  n = 1

  I = zeros(n,1);
  
  for i=1:n
    base = x(3*i+1) - x(3*i-2);
    alturaProm = (y(3*i-2) + 3*y(3*i-1) + 3*y(3*i) + y(3*i+1))/8;
    I(i) = base * alturaProm;
  endfor;
    
  I5 = sum(I)
  
  Integral = I0+I1+I2+I3+I4+I5
  
  
  
  