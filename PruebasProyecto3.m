%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pruebas para el proyecto 3
% Optimización Numérica
% Otoño 2020

clc
close all

n = input('Da el numero de vertices:\n _');
x0 = [ones(n-1,1).*0.2; linspace(0,pi,n-1)'];

th = x0( n:(2*(n-1)) );
r = x0( 1:(n-1) );

%%% Graficamos la figura inicial
figure(1)
polarplot([0;th;0],[0;r;0], '-o')


fobjj = 'perimetro';
fineqq = 'restricciones';

[xstar, fx, output] = puntosInteriores(fobjj, fineqq, x0);

thstar = xstar(n:(2*(n-1)));
rstar = xstar(1:(n-1));

% Para graficar el circulo unitario
%need centres for demo purposes
xc = 0 * 5; yc = 0.5;
%the work
th = linspace(0,2*pi,50);
r = 0.5;
[x,y] = pol2cart(th,r);
[th1, r1] = cart2pol( x+xc, y+yc );

%%% Graficamos la figura optima
figure(2)
polarplot([0;thstar;0],[0;rstar;0], '-o')
hold on
polarplot(th1, r1);

xCart = [];
yCart = [];
for k = 1:(n-1)
    [xCart(k), yCart(k)] = pol2cart(thstar(k), rstar(k));
end

xCart = [0 xCart 0];
yCart = [0 yCart 0];

figure(3)
plot(xCart,yCart, '-x')

fig = 1;


for n = 3:7
    x0 = [ones(n-1,1).*0.2; linspace(0,pi,n-1)'];

    th = x0( n:(2*(n-1)) );
    r = x0( 1:(n-1) );
    
    
    %%% Graficamos la figura inicial
    %figure(fig)
    %polarplot([0;th;0],[0;r;0], '-o')


    %fig = fig+1;
    
    fobjj = 'perimetro';
    fineqq = 'restricciones';

    [xstar, fx, output] = puntosInteriores(fobjj, fineqq, x0);

    thstar = xstar(n:(2*(n-1)));
    rstar = xstar(1:(n-1));

    %%% Graficamos la figura optima
    figure(fig)
    polarplot([0;thstar;0],[0;rstar;0], '-o')
    
    fig = fig+1;

    xCart = [];
    yCart = [];
    for k = 1:(n-1)
        [xCart(k), yCart(k)] = pol2cart(thstar(k), rstar(k));
    end

    xCart = [0 xCart 0];
    yCart = [0 yCart 0];

    %figure(fig)
    %plot(xCart,yCart, '-x')
    
    %fig = fig +1;
    
end


