a=0.3;
b=0.7;
T=1;
% fun��o de transfer�ncia
Gz=tf(b,[1 -a],T)
FTMF=Gz/(1+Gz);
FTMF=minreal(FTMF);
step(FTMF)
hold on

% com equa��o recursiva
y(1)=0   % condi��o inicial  k=0, j=1
k=0:20;
r=ones(1,length(k));

%equa��o recursiva da malha fechada
% com FTMF(z)
for j=2:21
    y(j)=0.7*r(j-1)-0.4*y(j-1);
end
plot(k*T,y,'*')


% com equa��o recursiva da malha aberta
% com G(z) e E(z)
y2(1)=0   % condi��o inicial  k=0, j=1
k=0:20;
r=ones(1,length(k));
e(1)=r(1)-y2(1); % condi��o inicial  k=0, j=1

%equa��o recursiva da malha aberta
for j=2:21
    y2(j)=b*e(j-1)+a*y2(j-1);
    e(j)=r(j)-y2(j);
end
plot(k*T,y2,'o')


hold off