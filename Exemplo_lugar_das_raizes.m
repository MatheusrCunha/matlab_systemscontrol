clc
clear
format long
Gs=tf(1,[1 1 0])
T=1;
Gz=c2d(Gs,T);
FTMA=Gz
% importante, o lugar das ra�zes � tra�ado a partir 
% da fun��o de transfer�ncia de la�o aberto
figure(1)
rlocus(FTMA)
% deslocando o mouse encima da linha verde do lugar das raizes at� encontrar
% o ganho 1, verifica-se o valor dos polos de malha fechada para este ganho
% tamb�m � poss�vel ver os valores de fator de amortecimento e frequencia
% natural, que s�o os mesmos encontrado no exemplo anterior sobre
% transformada inversa com polos complexos

% os polos de malha fechada podem ser verificados a partir da FTMF
% por�m o lugar das ra�zes j� dava esta informa��o
FTMF=feedback(Gz,1);
pole(FTMF)
