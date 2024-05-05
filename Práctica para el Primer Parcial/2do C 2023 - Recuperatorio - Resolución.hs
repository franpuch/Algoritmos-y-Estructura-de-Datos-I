-- Recuperatorio Primer Parcial - Haskell
-- 2do Cuatrimestre 2023 - Tema A

import Data.Char

esMin :: Char -> Bool
esMin a = ord a >= ord 'a' && ord a <= ord 'z' 

-- La función "esMin" devuelve "True" si el carácter está en el rango de las letras minúsculas
-- del alfabeto inglés (en el código ASCII) y "False" en caso contrario.

charANat :: Char -> Int 
charANat a | esMin a = (ord a) - (ord 'a')

-- La función "charANat" devuelve la posición relativa del carácter en el alfabeto inglés 
-- (en el código ASCII) si es una letra minúscula; y si no, no devuelve nada.

natAChar :: Int -> Char 
natAChar n | 0 <= n && n <= 25 = chr ((ord 'a') + n) 

-- La función está diseñada para convertir un número entero (que representa la posición 
-- relativa, en el código ASCII, de una letra en el alfabeto inglés) en el carácter 
-- correspondiente.

natAChar1 :: Int -> Char 
natAChar1 n | (-25) <= n && n < 0 = chr ((ord 'z') + n) 

-- La función "natAChar1" devuelve el carácter correspondiente al número entero negativo 
-- dado, si está dentro del rango válido para las letras minúsculas del alfabeto inglés 
-- (en el código ASCII) en orden inverso, y si no, no devuelve nada. 


-- Ejercicio 1. 

cantMinuscula :: String -> Int 
cantMinuscula [] = 0
cantMinuscula (x:xs) | esMin x == True = 1 + cantMinuscula xs 
                     | otherwise = cantMinuscula xs 

-- Es los mismo poner en la signatura String que poner [Char], Haskell entiende 
-- que son lo mismo. 
-- Le paso una lista de caracteres (String) y voy mirando el primer elemento.
-- Si "esMin" de el primer elemento es "True", sumo 1 y hago el Paso Recursivo.
-- Si "esMin" de el primer elemento es "False", no sumo nada y paso al siguiente
-- (hago el Paso Recursivo).


-- Ejercicio 2.

maximoCambios :: [String] -> String 
maximoCambios [x] = x 
maximoCambios (x:xs) | cantMinuscula (x) >= cantMinuscula (maximoCambios xs) = x 
                     | otherwise = maximoCambios xs 

-- Comparo de a dos en dos. Agarro el primer elemento de [mensajes], le calculo
-- su cantidad de letras minúsculas (con la función "cantMinuscula") y lo 
-- comparo con la cantidad de minúsculas de "xs". Digamos que la función
-- "magicamente" sabe cuál es el mensaje con más minúsculas dentro de "xs".
-- En realidad, ese "saber magicamente" es el resultado de ir recursivamente 
-- comparando dentro de "xs". 
-- Como resultado devuelve el String con mayor número de letras minúsculas (que
-- son aquellas que hay que "cambiar" para codificar el mensaje). 


-- Ejercicio 3. 

desplazar :: Char -> Int -> Char 
desplazar a n | (esMin a) && (n > 0) && (n <= 25) && ((charANat (a) + n) <= 25) = natAChar (charANat (a) + n)            -- (1)
              | (esMin a) && (n > 0) && (n <= 25) && ((charANat (a) + n) > 25) = natAChar ( (charANat (a) + n) - 26)     -- (2)
              | (esMin a) && (n >= (-25)) && ( n < 0) && ((charANat (a) + n) >= 0) = natAChar (charANat (a) + n )        -- (3)
              | (esMin a) && (n >= (-25)) && ( n < 0) && ((charANat (a) + n) < 0) = natAChar (26 + (charANat (a) + n ))  -- (4)
              | (n == 0) = a                                                                                             -- (5)  
              | (not (esMin a)) = a                                                                                      -- (6)

-- Tener en cuenta que la posición de 'a' es 0 y la posición de 'z' es 25.
-- Analicemos guarda por guarda:
-- (1) Caso "a" es minúscula, "n" es positivo y la suma entre la posición de "a" y "n"
--     es menor/igual a 25 = sumo (posición de "a") y "n" y busco ese caractér.
-- (2) Caso "a" es minúscula, "n" es positivo y la suma entre la posición de "a" y "n"
--     es mayor a 25 = cuando me paso de 'z', tengo que arrancar desde 'a'. Entonces
--     busco el caracter de la diferencia entre la suma (de la posición de "a" y "n")
--     y 26 (26 y no 25 porque la posición de 'a' es 0).
-- (3) Caso "a" es minúscula, "n" es negativo y la suma entre la posición de "a" y "n"
--     es mayor/igual a cero = resto (posición de "a" más "n") y 26, y busco ese caractér.
-- (4) Caso "a" es minúscula, "n" es negativo y la suma entre la posición de "a" y "n"
--     es menor a cero = cuando me paso de 'a', tengo que seguir contando desde 'z'.
--     Entonces, a 26 le sumo la "suma entre posición de "a" y "n"" (que es un número 
--     negativo) y busco ese caracter.
-- En (3) y (4) lo mismo con el 26. Entre 'a' y 'z' hay 26 caracteres porque la posición
-- de 'a' es 0.
-- (5) Caso "n = 0" = no me desplazo nada, estonces devuelvo "a".
-- (6) Caso "a" no es minúscula = devuelvo "a", por especificación.


-- Ejercicio 4. 

codificar :: String -> Int -> String  
codificar [] _ = [] 
codificar (x:xs) n | esMin x = (desplazar x n) : codificar xs n  
                   | otherwise = x : codificar xs n  

-- Tomo un String, agarro su primer elemento, lo "desplazo n" caracteres e inserto
-- ese caracter resultado en la lista resultado de llamar recursivamente a la
-- función con "xs". Cuando llega a la lista vacía, devuelvo esa lista vacía, y
-- allí voy metiendo todos los caracteres codificados que fuí dejando en el camino.
-- Si "x" no es una letra minúscula, dejo en "zona de insertado" al caracter como
-- está (no le hago nada).  


-- Ejercicio 5.

decodificar :: String -> Int -> String 
decodificar mensaje n = codificar mensaje (-n) 

-- Llamo a la función "codificar" y le paso "mensaje" (mensaje codificado) y "-n".
-- Como "codificar" desplaza (para adelante) sumando, para decodificar le voy a
-- pedir que desplace (para atrás) sumando un negativo.

-- * Fin del Recuperatorio Primer Parcial.