## Module 2. Introduction to Python
## Exercise 3

# Libraries
import pandas as pd 
from collections import Counter 
from matplotlib import pyplot
from shapely.geometry import Point
import geopandas as gdp
from geopandas import GeoDataFrame
import numpy as N
import folium as fol

# data path
file_path = "~/Documents/GitHub/Cursos_CBB/data/whale_data.csv"
## read data
file = pd.read_csv(file_path, sep = "\t")

#Check the name of the columns
tags = list(file.columns)
print ('names of columns: ', tags)

#Count the number of columns
count_columns = len(tags)
print(count_columns)

count_years = Counter(file["year"])
count_samples = sum(Counter(file["year"]))
print('número de muestras: ', count_samples)

institutions = sorted(file['institutionCode'])
print(N.unique(institutions))
print('meses en los que se ha llevado a cabo el estudio: ' , file["month"].unique())


## Bar plot
count_months = Counter(file["month"])
pyplot.bar(count_months.keys(), count_months.values(), color='blue',width=0.1)
pyplot.show()
##



