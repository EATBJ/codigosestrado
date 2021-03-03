function rdm = rd_matrix(kfold,cc)
%Cria uma matriz de kfold x cc de numeros sem repetição
%1- As classes devem ser balanceadas
%2- N° de aquivos de teste é igual a 10% dos arquivos da classe
%kfold - n° de folds da validação cruzada
%cc - n° de arquivos de teste por classe
r = zeros(kfold,cc);
i = kfold;
for j = 1:i
    y = ((cc*j)-(cc-1));
    z = cc*j;
r(j,:) = y:1:z;
end
rdn = zeros(kfold,cc);
w = ones(kfold,cc);
p = zeros(kfold,cc);
for j = 1:kfold
    for i=1:cc
        rdn(j,i) = unidrnd((kfold*cc),1,1);
        p = find(r == rdn(j,i));
%         p(j,i) = p;
        if w(p) == 0
            while w(p) == 0
            rdn(j,i) = unidrnd((kfold*cc),1,1);
            p = find(r == rdn(j,i));
            end
        end
         w(p) = 0;
         p(j,i) = p;
    end
% rdnn = rdn(j,:);
end
rdm = rdn;