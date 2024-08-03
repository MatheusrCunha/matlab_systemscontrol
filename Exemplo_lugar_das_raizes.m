clc
clear
format long
Gs=tf(1,[1 1 0])
T=1;
Gz=c2d(Gs,T);
FTMA=Gz
% importante, o lugar das raízes é traçado a partir 
% da função de transferência de laço aberto
figure(1)
rlocus(FTMA)
% deslocando o mouse encima da linha verde do lugar das raizes até encontrar
% o ganho 1, verifica-se o valor dos polos de malha fechada para este ganho
% também é possível ver os valores de fator de amortecimento e frequencia
% natural, que são os mesmos encontrado no exemplo anterior sobre
% transformada inversa com polos complexos

% os polos de malha fechada podem ser verificados a partir da FTMF
% porém o lugar das raízes já dava esta informação
FTMF=feedback(Gz,1);
pole(FTMF)
