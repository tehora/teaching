############################
#     Analiza conjoint     #
############################

# ZADANIE 3

# Wykorzystane dane pochodza z badania ankietowego studentow I roku IiE
# studiow II stopnia, uczeszczajacych na przedmiot Analiza Wielowymiarowa
# przeprowadzonego w dniach 14-16 listopada 2015

# jesli do tej pory nie korzystalismy z biblioteki conjoint, nalezy ja zainstalowac

install.packages("conjoint")
library(conjoint)

# wczytujemy dane

awpref <- read.csv("awpref.csv", header=FALSE)
awprof <- read.csv("awprof.csv", header=TRUE, sep=";")
awlevn <- read.csv("awlevn.csv", header=TRUE)

# zbior zawiera informacje o wyborach dokonanych przez 50 respondentow. Oceniane byly atrybuty zasad zaliczenia:

# egzamin koncowy: tak, nie
# liczba kartkowek w semestrze: brak, 1-3, 4-7
# liczba prac domowych w semestrze: brak, 1-2, 3-7
# raport: brak, indywidualny, grupowy

# Stworzono na podstawie tych atrybutow i poziomow 9 profili (z mozliwych 54 -- pelnego ukladu czynnikowego)

# Zawartosc zbioru:
# awpref -- wektor zawierajacy preferencje respondentow (450 obserwacji)
# awprof -- macierz profili (4 atrybuty i 9 profili)
# awlevn -- wektor zawierajacy nazwy poziomow atrybutow

# respondenci oceniali prezentowane profile w skali do 10 -- najbardziej preferuje

# Oszacowanie uzytecznosci czastkowych
# caPartUtilities(macierz_preferencji, macierz_profili, poziomy_atrybutow)

caPartUtilities(awpref, awprof, awlevn)

#    intercept    tak    nie brak_kartkowek 1-3_kartkowek 4-7_kartkowek brak_pd
#[1,]     5.000 -2.333  2.333          0.889         0.889        -1.778   0.222
#[2,]     4.083 -2.083  2.083          2.222        -0.778        -1.444  -0.444
#[3,]     5.083 -1.750  1.750          0.667         0.667        -1.333   1.333
#[4,]     5.083 -1.083  1.083          0.556         0.889        -1.444   1.222

# Respondent 1 preferuje brak egzaminu, jest mu obojetne czy kartkowek w ogole nie bedzie czy
# bedzie ich do 3, woli 1-2 prace domowe, ale za to brak przygotowywania raportu z badania

# Oszacowanie parametrow modelu w przekroju calej zbiorowosci respondentow
# Conjoint(macierz_preferencji, macierz_profili, poziomy_atrybutow)

Conjoint(awpref, awprof, awlevn)

#[1] "Part worths (utilities) of levels (model parameters for whole sample):"
#           levnms    utls
#1       intercept  4,8384
#2             tak -1,6888
#3             nie  1,6888
#4  brak_kartkowek  0,7687
#5   1-3_kartkowek  0,2653
#6   4-7_kartkowek  -1,034
#7         brak_pd  0,1429
#8          1-2_pd  0,2653
#9          3-7_pd -0,4082
#10   brak_raportu  0,6531
#11   indywidualny -0,7823
#12        grupowy  0,1293

# Najbardziej preferowana jest brak egzaminu, brak kartkowek, brak raportu, 1-2 prac domowych (;

#[1] "Average importance of factors (attributes):"
#[1] 34,53 23,33 16,43 25,70

# najwazniejszym czynnikiem jest obecnosc egzaminu, nastepnie obecnosc raportu, pozniej kartkowki i na koniec prace domowe

#[1] Sum of average importance:  99,99
#[1] "Chart of average factors importance"

# wykresy ulatwiajace porownanie istotnosci poziomow atrybutow