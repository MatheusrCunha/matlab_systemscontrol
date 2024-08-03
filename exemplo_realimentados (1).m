% Exemplo de Equacionamento da fun��o de transfer�ncia discreta de sistemas
% malha fechada
% Slide 03
clear
clf
clc

% Fun��es de Transfer�ncia Cont�nuas

Gs=tf(1,[1 1]);
Hs=tf(1,[1 0]);

% Per�odo de amostragem

T = .2;

Gz=c2d(Gs,T);
Hz=c2d(Hs,T);
GHz=c2d(Gs*Hs,T);

% Fun��o de Transfer�ncia em malha fechada
% Caso a) medidor anal�gico
FTMFa=minreal(Gz/(1+GHz))  % n�o � possivel usar o comando feedback
figure(1)
subplot(2,1,1)
step(FTMFa)
axis([0 16 -0.2 0.6])
grid


% Fun��o de Transfer�ncia em malha fechada
% Caso b) medidor digital
FTMFb=feedback(Gz,Hz)  % ou  minreal(Gz/(1+Gz*Hz))
subplot(2,1,2)
step(FTMFb)
axis([0 16 -0.2 0.6])
grid

