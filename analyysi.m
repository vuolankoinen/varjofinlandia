%%Luetaan esikäsitelty runoteos tiedostosta ja analysoidaan sitä.

data = dlmread('data');
frekv = accumarray(data,ones(1,length(data)));

%% Naive Bayes
%% Käytetään ns. sanapussi-mallia tekstin kuvaamiseksi, ts. oletetaan sanojen määrien noudattavan multinomijakaumaa.

sanoja1osa = 10; sanoja2osa = length(data)-sanoja1osa;
frekv1osa = accumarray(data,[ones(1,10) zeros(1,length(data)-sanoja1osa)]);
frekv2osa = frekv - frekv1osa;
uskottavuudet = zeros(length(data), 4);
for (san = 11:length(data)-11)
  frekv1osa(data(san)) = frekv1osa(data(san)) + 1;
  frekv2osa(data(san)) = frekv2osa(data(san)) - 1;
  ln_toden1 = log((frekv1osa + 1)/(san + length(frekv))); % Laplace-korjaus on mukana näissä.
  ln_toden2 = log((frekv2osa + 1)/(length(data) - san + length(frekv))); % Laplace-korjaus on mukana näissä.
  uskottavuudet(san, 1) = sum(ln_toden1.*frekv1osa);
  uskottavuudet(san, 2) = sum(ln_toden2.*frekv1osa);
  uskottavuudet(san, 3) = sum(ln_toden1.*frekv2osa);
  uskottavuudet(san, 4) = sum(ln_toden2.*frekv2osa);
end
uskottavuudet = uskottavuudet(11:end-11,:);


1
