English summary below.

Leikittelen tässä tekstianalyysin tietoteknisten apuvälineiden kanssa. Kohdedata on Karri Kokon hakukonekollaasiruno ~~Varjofinlandia~~, jonka löytää sähköisessä muodossa Poesian nettisivustolta.

Ennen varsinaista analyysiä teos on muunnettu kokonaislukulistaksi ohjelmalla pohjustus.awk.

Ensimmäinen lähestymistapa on sähköpostiroskapostisuodattimissakin käytetty naive-Bayes-menetelmä.
Oletetaan, että tutkittava teksti koostuu kahdesta erityyppisestä tekstikatkelmasta. Käydään läpi tekstin mahdolliset saumakohdat ja lasketaan, kuinka suuren eron naive-Bayes-luokittelija tekstin puolikkaille määrää. Näin etsitään uskottavin tekstinjakokohta ja sen jälkeen tutkitaan rekursiivisesti tällä jaolla syntyneitä osia.

Huomioita.
Toistaiseksi datassa saman sanan eri taivutusmuotoja ei tunnisteta samaksi sanaksi vaan ne lasketaan erikseen.
Jatkossa tehtävien asioiden listalta löytyy peräkkäisten sanaparien tutkiminen samoin menetelmin kuin tässä yksittäisten sanojen. Tämä on helppoa toteuttaa, dataa pitää vain muokata hieman ennen täsmälleen samojen menetelmien käyttämistä.
Olisi hyvä myös kokeilla sanojen luokittelemista niiden merkityssisällön mukaan ja näiden luokkien jakaumien tutkimista yksittäisten sanojen asemesta. Tällä tavoin on Isossa-Britanniassa saatu hyviä tuloksia lajien automaattisessa tunnistamisessa tunnepitoisten sanojen esiintymisen perusteella.

***English summary***
This is an exercise in using computer technology as a tool in literary critisism. Word frequency analysis and such are applied to a work of poetry.