% Equipo 7 Práctica 2
%     Marco Mancha        A01206194
%     Hugo Torres         A01701017
%     Rodolfo Martinez    A01700309
%
%
% Este programa implementa el metodo de biseccion
% para encontrar raices de ecuaciones lineales.
%
% Datos de entrada:
%
% -- Funcion (continua)
% -- Intervalo (debe contener la raiz)
% -- Tolerancia
%
% Datos de salida:
% -- Raiz.
% -- ERPa.
%
% Ejercicio 1:
%
% Funcion entre apostrofes: '((9.81) * (68.1)/x) *  (1 - exp(-(x/68.1)*10))-40'
% Extremo inferior: 14
% Extermo superior: 16
% Tolerancia: 0.005
% Para terminar el programa dar 0 como extremos inferior y superior.
%
% Ejercicio 2:
%
% Funcion entre apostrofes: 'abs(x^2 * cos(sqrt(x))) - 5'
% Extremo inferior: 0
% Extermo superior: 100
% Tolerancia: 0.001
% Para terminar el programa dar 0 como extremos inferior y superior.

% ------------------------------------------------------------------------------------%

  clc
  clear all
  close all
  format long

  %Pedir funcion al usuario

  cadena = input('Dame la funcion continua (entre apostrofes) : ');

  fun = inline(cadena);


  %Pedir intervalos

  intervalos = 0;

  while(intervalos == 0)

    disp('Para terminar el programa presiona  -> 0 2 veces');

    a = input('Dame el extremo inferior del intervalo: ');
    b = input('Dame el extremo superior del intervalo: ');

    %Pedir tolerancia

    tol = input('Dame la tolerancia: ');

    anterior = 0;
    ERPa = 100;

    fa = fun(a);
    fb = fun(b);

    if fa * fb < 0
      %seguir con la programacion

      intervalos = 1;

      while(ERPa > tol)

        c = (a+b) / 2 ;
        ERPa = abs((c - anterior) / c) * 100 ;

        fc = fun(c);

        fprintf('Valor c: %d \n\n', c);
        fprintf('Valor ERPA: %d \n\n', ERPa);

        if(fc == 0)
          %mostrar resultado y terminar
          fprintf('Lucky guy \n\n');
          fprintf('La raiz es: %d \n ', c);
          return
        else
        %seguir trabajando
          if(fa*fc < 0)
            %la raiz esta en el intervalo de la izquierda
            b = c;
            fb = fc;
          else
            %la raiz esta en el intervalo de la derecha
            a = c;
            fa = fc;
           endif;
        endif;

        anterior = c;

       endwhile;

       fprintf('La raiz es: %d \n\n', c);
       fprintf('Valor ERPA: %d \n\n', ERPa);

    elseif(a == 0 && b == 0)
        return
    else
      %terminar
      disp('Los datos son invalidos.');
     endif;

   endwhile;
