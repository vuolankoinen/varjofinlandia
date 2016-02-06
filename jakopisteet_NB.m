function Usk = jakopisteet_NB(sanat, osakoko)

%% jakopisteet_NB(sanat)
%% Naive Bayes: K?ytet??n ns. sanapussi-mallia tekstin kuvaamiseksi, ts. oletetaan sanojen m??rien noudattavan multinomijakaumaa.                  %% Parametrina sanavektori ja oletettu pienin mahdollinen osakoko
%% Palauttaa kunkin indeksin uskottavuuden jakokohtana.

frekv = accumarray(sanat, ones(1,length(sanat)));
frekv1osa = accumarray(sanat,[ones(1,10) zeros(1,length(sanat)-osakoko)]);
frekv2osa = frekv - frekv1osa;
uskottavuudet = zeros(length(sanat), 4);
for (san = osakoko+1:length(sanat)-osakoko-1)
  frekv1osa(sanat(san)) = frekv1osa(sanat(san)) + 1;
  frekv2osa(sanat(san)) = frekv2osa(sanat(san)) - 1;
  ln_toden1 = log((frekv1osa + 1)./(san + length(frekv))); % Laplace-korjaus on mukana n?iss?.                                                     
  ln_toden2 = log((frekv2osa + 1)./(length(sanat) - san + length(frekv))); % Laplace-korjaus on mukana n?iss?.                                     
  uskottavuudet(san, 1) = sum(ln_toden1.*frekv1osa);
  uskottavuudet(san, 2) = sum(ln_toden2.*frekv1osa);
  uskottavuudet(san, 3) = sum(ln_toden1.*frekv2osa);
  uskottavuudet(san, 4) = sum(ln_toden2.*frekv2osa);
end

uskottavuudet = uskottavuudet(osakoko+1:end-1-osakoko,:);
Usk = uskottavuudet(:,1) -uskottavuudet(:,2) +uskottavuudet(:,4) -uskottavuudet(:,3);
