library(foreign)
library(forecast)
library(fUnitRoots)

o <- read.csv("data/kohliODIBatting.csv")

## Only get data where Player has batted
o <- o[o$Runs != "DNB",]
Acf(o$Runs, lag.max = 20, type = "correlation")

plot.ts(o$Runs)
unique(o$Inns)
oi1 <- o[o$Inns == 1,]
oi2 <- o[o$Inns == 2,]
Acf(oi1$Runs, lag.max = 20, type = "correlation")
Acf(oi2$Runs, lag.max = 20, type = "correlation")

t <- read.csv("data/kohliTestBatting.csv")
t <- t[t$Runs != "DNB",]
unique(t$Inns)
plot.ts(t$Runs)
Acf(t$Runs, lag.max = 20, type = "correlation")

# Checking if there is any correlation with previous innings 
ti1 <- t[t$Inns %in% c(1,2),]
ti2 <- t[!t$Inns %in% c(1,2),]
Acf(ti1$Runs, lag.max = 20, type = "correlation")
Acf(ti2$Runs, lag.max = 20, type = "correlation")

