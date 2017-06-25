% **** Método Trapezoidal Composto ****
% Pedro Gomes e Thatianne Carvalho
% massa - m, gravidade - g, constante de arraste - c, distância - z, tempo
% t0(inicial) e t(final), erro - e

% Para o exemplo m = 68,1   t = 6   g = 9,81    c = 0,25    n = 6

m = 68.1;   
g = 9.81;    
c = 0.25; 
t0 = 0;
t = 6;
n = 5;

va = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * t0);
vb = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * t);

h = (t - t0)/n;

values = t0+h:h:t-h;
somatorio = va;
[j, k] = size(values);
for i = 1:k
    v = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * values(i));    
    somatorio = somatorio + v;
end
ztc = ((t - t0) * (va + (2*somatorio) + vb))/(2*n);

% Cálculo do erro

vam = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * ((t0 + values(1))/2));
vbm = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * ((t0 + values(k))/2));

pMedios = values/2;
media = vam + vbm;
for i = 1:k
    v = (-2 * sqrt(c) * (g^(3/2)) * tanh((sqrt(c * g)/(m)) * pMedios(i)) * sech((pMedios(i) * sqrt(g * c/m))^2 ))/(sqrt(m));        
    media = media + (v);
end
etc = ((h^3)/(12)) * media; 
%fprintf('\nTrapezoidal Composto\nDistância: %.16f (+/-) %.16f\n', ztc, etc);


