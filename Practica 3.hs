-- Práctica 3 - Introducción a Haskell.

-- ** Ejercicio 1

f :: Integer -> Integer 
f n | n == 1 = 8
    | n == 4 = 131
    | n == 16 = 16

g :: Integer -> Integer
g n | n == 8 = 16
    | n == 16 = 4
    | n == 131 = 1

h :: Integer -> Integer
h n | n == 1 = 16
    | n == 4 = 1
    | n == 16 = 4

k :: Integer -> Integer
k n | n == 8 = 16
    | n == 16 = 131
    | n == 131 = 8


-- ** Ejercicio 2

absoluto :: Integer -> Integer
absoluto n | n > 0 = n
           | n == 0 = 0
           | n < 0 = ( -n ) 

maximoAbsoluto :: Integer -> Integer -> Integer
maximoAbsoluto n k | ( absoluto(n) ) > ( absoluto(k) ) = ( absoluto(n) ) 
                   | otherwise = ( absoluto(k) ) 

maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 n k r | ( n >= k ) && ( n >= r ) = n
              | ( k >= n ) && ( k >= r ) = k
              | ( r >= k ) && ( r >= n ) = r  

mismoIntervalo :: Float -> Float -> Bool 
mismoIntervalo n k | ( n <= 3 ) && ( k <= 3 ) = True
                   | ( ( 3 < n ) && ( n <= 7 ) ) && ( ( 3 < k ) && ( k <= 7 ) ) = True
                   | ( n > 7 ) && ( k > 7 ) = True
                   | otherwise = False 

sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos n k r | ( n /= k ) && ( n /= r ) && ( k /= r ) = n + k + r
                    | ( n == k ) && ( n /= r ) = n + r
                    | ( n == r ) && ( n /= k ) = n + k
                    | ( k == r ) && ( k /= n ) = k + n  

esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe n k | ( mod n k ) == 0 = True
                 | otherwise = False 

digitoUnidades :: Integer -> Integer 
digitoUnidades n = mod n 10

digitoDecenas :: Integer -> Integer 
digitoDecenas n = mod ( div n 10 ) 10 

algunoEsO :: Float -> Float -> Bool  
algunoEsO n k | ( n == 0 ) || ( k == 0 ) = True 
              | otherwise = False 

-- Este es el anterior hecho con Pattern Matching.
algunoEsOPM :: Float -> Float -> Bool
algunoEsOPM 0 k = True 
algunoEsOPM n 0 = True 
algunoEsOPM n k = False

ambosSonO :: Float -> Float -> Bool 
ambosSonO n k | ( n == 0 ) && ( k == 0 ) = True 
              | otherwise = False 

-- Este es el anterior hecho con Pattern Matching.
ambosSonOPM :: Float -> Float -> Bool 
ambosSonOPM 0 0 = True 
ambosSonOPM n k = False


-- ** Ejercicio 3

estanRelacionados :: Integer -> Integer -> Bool 
estanRelacionados n r | n * n + n * r * k == 0 = True 
                      | otherwise = False 
                        where k = - ( div n r ) 


-- ** Ejercicio 4

prodInt :: (Float , Float) -> (Float , Float) -> Float 
prodInt (a , b) (c , d) = a * c + b * d

todoMenor :: (Float , Float) -> (Float , Float) -> Bool 
todoMenor (a , b) (c , d) | ( a < c ) && ( b < d ) = True 
                          | otherwise = False 

distanciaPuntos :: (Float , Float) -> (Float , Float) -> Float 
distanciaPuntos (a , b) (c , d) = sqrt ( ( ( c - a ) ^ 2 ) + ( ( d - b ) ^ 2 ) ) 

sumaTerna :: (Integer , Integer , Integer) -> Integer 
sumaTerna (a , b , c) = a + b + c 

sumarSoloMultiplos :: (Integer , Integer , Integer) -> Integer -> Integer 
sumarSoloMultiplos (a , b , c) n | ( mod a n == 0 ) && ( mod b n == 0 ) && ( mod c n == 0 ) = sumaTerna (a , b , c)
                                 | ( mod a n /= 0 ) && ( mod b n == 0 ) && ( mod c n == 0 ) = b + c 
                                 | ( mod a n == 0 ) && ( mod b n == 0 ) && ( mod c n /= 0 ) = a + b 
                                 | ( mod a n == 0 ) && ( mod b n /= 0 ) && ( mod c n == 0 ) = a + c 
                                 | ( mod a n == 0 ) && ( mod b n /= 0 ) && ( mod c n /= 0 ) = a 
                                 | ( mod a n /= 0 ) && ( mod b n == 0 ) && ( mod c n /= 0 ) = b 
                                 | ( mod a n /= 0 ) && ( mod b n /= 0 ) && ( mod c n == 0 ) = c 
                                 | otherwise = 0

posPrimerPar :: (Integer , Integer , Integer) -> Integer 
posPrimerPar (a , b , c) | ( mod a 2 == 0 ) = 1  
                         | ( mod b 2 == 0 ) = 2 
                         | ( mod c 2 == 0 ) = 3 
                         | ( mod a 2 /= 0 ) && ( mod b 2 /= 0 ) && ( mod c 2 /= 0 ) = 4 
-- *! En realidad, la primera posición es cero 0. Pero bueno, para que sea mas intuitivo a la primera posicion la ubico con 1. 

crearPar :: a -> b -> (a , b) 
crearPar a b = ( a , b )

invertir :: (a , b) -> (b , a) 
invertir (a , b) = (b , a) 


-- ** Ejercicio 5

auxiliarF :: Integer -> Integer 
auxiliarF n | ( n <= 7 ) = n * n
           | ( n > 7 ) = 2 * n - 1

auxiliarG :: Integer -> Integer 
auxiliarG n | ( mod n 2 == 0) = div n 2
            | otherwise = 3 * n + 1

todosMenores :: (Integer , Integer , Integer) -> Bool 
todosMenores (a , b , c) | ( ( ( auxiliarF a ) > ( auxiliarG a ) ) && ( ( auxiliarF b ) > ( auxiliarG b ) ) && ( ( auxiliarF c ) > ( auxiliarG c ) ) ) = True 
                         | otherwise = False 


-- ** Ejercicio 6

bisiesto :: Integer -> Bool 
bisiesto n | ( mod n 4 /= 0 ) || ( ( mod n 100 == 0 ) && ( mod n 400 /= 0 ) ) = False 
           | otherwise = True 


-- ** Ejercicio 8 

sumaUltimosDigitos :: Integer -> Integer 
sumaUltimosDigitos n = ( mod n 10 ) + ( mod ( div n 10 ) 10 )

comparar :: Integer -> Integer -> Integer 
comparar n k | ( sumaUltimosDigitos n ) < ( sumaUltimosDigitos k ) = 1
             | ( sumaUltimosDigitos n ) > ( sumaUltimosDigitos k ) = -1
             | ( sumaUltimosDigitos n ) == ( sumaUltimosDigitos k ) = 0

