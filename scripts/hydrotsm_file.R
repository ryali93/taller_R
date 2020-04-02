library(hydroTSM)
library(xts)
library(ggplot2)

# Leer serie de datos de caudales
data <- read.csv('data/serie_caudal.csv')
data <- data[,-2]
data$mes_anno <- as.Date(data$mes_anno, format = "%d/%m/%Y")
class(data)

# Transformar data mensual a anual
data_anual = monthly2annual(data, mean, na.rm = TRUE)
class(data_anual)

head(data)
head(data_anual)

# Ploteando datos mensuales
ggplot(data) +
  geom_line(aes(x = mes_anno, y = QN301))

# Ploteando datos anuales
df <- as.data.frame(data_anual)
df["anno"] = as.Date(index(data_anual), format="%$Y")
ggplot(df) +
  geom_line(aes(x = anno, y = QN301))
