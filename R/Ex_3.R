# Set workink directory
setwd("./OneDrive - Universitat de les Illes Balears/CBB objectives/Cursos/Introduction to R/")


# Check the files in the folder
listFiles <- list.files(path = "./EX_3", pattern = ".csv$", 
                        all.files = TRUE, full.names = TRUE)

# read.csv(listFiles[1])

listCSV <- list()

# Loop cycle
# i = 1
for(i in 1:length(listFiles)){
  
  myCVS <- read.csv(listFiles[i])
  
  listCSV[[i]] <-  myCVS
  
}

# Sum column values
lapply(listCSV, FUN = colSums)