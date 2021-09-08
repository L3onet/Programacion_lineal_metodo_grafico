# Ejemplo:
# Una distribuidora de vehiculos vende principalmente 2 marcas de autos
# (alemana y estadounidense), obteniendo en promedio los siguientes datos
# por venta (expresado en miles):

# Producto          Costo/auto    Precio/auto   Tiempo/auto (hrs)
# Autos (Alemania)  150           300           6
# Autos (EUA)       230           450           8

# Si el proveedor de la distribuidora solo puede entregar un máximo de 100
# autos alemanes y 250 estadounidenses, y la distribuidora requiere de 6
# horas por auto alemán y 8 horas por auto estadounidense para revisarlos y
# ponerlos a la venta. ¿Qué cantidad de cada tipo de auto debe ordenarse
# para obtener la mayor utilidad posible, tomando en cuenta que el tiempo
# total mensual de revisión a los autos no puede exceder de 750 horas?

# Resolución del problema de programación líneal a través del método gráfico

# Paso 1: Identificar las variables básicas
# ????_1= Cantidad de autos alemanes a ordenarse c/mes 
# ????_2= Cantidad de autos estadounidenses a ordenarse c/mes

# Paso 2: Identificar las variables "????_????"
# ????_1= $ 150/auto alemán   = Precio (300) - Costo (150)
# ????_2= $ 220/auto e.u.a.   = Precio (450) - Costo (230)

# Paso 3: función objetivo
# Max ???? = ($150/A.A)(????_1A.A.) + ($220/A.E)((????_2A.E.)
# Max ???? = 150????_1 + 220????_2

# Paso 4: Identificar "????_????"
# ????_1= Capacidad máxima de envío mensual de autos alemanes (100).
# ????_2= Capacidad máxima de envío mensual de autos e.u.a. (250).
# ????_3= Tiempo máximo de revisión para el pedido mensual de autos (750)

# Paso 5: Identificar "????_????????"
# ????_3= Tiempo máximo de revisión para el pedido mensual de autos (750)
# * 6 horas de revisión para c/auto alemán
# * 8 horas de revisión para c/auto estadounidense

# Paso 6: Armar restricciones
# (6 hrs/A.A.)(????_1A.A.)+(8 hrs/A.E.)(????_2A.E.)
# 6????_1 + 8????_2 ??? 750

# Cantidad a ordenar de autos alemanes ??? 100 
# ????_1 ??? 100

# Cantidad a ordenar de autos estadounidenses ??? 250 
# ????_2 ??? 250

# Paso 7: No negatividad
# ????_1, ????_2 ??? 0

# Paso 8: Modelo general
# Max ???? = 150????_1 + 220????_2
# s.a.
# 6????_1 + 8????_2 ??? 750  (1)
# ????_1          ??? 100  (2)
#         ????_2  ??? 250  (3)
#
# ????_1, ????_2 ??? 0

# Paso 9 Gráficar el sistema.


# Importar la libreria
library(matlib)

# Asignar los coeficientes de las restricciones
# 6????_1 + 8????_2 ??? 750         6   8     (1)
# ????_1          ??? 100         1   0     (2)
#         ????_2  ??? 250         0   1     (3)
# Definir el número de columnas en 2 y el número de filas en 3
A<-matrix(c(6,1,0,8,0,1), ncol = 2, nrow = 3)

# Asignar los valores del lado derecho de las desiguldades
# 6????_1 + 8????_2 ??? 750         750       (1)
# ????_1          ??? 100         100       (2)
#         ????_2  ??? 250         250       (3)
b<- c(750,100,250)

# Se grafican las ecuaciones
plotEqn(A,b, xlim=c(0,140), labels=TRUE)

# Como se puede observar en el gráfico, la recta de la restricción 2 (línea roja) 
# se intersecciona con la recta de la restricción 1 (línea negra). La intersección
# de la restricción 2 (línea roja) y la restricción 3 (línea verde) no procede por
# estar alejada de la restricción 1 (línea negra). Por lo que se procede a 
# encontrar los puntos de intersección de los puntos:
# 
# A) Intersección de la recta de la restricción 1 (línea negra) con la recta del eje
#    x2
# B) Intersección de la recta de la restricción 1 (línea negra) con la recta de la
#    restricción 2 (línea roja)
# C) Intersección de la recta de la restricción 2 (línea roja) con la recta del eje
#    x1

# Intersección A

# Intersección de la restricción 1 con la recta del eje x2
# Se resuelve de manera matricial como ;
# 6x1 + 8x2 = 750
# x1	  = 0

# entonces las matrices A y B quedan como:
# [A=
#             6     8
#             1     0
# ;B=
#             750
#             0
# ]

# Definiendo matricialmente las funciones dentro de R, quedaría como

A <- matrix(c(6,8,1,0), nrow = 2, ncol = 2, byrow = T)
# Mostrar la matriz A
A
##     [,1] [,2]
##[1,]    6    8
##[2,]    1    0

B <- matrix(c(750,0), nrow = 2, ncol = 1, byrow = F)
# Mostrar la matriz A
B
##     [,1]
##[1,]  750
##[2,]    0

# Resolviendo nos queda como
r <- solve(t(A)%*%A)%*%t(A)%*%B
# Mostrar la matriz r
r
##      [,1]
##[1,]  0.00
##[2,] 93.75

# Intersección B

# Intersección de la recta de la restricción 1 (línea negra) con la recta de la
# restricción 2 (línea roja)
# 6x1 + 8x2 = 750
# x1	      = 100

# entonces las matrices A y B quedan como:
# [A=
#             6     8
#             1     0
# ;B=
#             750
#             100
# ]

# Definiendo matricialmente las funciones dentro de R, quedaría como

A <- matrix(c(6,8,1,0), nrow = 2, ncol = 2, byrow = T)
# Mostrar la matriz A
A
##     [,1] [,2]
##[1,]    6    8
##[2,]    1    0

B <- matrix(c(750,100), nrow = 2, ncol = 1, byrow = F)
# Mostrar la matriz A
B
##     [,1]
##[1,]  750
##[2,]  100

# Resolviendo nos queda como
r <- solve(t(A)%*%A)%*%t(A)%*%B
# Mostrar la matriz r
r
##       [,1]
##[1,] 100.00
##[2,]  18.75

# Intersección C

# Intersección de la recta de la restricción 2 (línea roja) con la recta del eje
# x1
# x1      = 100
#     x2	= 0

# entonces las matrices A y B quedan como:
# [A=
#             1     0
#             0     1
# ;B=
#             100
#             0
# ]

# Definiendo matricialmente las funciones dentro de R, quedaría como

A <- matrix(c(1,0,0,1), nrow = 2, ncol = 2, byrow = T)
# Mostrar la matriz A
A
##     [,1] [,2]
##[1,]    1    0
##[2,]    0    1

B <- matrix(c(100,0), nrow = 2, ncol = 1, byrow = F)
# Mostrar la matriz A
B
##     [,1]
##[1,]  100
##[2,]    0

# Resolviendo nos queda como
r <- solve(t(A)%*%A)%*%t(A)%*%B
# Mostrar la matriz r
r
##     [,1]
##[1,]  100
##[2,]    0

# Por último se busca determinar los puntos donde la función se maximice; por 
# lo que simplemente se evalua en la función objetivo cada uno de los puntos 
# encontrados.

# Definiendo la función objetivo

# Para ello escribe el código como
val<-matrix(c(0, 93.75, 100, 18.75, 100, 0), nrow=3, ncol = 2, byrow=T)
# Mostrar la matriz val
val
##      [,1]  [,2]
## [1,]    0 93.75
## [2,]  100 18.75
## [3,]  100  0.00

FO<-matrix(c(150,220), nrow=2, ncol=1)
# Mostrar la matriz FO
FO
##      [,1]
## [1,]  150
###[2,]  220

r=val%*%FO
# Mostrar la matriz r
r

##       [,1]
## [1,] 20625
## [2,] 19125
## [3,] 15000

# como se observa la solución óptima del sistema es 20625 con las variables 
# X1=0 y x2=93.75

