% Exemplo de an�lise da resposta transit�ria
clear
clc
T=1;
Gz=tf([0.4673  -0.3393],[1 -1.5327 0.6607],T);
figure(1)
step(Gz)
% clicando  com o bot�o direito do mouse na parte branca do gr�fico
% na op��o characteristics � possivel verificar os seguintes par�metros
% peak response - tempo de pico
% settling time - tempo de acomoda��o
% rise time - tempo de subida
% stead state - valor de regime permanente

% em properties/options � poss�vel escolher os parametros 
% de tempo de subida e tempo de acomoda��o

% armazenamento dos parametros considerando tempo de acomoda��o de 5%
 parametros = stepinfo(Gz,'SettlingTimeThreshold', 0.05)
 tempo_de_acomodacao=parametros.SettlingTime
 sobressinal=parametros.Overshoot