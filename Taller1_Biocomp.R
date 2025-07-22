#TÍTULO: Conteo del polen de una nueva especie de abejas

#INTRODUCCIÓN: Este estudio compara la cantidad de polen de diferentes familias de plantas, almacenado por una nueva especie de abeja.

#PROCEDIMIENTO:
#Cargar los paquetes instalados
library(dplyr)
library(ggplot2)

#Generar la tabla con los datos del conteo de polen para cada familia
datos <- data.frame(
  Familia = c("Asteraceae Helianthus", "Rubiaceae Coffea", "Solanaceae Solanum", "Melastomataceae Miconia",
              "Fabaceae Caesalpinia", "Pinaceae Pinus", "Anacardiaceae Magnifera", "Myrtaceae Eucalyptus",
              "Moraceae Ficus", "Passifloraceae Passiflora"),
  Conteo = c(67, 22, 101, 934, 176, 321, 11, 234, 98, 97)
)

#Calcular los porcentajes de polen para cada familia respecto al total de polen contado
datos <- datos %>%
  mutate(Porcentaje = Conteo / sum(Conteo) * 100)

#Imprimir la tabla de los datos con los porcentajes
print(datos)

#Generar el gráfico de los porcentajes
ggplot(datos, aes(x = reorder(Familia, Porcentaje), y = Porcentaje)) +
  geom_bar(stat = "identity", fill = "pink") +
  coord_flip() +
  labs(title = "Distribución porcentual del polen por familia",
       x = "", y = "% de polen") +
  theme_minimal()

#RESULTADOS: La planta Miconia es la que presenta la mayor abundancia de polen
