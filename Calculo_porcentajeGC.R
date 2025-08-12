library(dplyr)
library(ggplot2)

datos <- data.frame(
  Especie = c("Lungfish", "Shark","Frog","Salamander","Turtle","Alligator","Falcon","Ostrich","Cod","Armadillo","Elephant","Human","Dog","Wombat","Platypus","Amphioxus"),
  A = c(301, 311,336,319,361,333,340,307,288,359,352,326,331,340,309,243),
  C = c(338,293,289,319,359,366,382,387,307,328,326,389,318,366,315,211),
  G = c(152,150,144,166,131,145,142,147,182,150,137,136,159,144,157,246),
  T = c(353,390,371,337,293,315,279,299,384,303,322,286,332,296,359,4430))
print(datos)
#Calcular los porcentajes de GC
datos <- datos %>%
  mutate(Porcentaje = (datos$G + datos$C) / rowSums(datos[, c("A", "C", "G", "T")]) * 100)

#Imprimir la tabla de los datos con los porcentajes
print(datos)

#Generar el gráfico de los porcentajes
ggplot(datos, aes(x = reorder(Especie, Porcentaje), y = Porcentaje)) +
  geom_bar(stat = "identity", fill = "pink") +
  coord_flip() +
  labs(title = "Distribución porcentual contenido GC por especie",
       x = "", y = "% de GC") +
  theme_minimal()

#El organismo Ostrich fue el de mayor porcentaje de contenido GC (mayor al 40%), mientras que Amphioxus fue el de menor porcentaje (menor al 10%)