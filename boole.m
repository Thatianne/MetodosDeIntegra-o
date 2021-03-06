% ***** M�todo de Boole *****
% Pedro Gomes e Thatianne Carvalho
% massa - m, gravidade - g, constante de arraste - c, dist�ncia - z, tempo
% t0(inicial) e t(final)    erro - e

% Para o exemplo m = 68,1   t = 6   g = 9,81    c = 0,25

m = 68.1;   
g = 9.81;    
c = 0.25;
t0 = 0;
t = 6;
n = 5;

h = (t - t0)/n;

values = t0+h:h:t-h;
[j, k] = size(values);

va = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * t0);
vb = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * t);
vc = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * values(1));
vd = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * values(2));
ve = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * values(3));

zb = ((t - t0)/90) * ((7*va) + (32*vc) + (12*vd) + (32*ve) + (7*vb));

% C�culo do erro
a = sqrt(g*m/c);
b = sqrt(g*c/m);

f6 = -2*a*(b^2)*((-8*(b^3)*(sech(b*t)^6)) + (44*(b^3)*(sech(b*t)^4)*(tanh(b*t)^2))-(8*b^3*(tanh(b*t)^4)*(sech(b*t)^2)));
eb = -(((t - t0)^7)/1935360) * f6;
fprintf('Boole\t\t\t\t %.16f\t\t\t %.16f\n', zb, eb);