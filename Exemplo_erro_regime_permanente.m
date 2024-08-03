% análise do erro em regime permanante
% entrada tipo rampa
clc
clear
format long
Gs=tf(1,[1 1 0])
T=1;
Gz=c2d(Gs,T);
FTMA=Gz

% importante, erro em regime permanente é calculado a partir 
% da função de transferência de laço aberto
aux=minreal(tf([1 -1],[1 0],T)*FTMA);  % onde tf([1 -1],[1 0],T) = (z-1)/z = 1-z^-1
[n,d]=tfdata(aux,'v')
kv=(polyval(n,1)/polyval(d,1))/T   % substituindo 1 em aux
ess=1/kv


% erro pode ser verificado a partir da FTMF como sendo a diferenã entre a
% entrada e a saída
% porém isto só é possível neste caso por que a realimentação é unitária
% coso não seja unitária, deve ser observado o sinal de saída do somador

FTMF=feedback(Gz,1);
t=0:T:30;
rampa=t;
saida=lsim(FTMF,rampa,t);
figure(1)
plot(t,rampa,'*',t,saida,'+')
erro=rampa(end)-saida(end)
