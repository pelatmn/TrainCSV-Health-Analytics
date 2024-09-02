# train_vize2 <- read_excel("C:/Users/Pelin/Desktop/train_vize2.xlsx")
# 
# rasgele_ornek <- sample(train_vize2,2000,replace = FALSE)
write.csv(train_vize2[rasgele_ornek,], file = "rasgele_ornek.csv", row.names = FALSE)
veri_odev <- read.csv("rasgele_ornek.csv")
print(okunan_veri)
####################################################### 


"mode(veri_odev)" #bu fonksiyon sonucunda veri setimin list olduğunu öğrenmiş oluyorum.


df <- as.data.frame(veri_odev) #list olan verimizi veri çerçevesine dönüştürüyoruz

"""attach(df)"""

#################################################
"9.2" #Calculating Relative Frequencies
mean(df$age>50)

mean(df$Cholesterol<200)

mean(df$AST>25)

mean(df$serum.creatinine<0.5)



##################################################################
"9.9" # Forming a Confidence Interval for a Mean
#t.test(x) sürekli veri seçip kullanılmalı bu formülde

t.test(df$systolic)   # sistolik verileri için t testi

#sistolik değişkeni için grafik çizdirme
hist(df$systolic, col = "lightblue", main = "Sistolik Değişkeni'nin Dağılımı", xlab = "Sistolik Değerleri")

#grafiği daha iyi yorumlayabilmek için sistolik değişkeninin özet istatistikleri
summary(df$systolic)

############################################################################
"9.10" #Forming a Confidence Interval for a Median

#wilcox.test(x,y)
#wilcox.test(x, conf.int = TRUE)  kategorik verileri almayacağız(örn;smoking)


wilcox.test(df$fasting.blood.sugar, conf.int = TRUE)



##########################################################################
"9.11" #Testing a Sample Proportion

oran_testi <- prop.test(150,2000,0.05)


##########################################################################
"9.19" #Performing Pairwise Comparisons Between Group Means

#pairwise.t.test(x,f)   x is the data, f is the grouping factor
#sürekli veriler üzerinden yapacağız mesela kilo verileri var ve bir tane daha kilo2 adlı veri oluşturup bu ikisinin karşılaştırmasını yapacağız. rnorm kullan meela kilolardan 4 çıkar  ve karşılaştır.
set.seed(123)
df$weight2 <- df$weight.kg. -4*rnorm(nrow(df),0,1)

comb <- stack(list(ilk_kilo=df$weight.kg.,ikinci_kilo=df$weight2))

sonuc<-pairwise.t.test(comb$values, comb$ind)

print(sonuc)

print(sonuc$p.value)

#################################################################################

"kullanılacak paketler"

#data.table :Data manipulation
#mboost :data analysis
#ggplot2 : Data visualization
#knitr : reporting

##################################################################
install.packages("ggplot2")
library(ggplot2)

#Kolesterol değişkeni için grafik çizdirme

ggplot(df, aes(x = Cholesterol)) +
  geom_histogram(binwidth = 10, fill = "green", color = "black", alpha = 0.7) +
  labs(title = "Kolesterol Değerleri Dağılımı", x = "Kolesterol", y = "Frekans")



#################################################################
install.packages("data.table")
library(data.table)

#data.table(df,keep.rownames = TRUE ,check.names = TRUE , key = NULL , stringsAsFactors = TRUE )"""

dt <- as.data.table(df)
attach(dt)
# basic row subset operations
dt[2]                          

# Yaşa göre gruplama ve ortalama yaş hesaplama
dt[, .(AvgAge = mean(age)), by = .(Group = ifelse(age > 25, "25'ten büyük", "25 ve altı"))]

# HDL ve LDL sütunlarını seçme
selected_columns <- c("HDL", "LDL")
dt[, ..selected_columns]


#S##################################################################
install.packages("mboost")
library(mboost)


"""mboost(formula, data = list(), na.action = na.omit, weights = NULL, 
       offset = NULL, family = Gaussian(), control = boost_control(),
       oobweights = NULL, baselearner = c("bbs", "bols", "btree", "bss", "bns"), 
       ...)"""

# Bağımlı değişken Cholesterol, bağımsız değişkenler age ve weightS
model_formula <- df$Cholesterol ~ bbs(df$age) + bbs(df$weight.kg.)

# mboost fonksiyonu ile modeli oluşturma
model <- mboost(model_formula, data = df, family = Gaussian())

summary(model)

#mboost sonuc elde edilen değerlerin grafikleştirilmesi(çubuk grafiği ile) 
library(ggplot2)

ggplot(selection_data, aes(x = Baselearner, y = Selection_Frequency, fill = Baselearner)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Baselearner Seçilme Frekansları",
       x = "Baselearner",
       y = "Seçilme Frekansı") +
  theme_minimal()



###################################################################
install.packages("knitr")












