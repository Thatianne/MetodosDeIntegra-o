function [distancia,erro] = trapezoidalV2()
m = 68.1;   
g = 9.81;    
c = 0.25;
format long;

prompt = 'Digite o tempo inicial: ';
t0 = input(prompt);

prompt2 = 'Digite o tempo final: ';
t = input(prompt2);

a = sqrt(g * m/c);
b = sqrt(g * c/m);

fprintf('a =%d', a);
fprintf('\nb =%d', b);

sym v(t) 
v(t) = a*tanh(b*t);

syms  z(t,t0)

velIni = v(t0); 
velFim = v(t);

z(t0,t) = ((velIni + velFim)/2) * (t - t0);

tmedio = (t - t0)/2;

fprintf('velocidade no tempo médio: %d', v(tm));

v2(t) = diff(v(t),t, 2);

e(t,t0) = (-1/12) * v2(tmedio) *((t - t0)^3);

distancia = z(0,6);
erro = e(0,6);

fprintf('Distância: %d', distancia);
fprintf('Erro: %d', erro);
