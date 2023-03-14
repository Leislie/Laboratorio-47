# Hecho con gusto por Leislie R. Manjarrez O.

# Laboratorio 47- Grafico de barras con ggplot2

# Instalar paqueterias
install.packages("gapminder")
install.packages("ggplot2")

# Llamar la librerias
library(gapminder)
library(ggplot2)

# Cargar los datos al entorno
data("gapminder")

# Filtrado por año 2007
gapminder2007 <- gapminder[gapminder$year == '2007',]

# Crear un grafico de barras horizontal
ggplot(data = gapminder2007,
       mapping = aes(x = factor(continent))) +
  geom_bar()

# Crear un grafico de barras vertical
ggplot(data = gapminder2007,
       mapping = aes(x = factor(continent))) +
  geom_bar()+
  coord_flip()

# Creando una etiqueta para expectativa de vida
gapminder2007$lifeExp <- ifelse(
  gapminder2007$lifeExp <50, "poca",
  ifelse(gapminder2007$lifeExp <70, "media","alta"))

# Crear un objeto que guarde la variable
p <- ggplot(data = gapminder2007,
            mapping = aes(x = factor(continent),
                          fill = lifeExp))

# Graficar el objeto p en una grafica de barras apilada
p + geom_bar(position = "stack", stat = "count")

# Graficar el objeto p en una grafica de barras separada
p + geom_bar(position = "dodge", stat = "count")

# Graficar el objeto p en una grafica de barras considerando el 100%
p + geom_bar(position = "fill", stat = "count")