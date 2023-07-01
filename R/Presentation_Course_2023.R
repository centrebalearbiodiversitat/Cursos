# ------------------------------------ #
# Introduction to R                    #
# Centre Balear de Biodiversitat       #
# Tommaso Cancellario & Laura Triginer #
# 03-06 July 2023                      #
# ------------------------------------ #

# --------------------- #
# Arithmetic operations #
# --------------------- #
2 + 3 # Addition
3 - 2 # Subtraction
4 * 5 / 6 # Moltiplication and division
7^8 # Exponent

# ------------------------------------ # 
# Assignment, object names, data types #
# ------------------------------------ #

x <- 8 * 2 / 8
x # To see the result

x = 8 * 2 / 8
x

(x <- 8 * 2 / 8)


1 <- 3 * 2 # Invalid sintax

x1 <- 3 * 2 # Valid sintax
x1

# Key sensitive
X <- 2 * 2
x <- 2 * 4

X
x

# Object type
typeof(2.02)
typeof("Hello, World!")
typeof(integer(0))
typeof(TRUE)
is.factor(as.factor(c("apple", "banana")))


# ------- # 
# Vectors #
# ------- #

# Numeric vector creation
x <- c(74, 31, 95, 61, 76, 34, 23, 54, 96)
x

# Character vector creation
y <- c("apple", "pear", "peach", "banana", "dragon fruit")
y

# Numeric sequence vector
seq(from = 1, to = 5)
1:5

# Character sequence vector
LETTERS[seq(from = 1, to = 10)]
letters[seq(from = 11, to = 20)]

# --------------------- #
# Indexing data vectors #
# --------------------- #

# Indexing numeric vector
x

x[1]

x[1:4]

x[c(1,3,2,5)]

# Indexing character vector
LETTERS[seq(from = 1, to = 10)][1]

LETTERS[seq(from = 1, to = 10)][-5]
LETTERS[seq(from = 1, to = 10)][-c(5, 6)]


# ------ #
# Matrix #
# ------ #

# Create a matrix
matrix(1:9, nrow = 3, ncol = 3)

# Same result in another way
matrix(1:9, nrow = 3)

# Fill matrix row-wise
matrix(1:9, nrow = 3, byrow = TRUE)

# Create a matrix with con and row names
x <-  matrix(1:9, nrow = 3,
             dimnames = list(c("X", "Y", "Z"), 
                             c("A", "B", "C"))
             )
# Change names
colnames(x) <- c("C1", "C2", "C3")
rownames(x) <- c("R1", "R2", "R3")
x

# Indexing matrix
x[1,1] # Col 1 and row 1

x[1:3, 1] # Row from 1 to 3 and col 1

x[c(1,3), c(2,3)] # Row 1 & 3 and col 2 & 3


# ---------- #
# Data Frame #
# ---------- #

# Create a data frame
x.df <- data.frame(
  Name = c("Maria", "Enrique", "Laura", "Yves", "Anna"),
  Age = c(22, 25, 30, 50, 23),
  Vote = c(TRUE, FALSE, TRUE, FALSE, TRUE)
)
x.df

# Add row
x.df <- rbind(x.df, c("Tom", 33, TRUE)) 
# Add columns
x.df$Country <- c("Spain", "Colombia", "Spain", "France", "Spain", "Italy") 

x.df

# Indexing Data Frame

x.df$Name # By column name
x.df[ ,1] # By column Index
x.df[ ,"Name"] # By column index-name

x.df[1, ] # Filter first row

x.df[1,2] # Filter one row and one column
x.df[1:3, 1:2] #Filter rows and columns


# ---------------------------------------- #
# Difference between Matrix and Data frame #
# ---------------------------------------- #

# Create vector
x <- seq(1:5)
y <- letters[1:5]

# Create matrix
(mx <- cbind(x,y))

# We can not convert the column 1 to numeric type
mx[ ,1] <- as.numeric(mx[ ,1])
mx

# Create data frame
df <- as.data.frame(mx)
str(df)

df$x <- as.numeric(df$x)
str(df)


# ---- #
# List #
# ---- #

# Create a list with different elements
ls <- list("red", 
           c("green", "blue"), 
           c(21, 32, 11), 
           TRUE,
           c(51.23, 119))
ls

# Create a list containing a vector, a matrix and a list.
ls <- list(c("Maria","Laura","Yves"), 
           matrix(c(3,9,5,1,-2,8), nrow = 2),
           list("green",12.3))

# Give names to the elements in the list.
names(ls) <- c("Names", "Matrix", "Nested List")
ls

# Indexing list
ls[[1]] # Extract the first element of the list (index)
ls$Names # Extract the first element of the list (name)

ls[[2]][2,2] # Extract a value of the matrix into the list

# Create objects startinf from nested-list elements
(ls.color <- ls[[3]][[1]])
(ls.number <- ls[[3]][[2]])


# ------------------------- #
# Functions and Expressions #
# ------------------------- #

# Some basic function
x <- 1:5

sum(x) # Sum of the vector
length(x) # Length of the vector
min(x) # Min value
mean(x) # Mean
sd(x) # Standard deviation

# Create our custom function
# Mean
meanNew <- function(x){
  sum(x)/length(x)
}

meanNew(x)

# Standard deviation
sdNew <- function(x){
  sqrt(sum((x - meanNew(x))^2) / (length(x) - 1))
}

sdNew(x)


# ----------------- #
# if else statement #
# ----------------- #

# Create variables
x <- 45
y <- 9

# if-else
if(x > 10){
  print("> than 10")
} else {
  print("< than 10")
}

# Create function containing if-else
iFun <- function(x, n = 10) {
  if(x > n){
    print(paste(x, "> than", n))
  } else {
    print(paste(x, "< than", n))
  }
}

iFun(x, n = 10)
iFun(y)
iFun(x, n = 50)


# ----- #
# Loops #
# ----- #

# FOR
# Loop n1
for(i in 1:5) {print("Hello, World!")}

# Loop n2
for(i in 1:5) {print(i)}

# Loop n3
for(i in 1:5){
  print(paste(i/5, "---- of ---- 100"))
}

# WHILE

# While n1
i <- 0
while (i <= 4) {
  i <- i + 1
  print(i)
}

# While n2
i <- 0
while (i <= 4) {
  i <- i
  print(i)
}

# REPEAT

# Repeat n1
x <- 1

repeat{
  print(x)
  x = x+1
  if(x == 6){
    break # Important to stop the loop
  }
}

# apply function
m1 <- matrix(1:10, nrow = 5, ncol = 6)
m1

(a_m1 <- apply(m1, 2, sum))

# lapply function
lapply(0:4, function(x) {x + 1})

# sapply function
sapply(0:4, function(a) {a + 1})

# tapply function
df <- data.frame(sp = c("sp1", "sp1", "sp1", "sp2", "sp2"),
                 value = c(1,4,2,6,4))
df

df.tp <- tapply(df$value, df$sp, sum)
df.tp


# ---- #
# Plot #
# ---- #

# Plot 1
plot(1, 3)

# Create vectors
x <- c(1,16)
y <- c(4, 5)

# Plot n2
plot(x, y)

# Plot n3
plot(x ~ y)

# Create vectors
x <- sample(0:50, 10, replace = FALSE)
y <- sample(0:50, 10, replace = FALSE)

# Plot n4
plot(x, y, main = "Random points")

# Create vectors
x <- c(1:20)
y <- c(1:20)

# Plot n5
plot(x, y, main = "Linear plot",
     xlab = "X-axis label", ylab = "Y-axis label")

# Plot n6
plot(x, y, main = "Line plot",
     col = "blue",
     lwd = 4, type = "l",
     xlab = "x-axis label",
     ylab = "y-axis label")
abline(v = 15, col = "red", lty = 2, lwd = 3)
abline(h = c(10, 15), col = "green")

# -------------- #
# palmerpenguins #
# -------------- #

# Install palmerpenguins package
install.packages("palmerpenguins")

# Load package
library(palmerpenguins)
head(penguins)

# Color selection
colors <- c("#FDAE61", "#D9EF8B", "#66BD63")

# Plot n7
plot(penguins$bill_length_mm, penguins$bill_depth_mm,
     main = "Penguins plot", pch = 19,
     col = colors[factor(penguins$species)],
     xlab = "Bill length (mm)", ylab = "Bill depth (mm)")
# Add lengend
legend("bottomright", pch = 19, col = colors,
       legend = c("Adelie", "Gentoo", "Chinstrap"))


# Create new color palette
colors2 <- c("red", "blue")

# Filter main dataset
adelie <- penguins$bill_length_mm[penguins$species == "Adelie"]
chinstrap <- penguins$bill_length_mm[penguins$species == "Chinstrap"]
gentoo <- penguins$bill_length_mm[penguins$species == "Gentoo"]

# Plot n8
par(mfrow=c(1,3))
hist(adelie, main = "Adelie histogram", col = colors[1], ylim = c(0, 40))
abline(v = c(median(adelie, na.rm = TRUE), mean(adelie, na.rm = TRUE)), col = colors2)
hist(chinstrap, main = "Chinstrap histogram", col = colors[2], ylim = c(0, 40))
abline(v = c(median(chinstrap, na.rm = TRUE), mean(chinstrap, na.rm = TRUE)), col = colors2)
hist(gentoo, main = "Gentoo histogram", col = colors[3], ylim = c(0, 40))
abline(v = c(median(gentoo, na.rm = TRUE), mean(gentoo, na.rm = TRUE)), col = colors2)
dev.off()


# Filter main dataset
adelie <- penguins$island[penguins$species == "Adelie"]
chinstrap <- penguins$island[penguins$species == "Chinstrap"]
gentoo <- penguins$island[penguins$species == "Gentoo"]

# Plot n9
par(mfrow=c(1,3))
barplot(table(adelie), main = "Adelie barplot islands", col = colors[1], 
        horiz = TRUE, xlim = c(0, 120), las = 2, cex.names = 0.7)
barplot(table(chinstrap), main = "Chinstrap barplot islands", col = colors[2], 
        horiz = TRUE, xlim = c(0, 120), las = 2, cex.names = 0.7)
barplot(table(gentoo), main = "Gentoo barplot islands", col = colors[3], 
        horiz = TRUE, xlim = c(0, 120), las = 2, cex.names = 0.7)
dev.off()

# -------- #
# Box plot #
# -------- #

# Filter data set
adelie <- penguins$bill_length_mm[penguins$species == "Adelie"]

# Median
ad.med <- median(adelie, na.rm = TRUE)

# First quantile (25th percentile)
q1 <- median(adelie[adelie < ad.med], na.rm = TRUE)
# Third quantile (75th percentile)
q3 <- median(adelie[adelie > ad.med], na.rm = TRUE)

# Quantile
quantile(adelie, na.rm = TRUE)

# Plot n10
boxplot(adelie, main = "Adelie boxplot")
abline(h = ad.med, col = "red")
abline(h = c(q1, q3), col = "blue")
abline(h = c(min(adelie, na.rm = T), max(adelie, na.rm = T)), col = "green")


# Plot n11
boxplot(penguins$bill_length_mm ~ penguins$species, 
        col = colors, xlab = "", ylab = "Bill length (mm)",
        main = "Penguins boxplot")

# Plot n12
boxplot(penguins$bill_length_mm ~ penguins$species, 
        col = colors, xlab = "", ylab = "Bill length (mm)",
        main = "Penguins boxplot")

# Add jittered points
for(i in 1:3){
  
  jittered_x <- rep(i, nrow(penguins))
  jittered_x <- jittered_x + runif(nrow(penguins), min = -0.1, max = 0.1)
  points(jittered_x, penguins$bill_length_mm,
         pch = 19, col = adjustcolor("black", alpha = 0.2), cex = 0.6)
  
}


# Filter data set
penguin <- penguins[ ,c("bill_length_mm", "bill_depth_mm",
                        "flipper_length_mm", "body_mass_g")]
head(penguin)

# Plot n13
pairs(penguin, pch = 19, cex = 0.5)


# Filter data set
penguin <- penguins[ ,c("species", "bill_length_mm", "bill_depth_mm",
                        "flipper_length_mm", "body_mass_g")]
head(penguin)

# Plot n14
pairs(penguin[, 2:ncol(penguin)], pch = 19, cex = 0.5,
      main = "Penguins scatter plot matrices",
      col = colors[penguin$species], lower.panel = NULL)


# Correlation panel
panel.cor <- function(x, y){
  
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- round(cor(x, y, use = "complete.obs"), digits = 2)
  txt <- paste0("R = ", r)
  cex.cor = 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor * r)
}

# Customize upper panel
upper.panel <- function(x, y){
  points(x, y, pch = 19, cex = 0.5,
         col = colors[penguin$species])
  
}

# Plot n15
pairs(penguin[ ,2:ncol(penguin)],
      main = "Penguin scatter correlation",
      lower.panel = panel.cor,
      upper.panel = upper.panel)
dev.off()


# Plot n16
pairs(penguin[ ,2:ncol(penguin)], cex = 0.5,
      pch = c(15, 16, 17)[penguin$species],
      col = colors[penguin$species],
      lower.panel = panel.smooth,
      main = "penguin scatter - smooth"
      )


# Filter main dataset
adelie <- penguins$bill_length_mm[penguins$species == "Adelie"]
chinstrap <- penguins$bill_length_mm[penguins$species == "Chinstrap"]
gentoo <- penguins$bill_length_mm[penguins$species == "Gentoo"]

# Plot n17
par(mfrow = c(3,1))
dotchart(adelie, color = colors[1], cex = 0.6, pch = 19,
         xlab = "", lcolor = "white", main = "Adelie dotchart")
dotchart(chinstrap, color = colors[2], cex = 0.6, pch = 19,
         xlab = "", lcolor = "white", main = "Chinstrap dotchart")
dotchart(gentoo, color = colors[3], cex = 0.6, pch = 19,
         xlab = "", lcolor = "white", main = "Gentoo dotchart")
dev.off()


# Kernel density plot
# Density

adelie.kd <- density(adelie, na.rm = TRUE)
chinstrap.kd <- density(chinstrap, na.rm = TRUE)
gentoo.kd <- density(gentoo, na.rm = TRUE)


# Plot n18
par(mfrow = c(3,1))
plot(adelie.kd, col = colors[1], main = "Adelie Kernel Density Plot")
plot(chinstrap.kd, col = colors[2], main = "Chinstrap Kernel Density Plot")
plot(gentoo.kd, col = colors[3], main = "Gentoo Kernel Density Plot")
dev.off()


# Set seed
set.seed(16)

# Create random data
x <- runif(100)
eps <- rnorm(100, 0, 0.25)

# Create model
y <- 2 + 3 * x^2 + eps

# Plot n19
plot(x, y, pch = 19, cex = 0.8)

smoothScatter(x, y, transformation = function(x) x ^ 0.4,
              colramp = colorRampPalette(c("gray", "#00FEFF", "#45FE4F",
                                           "#FCFF00", "#FF9400", "#FF3100")),
              main = "Heat map R scatter plot")
points(x, y)