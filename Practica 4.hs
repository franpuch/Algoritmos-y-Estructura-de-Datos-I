-- Práctica 4 - Recursión sobre Numeros Enteros. 

-- * Ejercicio 1

fibonacci :: Integer -> Integer 
fibonacci n | n == 1 = 0
            | n == 2 = 1 
            | otherwise = fibonacci(n-1) + fibonacci(n-2)  

-- ? No entiendo por qué si le pongo como casos base "n == 0" y "n == 1", no funciona. Pero
-- ? bueno tiene mas sentido así (como lo hice) ya que verdaderamente el 1er fibonacci es
-- ? 0 y el 2do es 1. Además, así funciona y da lo que debe dar. 


-- * Ejercicio 2

parteEntera :: Float -> Integer 
parteEntera n | ( n > 0 ) && ( n < 1 ) || ( n == 0 ) = 0
              | n > 0 = parteEntera ( n - 1 ) + 1
              | n < 0 = parteEntera ( n + 1 ) - 1 

-- Agarro un número "n" y empiezo a restarle 1 hasta que desaparezca la parte entera. Hay 
-- dos opciones: 1) que "n" sea puramente entero, hacer desaparecer su parte entera es
-- llegar a cero; 2) que "n" tenga parte entera y decimal, hacer desaparecer su parte
-- entera es dejar su parte decimal solita. Ahora, por cada vez que resto 1, sumo 1 para
-- ir "recuperando" esa parte entera que voy sacando. Cuando me quedo sin parte entera
-- (o sea, que "n" quede cero o que "n" quede solo decimal) sumo 0 (para no pasarme) y
-- termino; ahí establezco el caso base. Para los "n" negativos, es al revés: "sumar un 
-- negativo" es restar 1.  


-- * Ejercicio 3 

esDivisible :: Integer -> Integer -> Bool 
esDivisible n k | n == 0 = True
                | ( n > 0 ) && ( n < k ) = False
                | otherwise = esDivisible ( n - k ) k  

-- A "n" lo quiero dividir por "k" sin dividirlos jajaja. Agarro "n" y le empiezo a 
-- restar "k", puedo caer en alguno de los siguientes dos casos: 1) "n" (tras restarle
-- una determinada cantidad de veces "k") llega a cero, me indica que el resto es cero
-- y "k" divide a "n"; 2) "n" (tras restarle una determinada cantidad de veces "k")
-- llega a un número mas chico que "k", indicandome que el resto NO es cero y "k" no
-- divide a "n". 


-- * Ejercicio 4

generadorImpares :: Integer -> Integer  
generadorImpares n = 2 * n + 1 

sumarImparesHasta :: Integer -> Integer  
sumarImparesHasta n | n == 0 = 1  
                    | otherwise = generadorImpares ( n ) + sumarImparesHasta ( n - 1 ) 

-- Esta función recibe "n" y genera el impar con "n" (enchufa "n" en la función 
-- generadorImpares). Luego, se llama a sí misma, pero con el "n" anterios, y
-- se lo suma al que ya tenía. Continúa así hasta que llega a "n = 0", que  
-- da 1 (se adelanta a generadorImpares, ya sabe el resultado).

sumaImpares :: Integer -> Integer 
sumaImpares n = sumarImparesHasta n  

-- ? La función no cumple su objetivo (por un poquito). Devuelve la suma de impares,
-- ? pero suma un impar de más. Ejemplo: sumarImpares 3 --> 16 , sumarImpares 2 --> 9.
-- ? Hay un impar que lo calcula de más y lo mete en la suma. 
-- ? Dato extra: la función "sumarImpares" está de más. O sea, a la función 
-- ? "SumarImparesHasta" puedo llamarla "sumarImpares" y me ahorré texto. Pero primero
-- ? preguntá cómo arreglar la función.

