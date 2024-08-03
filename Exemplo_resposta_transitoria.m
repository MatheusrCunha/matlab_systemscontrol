% Exemplo de análise da resposta transitória
clear
clc
T=1;
Gz=tf([0.4673  -0.3393],[1 -1.5327 0.6607],T);
figure(1)
step(Gz)
% clicando  com o botão direito do mouse na parte branca do gráfico
% na opção characteristics é possivel verificar os seguintes parâmetros
% peak response - tempo de pico
% settling time - tempo de acomodação
% rise time - tempo de subida
% stead state - valor de regime permanente

% em properties/options é possível escolher os parametros 
% de tempo de subida e tempo de acomodação

% armazenamento dos parametros considerando tempo de acomodação de 5%
 parametros = stepinfo(Gz,'SettlingTimeThreshold', 0.05)
 tempo_de_acomodacao=parametros.SettlingTime
 sobressinal=parametros.Overshoot