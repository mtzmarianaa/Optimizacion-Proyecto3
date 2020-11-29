function [g] = restricciones(w)
% Restricciones de desigualdad para el problema geométrico
% IN
%   w: vector de 2(n-1) con coordenadas polares de vértices del polígono
% OUT
%   g: vector de n(n-1)/2 con las restricciones
% Optimización numérica 2020
% 24.nov.20

[dimension2, ~] = size(w);
n = floor( dimension2/2 ) + 1;

gx = [];
gth = zeros(5*(n - 1), 1);

for k = 1:( n - 1 )
    rk = w(k);  % el vector esta dividido, las primeras son los modulos
    thetak = w(n+k); % los segundos son los angulos
    
    for i = ( k + 1 ):n
        ri = w( i );
        thetai = w( n + i );
        aux = rk * rk + ri * ri - 2 * rk * ri * cos( thetak - thetai );
        gx = [gx; 1-aux];
        gx = [gx; aux - 0.4]; % que nunca un punto se junte con el otro
    end
    
    gth( k, 1 ) = w( n + k + 1 ) - thetak;
    gth( k + n, 1) = thetak;
    gth( k + 2*n, 1 ) = pi - thetak;
    gth( k + 3*n, 1 ) = rk;
    gth( k + 4*n, 1 ) = 1 - rk;
    
end


g = [gx;gth];





end