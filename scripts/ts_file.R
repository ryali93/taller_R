# EXPLORANDO LA SERIE DE TIEMPO
## Print el dataset Nile
print(Nile)
## Lista del numero de observaciones en el dataset Nile
length(Nile)
## Display the first 10 elements of the Nile dataset
head(Nile, 10)
## Display the last 12 elements of the Nile dataset
tail(Nile, 12)

# PLOT BASICO 
## Plot the Nile data
plot(Nile)
## Plot the Nile data with xlab and ylab arguments
plot(Nile, xlab = "Year", ylab = "River Volume (1e9 m^{3})")
## Plot the Nile data with xlab, ylab, main, and type arguments
plot(Nile, xlab = "Year", ylab = "River Volume (1e9 m^{3})", main="Annual River Nile Volume at Aswan, 1871-1970", type="b")



# ANALIZANDO EL OBJETO TS
## Plot AirPassengers
plot(AirPassengers)
## View the start and end dates of AirPassengers
start(AirPassengers)
end(AirPassengers)
## Use time(), deltat(), frequency(), and cycle() with AirPassengers 
time(AirPassengers)
deltat(AirPassengers)
frequency(AirPassengers)
cycle(AirPassengers)



# LLENANDO VALORES VACIOS
AirPassengers[85:96] = NA

## Plot the AirPassengers data
plot(AirPassengers)
## Compute the mean of AirPassengers
mean(AirPassengers, na.rm=TRUE)
## Impute mean values to NA in AirPassengers
AirPassengers[85:96] <- mean(AirPassengers, na.rm = TRUE)
## Generate another plot of AirPassengers
plot(AirPassengers)
## Add the complete AirPassengers data to your plot
rm(AirPassengers)
points(AirPassengers, type = "l", col = 2, lty = 3)




# CREANDO OBJETOS TS
data_vector <- c(10, 6, 11, 8, 10, 3, 6, 9)
time_series <- ts(data_vector)
plot(time_series)

time_series <- ts(data_vector, start = 2001, frequency = 1)
plot(time_series)

## La funcion is.ts()
is.ts(data_vector)
is.ts(time_series)



# PLOTEANDO UNA SERIE DE TIEMPO
eu_stocks <- EuStockMarkets

## Check whether eu_stocks is a ts object
is.ts(eu_stocks)
## View the start, end, and frequency of eu_stocks
start(eu_stocks)
end(eu_stocks)
frequency(eu_stocks)
## Generate a simple plot of eu_stocks
plot(eu_stocks)
## Use ts.plot with eu_stocks
ts.plot(eu_stocks, col = 1:4, xlab = "Year", ylab = "Index Value", main = "Major European Stock Indices, 1991-1998")
## Add a legend to your ts.plot
legend("topleft", colnames(eu_stocks), lty = 1, col = 1:4, bty = "n")
