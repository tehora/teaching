# Prosty przyklad na zastosowanie PCA w R
# Zbior danych o platkach sniadaniowych: "cereal.txt"

# Do obiektu m przypiszmy dane wczytane z pliku

m<-read.table("pca2_cereal.txt",sep=" ")

# wybierzmy tylko kolumny 4 do 13

m<-m[4:13]

# i nadajmy im nazwy

names(m) <- c("kal","bialko","tl","sod","blonnik","wegzl","cuk","pot","waga","mis")

# Usunmy dziwne obserwacje z potasem == -1 (braki danych)

m<-m[-5,]
m<-m[-20,]

pca<-prcomp(m, scale=T)
pca

# tworzenie wykresu obrazujacego wklad poszczegolnych skladowych w wyjasnienie wariancji
X11(width=6,height=6)
plot(pca)
library(scatterplot3d)
X11(width=6,height=6)
scatterplot3d(pca$x[,1:3],main="prcomp, rzut 3d")
X11(width=6,height=6)
plot(pca$x[,1:2],asp=1,main="prcomp, rzut 2d")

#inny sposob

m_pca <- princomp(x = m)
m_pca
print(summary(m_pca), loadings = TRUE)

#princomp returns a list with class "princomp" containing the following components:
#sdev -- the standard deviations of the principal components.
#loadings -- the matrix of variable loadings (i.e., a matrix whose columns contain the eigenvectors). This is of class "loadings": see loadings for its print method.
#center  -- the means that were subtracted.
#scale -- the scalings applied to each variable.
#n.obs 	-- the number of observations.
#scores  -- if scores = TRUE, the scores of the supplied data on the principal components. These are non-null only if x was supplied, and if covmat was also supplied if it was a covariance list. For the formula method, napredict() is applied to handle the treatment of values omitted by the na.action.

m_pca$n.obs

#stad mozemy odczytac np wklad poszczegolnych skladowych w wariancje

plot(m_pca)
#to samo co poprzednio -- wykres wariancji tlumaczonej przez skladowe

screeplot(m_pca, type = c("lines"))
#wykres osypiska
