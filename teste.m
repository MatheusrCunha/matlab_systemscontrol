a=0.3;
b=0.7;
T=1;
% função de transferência
Gz=tf(b,[1 -a],T)
step(Gz)
hold on

% com equação recursiva
y(1)=0   % condição inicial  k=0, j=1
k=0:20;
e=ones(1,length(k));

for j=2:21
    y(j)=b*e(j-1)+a*y(j-1)
end
plot(k*T,y,'*')

% solução exata
ye=1-a.^k;
plot(k*T,ye,'o')



hold off