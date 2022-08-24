library(matlib)
C<-matrix(c(1,6,1,0,1,-4,0,1), ncol = 2, nrow = 4)
D<- c(14,2,5,3)
plotEqn(C,D, xlim=c(0,13), labels=TRUE)

# Intersección A

# Se resuelve de manera matricial como ;
# x1 + x2 = 14
# x1	    = 5

# entonces las matrices A y B quedan como:
# [A=
#             1     1
#             1     0
# ;B=
#             14
#             5
# ]


C <- matrix(c(1,1,1,0), nrow = 2, ncol = 2, byrow = T)
D <- matrix(c(14,5), nrow = 2, ncol = 1, byrow = F)
r <- solve(t(C)%*%C)%*%t(C)%*%D
r


# Intersección B

# Se resuelve de manera matricial como ;
# x1  + x2  = 14
# 6x1 - 4x2	= 2

C <- matrix(c(1,1,6,-4), nrow = 2, ncol = 2, byrow = T)
D <- matrix(c(14,2), nrow = 2, ncol = 1, byrow = F)
r <- solve(t(C)%*%C)%*%t(C)%*%D
r



# Intersección C

# Se resuelve de manera matricial como ;
# 6x1 - 4x2	= 2
# x1        = 5

C <- matrix(c(6,-4,1,0), nrow = 2, ncol = 2, byrow = T)
D <- matrix(c(2,5), nrow = 2, ncol = 1, byrow = F)
r <- solve(t(C)%*%C)%*%t(C)%*%D
r



# Por último se busca determinar los puntos donde la función se maximice; por 
# lo que simplemente se evalua en la función objetivo cada uno de los puntos 
# encontrados.

# Definiendo la función objetivo

# Para ello escribe el código como
val<-matrix(c(5, 9, 5.8, 8.2, 5, 7), nrow=3, ncol = 2, byrow=T)
FO<-matrix(c(7,5), nrow=2, ncol=1)
r=val%*%FO
r
