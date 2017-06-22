% **** M�todo Trapezoidal Composto ****
% Pedro Gomes e Thatianne Carvalho
% massa - m, gravidade - g, constante de arraste - c, dist�ncia - z, tempo
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
somatorio = 0;
[j, k] = size(values);
for i = 1:k
    v = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * values(i));    
    somatorio = somatorio + (v);
end
z = ((t - t0) * (va + (2*somatorio) + vb))/(2*n);

% C�lculo do erro
pMedios = values/2;
media = 0;
for i = 1:k
    v = (-2 * sqrt(c) * (g^(3/2)) * tanh((sqrt(c * g)/(m)) * pMedios(i)) * sech((pMedios(i) * sqrt(g * c/m))^2 ))/(sqrt(m));    
    media = media + (v);
end
e = -(((t - t0)^3)/12*(n^2))* (media/n);

fprintf('Dist�ncia: %d (+/-) %d', z, e);


