% Exemplo Transformada Z

% f(k) = a^k
% F(z) = z/(z-a)

% Relação entre os polos de F(z) e a evolução temporal de f(k)
a = 0.5;
k = 0:10;
fk = a.^k;

figure(1)
subplot(1,2,1)
plot(k,fk,'*')
xlabel('k')
ylabel('f(k)')
title('evolução temporal de f(k)')



subplot(1,2,2)
zplane([],a)
title('polos de F(z)')


% para impulso em k=m:  kroneckerDelta(0:10,sym(m))