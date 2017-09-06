data = dlmread('data');
frekv = accumarray(data,ones(1,length(data)));

%% Naive Bayes                                                                                                                                      
%% Käytetään ns. sanapussi-mallia tekstin kuvaamiseksi, ts. oletetaan sanojen määrien noudattavan multinomijakaumaa.                                
uskottavuudet = jakopisteet_NB(data, 10);

plot (linspace(1,length(data),length(uskottavuudet)), uskottavuudet) % Käyrän piikit ovat lupaavia jakopisteitä.
