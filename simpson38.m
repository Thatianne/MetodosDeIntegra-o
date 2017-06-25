% **** Método Simpson 1/3 ****
% Pedro Gomes e Thatianne Carvalho
% massa - m, gravidade - g, constante de arraste - c, distância - z, tempo
% t0(inicial) e t(final), erro - e

% Para o exemplo m = 68,1   t = 6   g = 9,81    c = 0,25    n = 6

m = 68.1;   
g = 9.81;    
c = 0.25; 
t0 = 0;
t = 6;
tm = (t+t0)/2;
n = 4;

h = (t - t0)/n;

f = t0 + h;
d = t - h;
va = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * t0);
vb = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * t);

vc = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * f);
vd = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * d);

zs3 = ((t-t0)\8) * (va + 3*vc+ 3*vd  + vb);

a = sqrt(g*m/c);
b = sqrt(g*c/m);
f4 = -2*a*b^2*(-2*b*(sech(b*tm)^2)*(tanh(b*tm)^2)+(b*sech(b*tm)^4));

es3 = -(((t-t0)^5)\6480)*f4;

fprintf('Simpson 3/8\t\t\t %.16f\t\t\t %.16f\n', zs3, es3);