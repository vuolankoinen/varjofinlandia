%% Tämän tiedoston koodi ei pyri datan analysointiin vaan analyysin uskottavuuden varmistamiseen.

data = dlmread('data');
varit = 'rbgrbg'

%% Mitä analyysi antaa jakopisteiden uskottavuuksiksi, kun sanat vain sekoitetaan? 

hold off
for (tt = 1:6)
  testidata1 = empirical_rnd(data);
  testiuskottavuudet1 = vertcat(zeros(1,10)', jakopisteet_NB(testidata1, 10));
  plot (linspace(1,length(testidata1),length(testiuskottavuudet1)), testiuskottavuudet1,varit(tt))
  hold on
end
hold off

%% Mitä analyysi antaa jakopisteiden uskottavuuksiksi, kun simuloidaan arvioiden
%% sanojen todennäköisyyksiksi niiden havaitut frekvenssit?

hold off
for (tt = 1:6)
  testidata2 = empirical_rnd(data, rows(data), 1);
  testiuskottavuudet2 = vertcat(zeros(1,10)', jakopisteet_NB(testidata2, 10));
  plot (linspace(1,length(testidata2),length(testiuskottavuudet2)), testiuskottavuudet2,varit(tt))
  hold on
end
hold off
