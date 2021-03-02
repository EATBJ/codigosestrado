function y=j_hamm(x,T,fs)
%
% x - sinal 
% T - duração da janela (em ms)
% fs - frequencia de amostragem do sinal
%
% np - n° de pontos
% nj - n° de janelas

[lenga, ncanais] = size(x);
if ncanais == 2
    x=(x(:,1)+x(:,2))/2;
end

%Pré enfase
xp = zeros(lenga,1);
xp(1)=x(1);
for i=2:lenga
    xp(i)=x(i)-0.95*x(i-1);  
end

np=floor(T*(fs/1000));
nj=floor((length(xp)/np)*1.5);
y=zeros(nj,np);
passo=round(0.5*np);
jham = zeros(np,1);
    for n=1:np
        jham(n,1) = 0.54 - (0.46 * cos(2*pi*n/(np)));       %A definiçao da janela de hamming
    end

     for k=1:nj
        y(k,:)=xp((k-1)*passo+1:(k-1)*passo+np).*jham;
    end
end