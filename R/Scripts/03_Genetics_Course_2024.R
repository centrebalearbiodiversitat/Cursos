# ------------------------------------ #
# Introduction to R                    #
# Centre Balear de Biodiversitat       #
# Tommaso Cancellario                  #
# 20 - 22 February 2024                #
# ------------------------------------ #

# https://peerj.com/articles/16505/

# Load packages ----------------------------------------------------------------
pacman::p_load(phytools, phangorn, tidyverse)

# set working directory --------------------------------------------------------
setwd("~/Desktop/GitHub/Cursos/R/")
getwd()


# Load alignment file in fasta format ------------------------------------------
pleco <- read.phyDat("./Plecoptera_Nucleotide_alignment_500_6.fasta", format = "fasta")
names(pleco)

# Use grep to get indices of rows containing the specific string
matching_indices <- grep("Leuctra_digitata", names(pleco))

# Extract rows based on the matching indices
leuctra <- pleco[grep("Leuctra_digitata", names(pleco)), ]


# Change names in leuctra object
for(i in 1:length(names(leuctra))){
  names(leuctra)[i] <- paste0("Leuctra_digitata_", i)
}


# Load coordinate file ---------------------------------------------------------
coord <- read.csv("./leuctra.csv") 

# Prepare coord object for the analysis
rownames(coord) <- coord$Taxa
coord <- coord[ ,-1]
colnames(coord)[2] <- "long"
coord <- as.matrix(coord)

head(coord)


# Create phylogenetic tree -----------------------------------------------------
dm  <- dist.ml(leuctra)
tree  <- upgma(dm)
plot(tree, cex = 0.4)


# Prepare phylo-map object 
obj <- phylo.to.map(tree, coord, type = "phylogram", 
                    plot = FALSE, direction = "rightwards")


plot(obj, ftype = "i", fsize = 0.3,  psize = 0.5, 
     xlim = c(-25, 45), ylim = c(35, 72))

plot(obj, direction="rightwards", ftype="i",fsize=0.4,map.bg="lightgreen",
     lty="solid",colors="darkblue", delimit_map=TRUE, xlim = c(-25, 45), ylim = c(25, 72))