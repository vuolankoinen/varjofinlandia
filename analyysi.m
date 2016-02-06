data = dlmread('data');
frekv = accumarray(data,ones(1,length(data)));

%% Naive Bayes                                                                                                                                      
%% K?ytet??n ns. sanapussi-mallia tekstin kuvaamiseksi, ts. oletetaan sanojen m??rien noudattavan multinomijakaumaa.                                
  uskottavuudet = vertcat(zeros(1,10)', jakopisteet_NB(data, 10));

plot (linspace(1,length(data),length(uskottavuudet)), uskottavuudet) % K?yr?n piikit ovat lupaavia jakopisteit?.                   

%% Edellisen menetelman testaus tunnetulla mallilla:
%% Jakopisteet ovat 201 ja 6201.

testidata = horzcat((round(rand(1,200)*30)+1), round((rand(1,6000)*22)+8), (round(rand(1,length(data) - 6200)*22)+1))';
testiuskottavuudet = vertcat(zeros(1,10)', jakopisteet_NB(testidata, 10));

plot (linspace(1,length(testidata),length(testiuskottavuudet)), testiuskottavuudet,'r')
scatter([201, 6201], testiuskottavuudet([201, 6201]), 'g', 'filled')
hold off

% Testiaineisto, jossa todellista jakopistettä ei ole:
testidata2 = (round(rand(1,length(data))*62)+1)';
testiuskottavuudet2 = vertcat(zeros(1,10)', jakopisteet_NB(testidata2, 10));

plot (linspace(1,length(testidata2),length(testiuskottavuudet2)), testiuskottavuudet2,'r')
