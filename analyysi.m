data = dlmread('data');
frekv = accumarray(data,ones(1,length(data)));

%% Naive Bayes                                                                                                                                      
%% K?ytet??n ns. sanapussi-mallia tekstin kuvaamiseksi, ts. oletetaan sanojen m??rien noudattavan multinomijakaumaa.                                

sanoja1osa = 10; sanoja2osa = length(data)-sanoja1osa;
frekv1osa = accumarray(data,[ones(1,10) zeros(1,length(data)-sanoja1osa)]);
frekv2osa = frekv - frekv1osa;
uskottavuudet = zeros(length(data), 4);
for (san = sanoja1osa+1:length(data)-sanoja1osa-1)
  frekv1osa(data(san)) = frekv1osa(data(san)) + 1;
  frekv2osa(data(san)) = frekv2osa(data(san)) - 1;
  ln_toden1 = log((frekv1osa + 1)./(san + length(frekv))); % Laplace-korjaus on mukana n?iss?.                                                      
  ln_toden2 = log((frekv2osa + 1)./(length(data) - san + length(frekv))); % Laplace-korjaus on mukana n?iss?.                                       
  uskottavuudet(san, 1) = sum(ln_toden1.*frekv1osa);
  uskottavuudet(san, 2) = sum(ln_toden2.*frekv1osa);
  uskottavuudet(san, 3) = sum(ln_toden1.*frekv2osa);
  uskottavuudet(san, 4) = sum(ln_toden2.*frekv2osa);
end

uskottavuudet = uskottavuudet(sanoja1osa+1:end-1-sanoja1osa,:);

yhteisuskottavuus = uskottavuudet(:,1) -uskottavuudet(:,2) +uskottavuudet(:,4) -uskottavuudet(:,3);

plot (linspace(sanoja1osa,length(data),length(yhteisuskottavuus)), yhteisuskottavuus) % K?yr?n piikit ovat lupaavia jakopisteit?.                   
1
