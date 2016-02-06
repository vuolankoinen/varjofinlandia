data = dlmread('data');
frekv = accumarray(data,ones(1,length(data)));

%% Naive Bayes                                                                                                                                      
%% K?ytet??n ns. sanapussi-mallia tekstin kuvaamiseksi, ts. oletetaan sanojen m??rien noudattavan multinomijakaumaa.                                
  uskottavuudet = vertcat(zeros(1,10)', jakopisteet_NB(data, 10));

plot (linspace(1,length(data),length(uskottavuudet)), uskottavuudet) % K?yr?n piikit ovat lupaavia jakopisteit?.                   

%% Edellisen menetelman testaus tunnetulla mallilla:

testidata = horzcat((round(rand(1,200)*30)+1), round((rand(1,6000)*22)+8), (round(rand(1,length(data) - 6200)*22)+1))';
testiuskottavuudet = vertcat(zeros(1,10)', jakopisteet_NB(testidata, 10));

plot (linspace(1,length(testidata),length(testiuskottavuudet)), testiuskottavuudet,"r") % K?yr?n piikit ovat lupaavia jakopisteit?.                   
