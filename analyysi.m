data = dlmread('data');
frekv = accumarray(data,ones(1,length(data)));

%% Naive Bayes                                                                                                                                      
%% K?ytet??n ns. sanapussi-mallia tekstin kuvaamiseksi, ts. oletetaan sanojen m??rien noudattavan multinomijakaumaa.                                
  uskottavuudet = vertcat(zeros(1,10)', jakopisteet_NB(data, 10));

plot (linspace(1,length(data),length(uskottavuudet)), uskottavuudet) % K?yr?n piikit ovat lupaavia jakopisteit?.                   
