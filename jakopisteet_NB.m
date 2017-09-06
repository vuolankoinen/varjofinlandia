function Usk = jakopisteet_NB(sanat, osakoko)
  
  %% u = jakopisteet_NB(sanat)
  %% Naive Bayes: Käytetään ns. sanapussi-mallia tekstin kuvaamiseksi, ts. oletetaan sanojen määrien noudattavan multinomijakaumaa.
  %% Parametrina sanavektori ja oletettu pienin mahdollinen osakoko
  %% Palauttaa kunkin indeksin uskottavuuden jakokohtana.
  
  frekv = accumarray(sanat, ones(1,length(sanat)));
  frekv1osa = accumarray(sanat,[ones(1,osakoko) zeros(1,length(sanat)-osakoko)]);
  frekv2osa = frekv - frekv1osa;
  uskottavuudet = zeros(length(sanat), 4);
  for (san = osakoko+1:length(sanat)-osakoko-1)
    frekv1osa(sanat(san)) = frekv1osa(sanat(san)) + 1;
    frekv2osa(sanat(san)) = frekv2osa(sanat(san)) - 1;
    ln_uskott1 = log((frekv1osa + 1)./(san + length(frekv))); % Laplace-korjaus on mukana näissä.
    ln_uskott2 = log((frekv2osa + 1)./(length(sanat) - san + length(frekv)));
    uskottavuudet(san, 1) = sum(ln_uskott1.*frekv1osa);
    uskottavuudet(san, 2) = sum(ln_uskott2.*frekv1osa);
    uskottavuudet(san, 3) = sum(ln_uskott1.*frekv2osa);
    uskottavuudet(san, 4) = sum(ln_uskott2.*frekv2osa);
  end

  uskottavuudet = uskottavuudet(osakoko+1:end-osakoko,:);
  Usk = uskottavuudet(:,1) -uskottavuudet(:,2) +uskottavuudet(:,4) -uskottavuudet(:,3);
  Usk =  [zeros(1,osakoko) Usk'  zeros(1,osakoko)];
