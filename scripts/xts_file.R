# Load xts
library(dplyr)
library(xts)

# Crear el objeto data usando 5 datos aleatorios
data <- rnorm(5)
# Creando fechas como objetos Date iniciando desde 2016-01-01
dates <- seq(as.Date("2016-01-01"), length = 5, by = "days")
# Usando xts() para crear la variable smith
smith <- xts(x = data, order.by = dates)
# Crear bday (1899-05-08) usando un objeto POSIXct (fecha)
bday <- as.POSIXct("1899-05-08")
# Crear el objeto hayek y agregar una columna llamada 'born'
hayek <- xts(x = data, order.by = dates, born = bday)

# Ver la estructura de un objeto xts
str(hayek)
# Extraer la data del nucleo de hayek
coredata(hayek)

# Extraer la data del objeto hayek
hayek_core <- coredata(hayek)
# Ver la clase del objeto hayek_core
class(hayek_core)
# Extaer el indice del objeto hayek
hayek_index <- index(hayek)
# Ver la clase del objeto hayek_index
class(hayek_index)

# Utilizando la data sunspots
data(sunspots)
class(sunspots)
# Convertir el objeto ts a xts
sunspots_xts <- as.xts(sunspots)
class(sunspots_xts)
head(sunspots_xts)


# Leer un archivo externo
terremotos <- read.csv("data/earthquakes.csv")
terremotos_xts <- xts(terremotos$Magnitude, as.POSIXct(terremotos$DateTime))
write.zoo(terremotos_xts, "data/earthquakes_magnitude.csv")

head(terremotos_xts)

# Consultas basadas en tiempo
terremotos_xts["200804",1]

