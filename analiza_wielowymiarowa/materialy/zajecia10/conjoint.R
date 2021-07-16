############################
#     Analiza conjoint     #
############################

# ZADANIE 1

# Wykorzystane dane pochodza z badania ankietowego konsumentow herbat
# przeprowadzonego przez M. Baran w 2007 roku

# jesli do tej pory nie korzystalismy z biblioteki conjoint, nalezy ja zainstalowac

install.packages("conjoint")
library(conjoint)

# wczytujemy dane

data(tea)

# zbior zawiera informacje o wyborach dokonanych przez 100 respondentow. Oceniane byly atrybuty herbat:

# cena: niska, srednia, wysoka
# typ: czarna, zielona, czerowna
# rodzaj: torebki, granulowana, lisciasta
# aromatyzowana: tak, nie

# Autorka stworzyla na podstawie tych atrybutow i poziomow 13 profili (z mozliwych 54 -- pelnego ukladu czynnikowego)

# Zawartosc zbioru:
# tpref -- wektor zawierajacy preferencje respondentow (1300 obserwacji)
# tprefm -- macierz preferencji (100 respondentow i 13 profili)
# tprof -- macierz profili (4 atrybuty i 13 profili)
# tlevn -- wektor zawierajacy nazwy poziomow atrybutow
# tsimp -- macierz profili symulacyjnych

# respondenci oceniali prezentowane profile w skali do 10 -- najbardziej preferuje

# Oszacowanie uzytecznosci czastkowych
# caPartUtilities(macierz_preferencji, macierz_profili, poziomy_atrybutow)

caPartUtilities(tpref, tprof, tlevn)

#  intercept    low medium   high  black  green    red   bags granulated
#  [1,]     3.394 -1.517 -1.141  2.659 -0.475 -0.675  1.149  0.659     -1.517
#  [2,]     5.049  3.391 -0.695 -2.695 -1.029  0.971  0.057  1.105     -0.609
#  [3,]     4.029  2.563 -1.182 -1.382 -0.248  2.352 -2.103 -0.382     -2.437
#  [4,]     5.856 -1.149 -0.025  1.175 -0.492  1.308 -0.816 -0.825     -0.149

# Respondent 1 preferuje czerwona herbate lisciasta lub w torebkach aromatyzowana o wysokiej cenie

# Oszacowanie parametrow modelu w przekroju calej zbiorowosci respondentow
# Conjoint(macierz_preferencji, macierz_profili, poziomy_atrybutow)

Conjoint(tpref, tprof, tlevn)

#[1] "Part worths (utilities) of levels (model parameters for whole sample):"
#       levnms    utls
#1   intercept  3,5534
#2         low  0,2402
#3      medium -0,1431
#4        high -0,0971
#5       black  0,6149
#6       green  0,0349
#7         red -0,6498
#8        bags  0,1369
#9  granulated -0,8898
#10      leafy  0,7529
#11        yes  0,4108
#12         no -0,4108

# Najbardziej preferowana jest niska cena, czarna herbata, lisciasta aromatyzowana

#[1] "Average importance of factors (attributes):"
#[1] 24,76 32,22 27,15 15,88

# najwazniejszym czynnikiem jest typ herbaty (czarna/czerwona/zielona) pozniej rodzaj (granulowana, lisciasta, torebki) pozniej cena

#[1] Sum of average importance:  100,01
#[1] "Chart of average factors importance"

# wykresy ulatwiajace porownanie istotnosci poziomow atrybutow

# Sprobujmy zaprognozowac, jak bardzo popularne beda nowe produkty, ktore chcemy wprowadzic
# (te produkty nie byly pokazywane wczesniej respondentom)

tsimp

#  price variety kind aroma
#1     3       2    2     2
#2     1       3    1     1
#3     2       3    3     2
#4     3       1    2     1

#ShowAllSimulations(sim, macierz_preferencji, macierz_profili)

ShowAllSimulations(tsimp, tpref, tprof)

#  TotalUtility MaxUtility BTLmodel LogitModel
#1         2,19         11    18,85      13,04
#2         3,69         28    28,96      34,84
#3         3,10         26    30,14      35,79
#4         3,59         35    22,06      16,33

# mozna wywnioskowac, ze najwieksze szanse ma profil 2: herbata tania, czerwona, w torebkach, aromatyzowana (wedlug modelu lacznej uzytecznosci, btlmodel i logit model wysoko)

# ZADANIE 2

# Przeprowadz analize conjoint na zbiorze danych "czekolada"

data(czekolada)

# Zbior zawiera nastepujace obiekty:
# cpref -- macierz preferencji
# cprof -- macierz profili
# clevn -- nazwy poziomow
# cimp -- macierz profili symulacji

# 1. Sprawdz, ile oceniamy atrybutow, ile poziomow maja poszczegolne atrytuby i ile profili pokazano respondentom?

# Czy mamy do czynienia z pelnym ukladem czynnikowym? Jesli nie, to ile powinno byc profili?

# 2. Przeprowadz analize uzytecznosci czastkowych dla respondenta nr 7 i 20

# 3. Przeprowadz analize istotnosci parametrow dla calej zbiorowosci.

# ktore poziomy atrybutow sa najbardziej preferowane?

# ktore czynniki (atrybuty) w najwiekszym stopniu decyduja o wyborze czekolady?

# 4. Przeprowadz w oparciu o uzyskane wyniki symulacje szans na rynku dla propozycji produktow opisanych w csimp. Ktore produkty maja najwieksze szanse na powodzenie?