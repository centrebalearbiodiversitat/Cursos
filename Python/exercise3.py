## Module 2. Introduction to Python
## Exercice 3

# Libraries
import pandas as pd 
from collections import Counter 
from matplotlib import pyplot
from shapely.geometry import Point
import geopandas as gdp
from geopandas import GeoDataFrame
import folium as fol

# data path
file_path = "~/Documents/GitHub/Cursos_CBB/data/whale_data.csv"
## read data
file = pd.read_csv(file_path, sep = "\t")

#Check the name of the columns
tags = list(file.columns)
print ('names of columns: ', tags)

count_years = (Counter(file["year"]))
count_samples = sum(Counter(file["year"]))
print('número de muestras: ', count_samples)
print('años en los que se ha llevado a cabo el estudio: ' , sorted(file["year"].unique()))

## Bar plot

pyplot.bar(count_years.keys(), count_years.values(), color='green')
pyplot.show()

## Google Maps Folium ##
map = fol.Map(location=[39.5, 2.745], zoom_start=8)
p_lat_long = []
p_lat_long  = list(zip(file['decimalLatitude'],file['decimalLongitude']))
for points in p_lat_long:
    fol.Marker(points, popup='Whale').add_to(map)
map.save('index.html')

##



