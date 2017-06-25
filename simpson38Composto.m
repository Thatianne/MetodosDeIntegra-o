% **** Método Simpson 3/8 Composto****
% Pedro Gomes e Thatianne Carvalho
% massa - m, gravidade - g, constante de arraste - c, distância - z, tempo
% t0(inicial) e t(final), erro - e

% Para o exemplo m = 68,1   t = 6   g = 9,81    c = 0,25    n = 6

m = 68.1;   
g = 9.81;    
c = 0.25; 
t0 = 0;
t = 6;
n = 10;

h = (t - t0)/n;

values = t0+h:h:t-h;
[j, k] = size(values);

va = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * t0);
vb = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * t);

somatorio1 = 0;
somatorio2 = 0;

controle = 'o';
for i = 2:k
    if controle == 'o' && (rem(i, 3) ~= 0)
        somatorio1 = somatorio1 + (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * values(i)) + (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * values(i+1));
        controle = 'p';
    elseif rem(i, 3) ~= 0
        somatorio2 = somatorio2 + (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * values(i));
    end
    
end
a = sqrt(g*m/c);
b = sqrt(g*c/m);
 
zs3c = (3*h\8)*(va + (3*somatorio1) + (2*somatorio2) + vb);

pMedios = values/2;
mediaf4 = 0;
for i = 1:k
    v = -2*a*b^2*(-2*b*(sech(b*pMedios(i))^2)*(tanh(b*pMedios(i))^2)+(b*sech(b*pMedios(i))^4));    
    mediaf4 = mediaf4 + (v);
end

es3c = -(((t - t0)^5)/(180*n)^4) * mediaf4;
                                           
fprintf('Simpson3/8Comp.\t\t %.16f\t\t\t %.16f\n', zs3c, es3c); % VER ERRO
