# Lukee tiedoston sana sanalta, kirjoittaa analyysiä varten tiedoston, jossa kutakin sanaa
# vastaa numero omalla rivillään, ja taulukon, josta numeroita vastaavat sanat löytyvät.

BEGIN {RS = "[^a-öA-Ö]+"
seuraava_indeksi = 1}

{teksti = teksti NR ": " $0 "\n"}
{$0 = tolower($0)}  # Taivutuksiinkin pitäisi kait kiinnittää jotenkin huomiota?
{if (numerot[$0] == 0) {
	numerot[$0] = seuraava_indeksi++
    }
}
{data = data numerot[$0] "\n"}

END { print teksti "" > "teksti"
print data "" > "data"
for (var in numerot) {print " " numerot[var] ": " var > "taulukko"}
}
