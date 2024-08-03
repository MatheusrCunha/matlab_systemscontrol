% an�lise do erro em regime permanante
% entrada tipo rampa
clc
clear
format long
Gs=tf(1,[1 1 0])
T=1;
Gz=c2d(Gs,T);
FTMA=Gz

% importante, erro em regime permanente � calculado a partir 
% da fun��o de transfer�ncia de la�o aberto
aux=minreal(tf([1 -1],[1 0],T)*FTMA);  % onde tf([1 -1],[1 0],T) = (z-1)/z = 1-z^-1
[n,d]=tfdata(aux,'v')
kv=(polyval(n,1)/polyval(d,1))/T   % substituindo 1 em aux
ess=1/kv


% erro pode ser verificado a partir da FTMF como sendo a diferen� entre a
% entrada e a sa�da
% por�m isto s� � poss�vel neste caso por que a realimenta��o � unit�ria
% coso n�o seja unit�ria, deve ser observado o sinal de sa�da do somador

FTMF=feedback(Gz,1);
t=0:T:30;
rampa=t;
saida=lsim(FTMF,rampa,t);
figure(1)
plot(t,rampa,'*',t,saida,'+')
erro=rampa(end)-saida(end)
