% Exemplo de Equacionamento da função de transferência discreta de sistemas
% malha fechada
% Slide 03
clear
clf
clc

% Funções de Transferência Contínuas

Gs=tf(1,[1 1]);
Hs=tf(1,[1 0]);

% Período de amostragem

T = .2;

Gz=c2d(Gs,T);
Hz=c2d(Hs,T);
GHz=c2d(Gs*Hs,T);

% Função de Transferência em malha fechada
% Caso a) medidor analógico
FTMFa=minreal(Gz/(1+GHz))  % não é possivel usar o comando feedback
figure(1)
subplot(2,1,1)
step(FTMFa)
axis([0 16 -0.2 0.6])
grid


% Função de Transferência em malha fechada
% Caso b) medidor digital
FTMFb=feedback(Gz,Hz)  % ou  minreal(Gz/(1+Gz*Hz))
subplot(2,1,2)
step(FTMFb)
axis([0 16 -0.2 0.6])
grid

