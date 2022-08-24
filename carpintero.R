library(matlib)

# Asignar los coeficientes de las restricciones
# 4x1 + 9.5x2  <= 38        4   9.5     (1)
# x1 + x2      <= 7.5       1   1     (2)
# Definir el número de columnas en 2 y el número de filas en 2
E<-matrix(c(4,1,9.5,1), ncol = 2, nrow = 2)

# Asignar los valores del lado derecho de las desiguldades
# 4x1 + 9.5x2  <= 38        38      (1)
# x1 + x2      <= 7.5       7.5     (2)
F<- c(38,7.5)

plotEqn(E,F, xlim=c(0,10), labels=TRUE)


# Intersección A

# Intersección de la restricción 1 con la recta del eje x2
# Se resuelve de manera matricial como ;
# 4x1 + 9.5x2 = 38
# x1 + x2	    = 7.5

# entonces las matrices A y B quedan como:
# [A=
#             4     9.5
#             1     1
# ;B=
#             38
#             7.5
# ]

A <- matrix(c(4,9.5,1,1), nrow = 2, ncol = 2, byrow = T)
A
B <- matrix(c(38,7.5), nrow = 2, ncol = 1, byrow = F)
B
r <- solve(t(A)%*%A)%*%t(A)%*%B
r

# Definiendo la función objetivo

# Para ello escribe el código como
val<-matrix(c(0, 4, 6.045455, 1.454545, 7.5, 0), nrow=3, ncol = 2, byrow=T)
# Mostrar la matriz val
val
##      [,1]      [,2]
## [1,]    0      4
## [2,]  6.045455 1.454545
## [3,]  7.5      0

FO<-matrix(c(4,8.5), nrow=2, ncol=1)
# Mostrar la matriz FO
FO
##      [,1]
## [1,]  4
###[2,]  8.5

r=val%*%FO
# Mostrar la matriz r
r





