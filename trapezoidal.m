% ***** Método Trapezoidal *****
% Pedro Gomes e Thatianne Carvalho
% massa - m, gravidade - g, constante de arraste - c, distância - z, tempo
% t0(inicial) e t(final)    erro - e

% Para o exemplo m = 68,1   t = 6   g = 9,81    c = 0,25

%disp('Digite a massa: ');
%m = input('');
%disp('Digite o tempo: ');
%t = input('');
%disp('Digite o valor da gravidade: ');
%g = input('');
%disp('Digite a constante de arrasto: ');
%c = input('');

m = 68.1;   
g = 9.81;    
c = 0.25;
t0 = 0;
t = 6;

% Cálculo da integral
va = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * t0);
vb = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * t);

z = ((va + vb)/2) * (t - t0);

% Cálculo do erro pegando o ponto médio do intervalo de tempo
tm = (t - t0)/2;
f = (sqrt(g * m/c)) * tanh(sqrt(g * c/m) * tm);

f2 = (-2 * sqrt(c) * (g^(3/2)) * tanh((sqrt(c * g)/(m)) * t) * sech((t * sqrt(g * c/m))^2 ))/(sqrt(m));

e = (-1/12) * f2 *((t - t0)^3);

fprintf('\nTrapezoidal\nDistância: %.16f (+/-) %.16f\n', z, e);

