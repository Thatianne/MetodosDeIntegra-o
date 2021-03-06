% **** M�todo Simpson 1/3 ****
% Pedro Gomes e Thatianne Carvalho
% massa - m, gravidade - g, constante de arraste - c, dist�ncia - z, tempo
% t0(inicial) e t(final), erro - e

% Para o exemplo m = 68,1   t = 6   g = 9,81    c = 0,25    n = 6

m = 68.1;   
g = 9.81;    
c = 0.25; 
t0 = 0;
t = 6;

tm = (t0 + t)/2;

va = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * t0);
vb = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * t);
vm = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * tm);

zs = ((t - t0)/6) * (va + (4*vm) + vb);

a = sqrt(g*m/c);
b = sqrt(g*c/m);
f4 = -2*a*b^2*(-2*b*(sech(b*tm)^2)*(tanh(b*tm)^2)+(b*sech(b*tm)^4));

es = -(((t-t0)^5)\2880)*f4;

fprintf('Simpson 1/3\t\t\t %.16f\t\t\t %.16f\n', zs, es);