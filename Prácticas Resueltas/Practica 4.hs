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

{- generadorImpares :: Integer -> Integer  
generadorImpares n = 2 * n - 1 

sumarImparesHasta :: Integer -> Integer  
sumarImparesHasta n | n == 0 = 0  
                    | otherwise = generadorImpares ( n ) + sumarImparesHasta ( n - 1 ) -}

-- ? Estas últimas dos funciones comentadadas sí funcionan como deben. La función 
-- ? "generadorImpares" toma "n" y fabrica un impar "anterior". Debo cambiar el caso base
-- ? ya que no puedo permitir que llegue "n = 0", porque "generadorImpares" devolvería -1
-- ? y me rompería toda la suma que necesito.


-- * Ejercicio 5 

medioFact :: Integer -> Integer
medioFact n | n == 0 = 1
            | n == 1 = 1
            | otherwise = n * medioFact ( n - 2 )  

-- Esta función agarra un "n" y lo va multiplicando por sus "ante-anterior", calculando una
-- especie de medio factorial. Tengo 2 casos base:
-- n == 0 = 1 --> viene para los "n" de entrada que son pares.
-- n == 1 = 1 --> viene para los "n" de entrada que son impares. Si empieza a restar 2 a
-- números impares, nunca caigo en 0. Sin embargo, en algún momento debo terminar la
-- recursión. El número mas cercano a cero en el que sí caigo y del cual no quiero nada hacia
-- atras es el 1. 


-- * Ejercicio 6

primerDigito :: Integer -> Integer 
primerDigito n = mod n 10  

sumaDigitos :: Integer -> Integer 
sumaDigitos n | n <= 0 = 0
              | otherwise = primerDigito n + sumaDigitos ( div n 10 )  


-- * Ejercicio 7

todosDigitosIguales :: Integer -> Bool 
todosDigitosIguales n | div n 10 == 0 = True 
                      | otherwise = primerDigito n == primerDigito ( div n 10 ) && ( todosDigitosIguales ( div n 10 ) ) 

-- Recupero y utilizo la función "primerDigito" del Ejercicio 6. 


-- * Ejercicio 8 

recortadorDeNumero :: Integer -> Integer -> Integer 
recortadorDeNumero n k = div n ( 10 ^ k ) 

-- Esta función limpia "k" dígitos (desde la unidad). Ejemplo: n = 857 ^ k = 2 evalúa 8, 
-- recorta dos dígitos desde la unidad (en este caso recorta 5 y el 7).  

iesimoDigito :: Integer -> Integer -> Integer 
iesimoDigito n k | k == 1 = primerDigito n 
                 | otherwise = primerDigito ( recortadorDeNumero n ( k - 1 ) ) 

-- A esta función le pedís que te dé el dígito "k" de "n", recorta "n" hasta que en la unidad
-- quede el dígito que debe devolver y devuelve ese primer dígito.
-- El parametro "k" indica cuántos dígitos recortar. Llama a la función "recortadorDeNumeros" 
-- y le pasa "k - 1" ya que si yo quiero obtener el tercer dígito, sólo debo recortar 
-- dos veces (2 = k - 1). 

-- ? Creo que "iesimoDigito" (que usa "recortadorDeNumero") no trabaja con RECURSIÓN.


recortadorDeNumero2 :: Integer -> Integer -> Integer -> Integer  
recortadorDeNumero2 n c k | c == k = primerDigito n
                          | otherwise = recortadorDeNumero2 ( div n 10 ) ( c + 1 ) k   

-- Esta función recorta el número "n" "k" veces, limpiando el dígito de la unidad.
-- n -> número que va recortando.
-- c -> contador de cortes (sobre el que se va haciendo la recursión), cada vez que corta "n" 
--      suma 1 al contador.
-- k -> cantidad de veces que debe cortar al número "n".
-- Arranco con "c" en 1 (mirar función que sigue). Si el contador de cortes (c) no es 
-- igual a la cantidad de veces que debe cortar (k), corta a "n", suma 1 al contador 
-- y vuelve a evaluar. Cuando "c = k", deja de corta y devuelve el primer dígito 
-- del "n" que quedó.

iesimoDigito2 :: Integer -> Integer -> Integer 
iesimoDigito2 n k = recortadorDeNumero2 n 1 k 

-- Pido que el parámetro "c = contador de cortes" arranque en 1, a modo de "corte inicial".


-- * Ejercicio 9 

cantDigitos :: Integer -> Integer
cantDigitos n | div n 10 == 0 = 1
              | otherwise = cantDigitos ( div n 10 ) + 1  

-- Cuenta la cantidad de dígitos de un número "n".

compararCifras :: Integer -> Integer -> Bool 
compararCifras n k | k == 1 = True 
                   | ( k == 2 ) && ( primerDigito ( n ) == iesimoDigito2 ( n ) ( 2 ) ) = True 
                   | primerDigito ( n ) == iesimoDigito2 ( n ) ( k ) = compararCifras ( div n 10 ) ( k - 2 )  
                   | otherwise = False  

-- Arranca con "n" (un número) y "k" (su cantidad de cifras). Hay dos casos: que el número tenga
-- una cantidad de cifras par (1) o una cantidad de cifras impar (2). La idea central es:
-- comparo el primer dígito con el último; si son iguales, le saco ese primer dígito a "n" 
-- y lo comparo con el ante-último  (porque el último no puedo sacarlo y ese ya lo comparé).
-- Para agarrar ese ante-último, a la cantidad de dígitos le resto 2.
-- (1) La recursión termina cuando la cantidad de cifras es 2, y estas deben ser iguales.
-- (2) La recursión termina cuando la cantidad de cifras es 1, y esta puede ser cualquier número
-- (es el "pivote" del capicúa).

esCapicua :: Integer -> Bool 
esCapicua n = compararCifras ( n ) ( cantDigitos ( n ) ) 
 
-- No sé exactamente cómo, pero funciona.


-- * Ejercicio 10

itemA :: Integer -> Integer 
itemA 0 = 1
itemA n = ( 2 ^ n ) + itemA ( n - 1 ) 

itemB :: Float -> Integer -> Float  
itemB q 1 = q 
itemB q n = ( q ^ n ) + itemB q ( n - 1 ) 

itemC :: Float -> Integer -> Float 
itemC q 1 = ( q ^ 2 )
itemC q n = ( q ^ ( 2 * n ) ) + itemC q ( n - 1 ) 

itemD :: Float -> Integer -> Float
itemD q n = ( itemC q n ) - ( itemB q ( n - 1 ) )  


-- * Ejercicio 11 

factorial :: Integer -> Float  
factorial 0 = 1
factorial n = fromIntegral ( n ) * factorial ( n - 1 ) 

-- La función "factorial" funcionaría perfectamente con la signatura "Integer -> Integer".
-- Sin embargo, como la siguiente función necesita un Float proveniente de la función 
-- "factorial", le pongo la signatura que tiene. Ahora, "factorial" hace recursión; 
-- el primer término es el "n" valor de entrada (que es Integer y rompe la función 
-- ya que, por su signatura, debe devolver Float). Por eso al primer término de "factorial"
-- lo trasnformo en Float con la función (integrada en Haskell) "fromInteger". 

eAprox :: Integer -> Float 
eAprox 0 = 1.0
eAprox n = ( 1 / factorial ( n ) ) + eAprox ( n - 1 )   

e :: Float 
e = eAprox 9 

-- Te preguntaras... el enunciado pide aproximar con 10 término. Tranquilo mi ciela.
-- La función hace recursión hasta el 0; o sea digamos, si le pongo 10, la sumatoria
-- va a tener 11 términos. Pero eso le pongo 9. 


-- * Ejercicio 12 

sucesionA :: Integer -> Float 
sucesionA n | n == 1 = 2
            | otherwise = 2 + ( 1 / sucesionA ( n - 1 ) ) 

raizDe2Aprox :: Integer -> Float 
raizDe2Aprox n = sucesionA n - 1 


-- * Ejercicio 13

sumatoriaInterna :: Integer -> Integer -> Integer  
sumatoriaInterna n 1 = n  
sumatoriaInterna n k = ( n ^ k ) + sumatoriaInterna n ( k - 1 ) 

sumatoriaDoble :: Integer -> Integer -> Integer 
sumatoriaDoble 1 k = 1 * k
sumatoriaDoble n k = ( sumatoriaInterna n k ) + ( sumatoriaDoble ( n - 1 ) k )  

-- ? Te preguntaras... ¿Por qué el caso base de "sumatoriaDoble" es "1 * k"? Bueno...
-- ? Originariamente el caso base era "1 k = 1". Pero si lo dejo así, suma 1 una sola 
-- ? vez; no hace "sumatoriaInterna" con el 1. El no ejecutar "sumatoriaInterna" con el 
-- ? 1 hace que "pierda 1s". Para solucionarlo, hago manualmente "sumatoriaInterna" para 
-- ? el caso base. Como ( 1 ^ k = 1 ), si hago variar el "k" y voy sumando los resultados,
-- ? es lo mismo que sumar "k" veces 1; es decir, "1 * k". 


-- * Ejercicio 14 

-- n ^ ( a + b ) -> quiero hacer recursión sobre "b" y luego sobre "a" 

sumaPotenciasB :: Integer -> Integer -> Integer -> Integer 
sumaPotenciasB n a b | b == 1 = n ^ ( a + 1 )
                     | otherwise = n ^ ( a + b ) + sumaPotenciasB n a ( b - 1 ) 

sumaPotencias :: Integer -> Integer -> Integer -> Integer 
sumaPotencias n a b | a == 1  = sumaPotenciasB n a b 
                    | otherwise = ( sumaPotenciasB n a b ) + ( sumaPotencias n ( a - 1 ) b )  

-- ! Revisar el cuaderno.
-- Junto a la Especificación hice un ejemplo donde se ve mas explícitamente qué
-- hacen las funciones (expliarlo es mucho texto jajaja, con el ejemplo lo
-- entendes a toque).


-- * Ejercicio 15

sumaRacionalesDenominador :: Integer -> Integer -> Float 
sumaRacionalesDenominador p 1 = fromIntegral ( p ) 
sumaRacionalesDenominador p q = ( fromIntegral ( p ) / fromIntegral ( q ) ) + sumaRacionalesDenominador p ( q - 1 )  

-- Utilizo la función "fromIntegral" en el caso base ya que la función espera como resultado 
-- un Float, y "p" es Integer; para que no explote, transformo el "p" a Float y ualá.
-- También utilizo "fromIntegral" para la parte de la división con "/" ya que esa 
-- operación pertenece a los Tipo Float, no a los Tipo Int.

sumaRacionales :: Integer -> Integer -> Float
sumaRacionales 1 q = sumaRacionalesDenominador 1 q 
sumaRacionales p q = ( sumaRacionalesDenominador p q ) + ( sumaRacionales ( p - 1 ) q )  

-- ! Revisar el cuaderno.
-- Junto a la Especificación hice un ejemplo donde se ve mas explícitamente qué
-- hacen las funciones (expliarlo es mucho texto jajaja, con el ejemplo lo
-- entendes a toque).


-- * Ejercicio 16

-- Item a --

menorDivisorHasta :: Integer -> Integer -> Integer 
menorDivisorHasta n k | mod n k == 0 = k     
                      | otherwise = menorDivisorHasta n ( k + 1 )   

-- Si "k" es divisor de "n", devuelvo "k". Sino, pruebo si el siguente a "k" es 
-- divisor de "n". ¿Cuando paro? cuando me cruzo al primer divisor de "n". 

menorDivisor :: Integer -> Integer 
menorDivisor n = menorDivisorHasta n 2  

-- Llamo a "menorDivisorHasta" y le digo que busque el primer divisor arrancando en 2
-- (el divisor mas chico que puede tener "n").
-- OBS Imp: la función no va a entrar en un bucle infinito ya que siempre va a llegar a
-- "n", y va a parar (porque "n" divide a "n").


-- Item b -- 

esPrimo :: Integer -> Bool 
esPrimo n = menorDivisor n == n 

-- OBS Imp: No pongo guardas para decirle a la función cuando es True o False 
-- (para ahorrarme texto). Por signatura la función ya sabe que debe devolver un Bool.
-- Directamente le digo qué evaluar y ella ya interpreta: si lo que debe evaluar se
-- cumple, debe devolver True; si no se cumple, debe devolver False.


-- Item c --

sonCoprimos :: Integer -> Integer -> Bool 
sonCoprimos n k | ( esPrimo n == True ) && ( esPrimo k == True ) = True 
                | n == 1 = True   -- Caso Base para ( n < k )
                | k == 1 = True   -- Caso Base para ( n > k )
                | ( mod n k == 0 ) || ( mod k n == 0 ) = False 
                | n > k = sonCoprimos n ( k - 1 )
                | n < k = sonCoprimos ( n - 1 ) k   

-- Vamos por parte...
-- Si ambos son primos, entonces son coprimos entre sí.
-- n > k --> divido a "n" por "k". Si "k" no divide a "n", divido a "n" por el anterior
--           de "k". Así hasta llegar a "k = 1", que quiere decir que son coprimos.
-- n < k --> lo mismo que antes pero al revés. Si "n" no divide a "k", divido a "k" por
--           el anterior de "n". Así hasta llegar a "n = 1", que quiere decir que son 
--           coprimos. 


-- Item d --

contadorDePrimos :: Integer -> Integer -> Integer -> Integer 
contadorDePrimos n c p | c == p = ( n - 1 ) 
                       | ( esPrimo n == True ) = contadorDePrimos ( n + 1 ) ( c + 1 ) p 
                       | ( esPrimo n == False ) = contadorDePrimos ( n + 1 ) c p 

-- Le pedis el primo número "p" y lo que hace es contar hasta que llega al primo que 
-- pediste.
-- n -> número que verifica si es primo.
-- c -> contador de primos; cada vez que se cruza con un primo, suma 1 al contador.
-- p -> primo número que le pediste.
-- Funcionamiento general: verifica si "n" es primo. Si "n" es primo, suma 1 al 
-- contador y pasa al siguiente "n". Si "n" no es primo, no suma nada al contador
-- y sigue con el siguiente "n".
-- Cuando el contador (c) es igual al número de primo que le pediste (p), te devuelve 
-- el anterior del último "n" que tomó. ¿Por qué el anterior? Porque primero sumó 1
-- al "n" (para seguir avanzando) y despúes verificó que "c = p". Por eso le resto ese
-- último 1 que sumó, para obtener el "n" correspondiente al "c" que quiero.

nEsimoPrimo :: Integer -> Integer 
nEsimoPrimo n = contadorDePrimos 3 1 n 

-- Le paso a "contadorDePrimos" que arranque verificando "n = 3", que inicie 
-- el contador en "c = 1" (para que el primer primo sea "2") y que tome como
-- número de primo (p) a "n".
-- ¿Por qué le digo que arranque verificando "n = 3" y no "n = 2"? Pues
-- "contadorDePrimos" devuelve como resultado el anterior al "n" que verifica
-- si es primo o no; por lo tanto, si quiero que el primer primo sea "2", 
-- debo decirle que arranque a verificar en "n = 3".   


-- * Ejercicio 17

comparadorFibonacci :: Integer -> Integer -> Bool 
comparadorFibonacci n k | fibonacci n == k = True 
                        | fibonacci n > k = False 
                        | otherwise = comparadorFibonacci ( n + 1 ) k 

-- La variable "k" es el número que quiero que vea si es fibonacci. Utiliza la
-- función del Ejercicio 1. Calcula el n-esimo fibonacci y lo compara con "k".
-- Si son iguales, devuelve True; sino, pasa al siguiente "n + 1"-esimo fibonacci
-- y vuelve a comparar (y así sucesivamente). ¿Cuándo para? Cuando encuentra el 
-- "k" entre los fibonacci, o cuando encuentra el primer fibonacci mayor que "k". 

esFibonacci :: Integer -> Bool
esFibonacci n = comparadorFibonacci 1 n 

-- Llama a la función "comparadorFibonacci" y le dice que empiece a calcular
-- fibonaccis (desde el primero) y los compare con el "n" (quien quiero ver que
-- sea o no fibonacci).


-- * Ejercicio 18

comparadorDeDigitos :: Integer -> Integer -> Integer 
comparadorDeDigitos n k | ( cantDigitos n == 1 ) && ( n <= k ) = k
                        | ( cantDigitos n == 1 ) && ( n >= k ) = n 
                        | primerDigito n <= k = comparadorDeDigitos ( div n 10 ) k
                        | primerDigito n >= k = comparadorDeDigitos ( div n 10 ) ( primerDigito n )

-- Esta función busca el dígito mas grande de forma indirecta. Recibe un número "n" y 
-- va a comparar cada cifra con otro número "k". Siempre agarra la cifra de la unidad 
-- (de "n") y lo compara con "k": si esa primer cifra es mayor que "k", se llama a sí 
-- misma, toma como nuevo "k" a esa primer cifra, y toma como nuevo "n" a el "n sin
-- su primer cifra"; si esa primer cifra es menor que "k", se llama a sí misma, mantiene
-- el "k" que tenía, y toma como nuevo "n" a el "n sin su primer cifra". Así hasta que 
-- "n" tiene una sola cifra, y compara esa última cifra con el "k" que viene arrastrando.  

maximoDigito :: Integer -> Integer 
maximoDigito n = comparadorDeDigitos n 1

-- Esta función devuelve el dítito mas grande de un número "n" (de forma directa).
-- Llama a la función "comparadorDeDigitos" y le dice que "k" sea 1 (como para darle
-- el valor más chico y no perder posibles dígitos mayores dentro de "n"). 

esPar :: Integer -> Bool 
esPar n = mod n 2 == 0

todosSusDigitosSonImpares :: Integer -> Bool 
todosSusDigitosSonImpares n | ( div n 10 == 0 ) && ( esPar n == False ) = True 
                            | ( esPar (mod n 10) == False ) = todosSusDigitosSonImpares ( div n 10 ) 
                            | otherwise = False  
 
 
-- TODO: Falta la función que resuelva el problema del Ejercicio ("mayorDigitoPar").


-- * Ejercicio 19 

sumaDePrimos :: Integer -> Integer
sumaDePrimos n | n == 1 = 2
               | otherwise = ( nEsimoPrimo n ) + ( sumaDePrimos ( n - 1 ) ) 

-- Esta función realiza la suma de los primeros "n" Primos. Calcula el "n"-esimo 
-- Primo y lo suma con el anterior. La función hace recursión hasta que llega a 
-- "n = 1", donde ya sabe que el primer primo es 2. 

esSumaInicialDePrimosAux :: Integer -> Integer -> Bool  
esSumaInicialDePrimosAux n k | n == sumaDePrimos k = True 
                             | n < sumaDePrimos k = False 
                             | otherwise = esSumaInicialDePrimosAux n ( k + 1 ) 

-- Suma los primeros "k" números primos, y lo compara con "n". 
-- Hace recursión. Arranca sumando los primeros "k" primos, si la suma no es igual
-- a "n", suma los primeros "k + 1" primos y vuelve a comparar. ¿Cuando para? Cuando
-- "n" es igual a la suma de los "k" primos (para algún "k"), o cuando la suma de 
-- los primos dá un número mayor que "n".

esSumaInicialDePrimos :: Integer -> Bool 
esSumaInicialDePrimos n = esSumaInicialDePrimosAux n 1  

-- Le dá un "n" a "esSumaInicialDePrimosAux" y le dice que empiece a calcular la suma 
-- de primos desde el 1er primo.


-- * Ejercicio 20

sumaDivisoresHasta :: Integer -> Integer -> Integer
sumaDivisoresHasta _ 1 = 1
sumaDivisoresHasta n m | mod n m == 0 = m + sumaDivisoresHasta n (m-1) 
                       | otherwise = sumaDivisoresHasta n (m-1) 

-- Suma los divisores de "n" hasta llegar a "m".
-- "m" es el número que voy fijandome que sea divisor, es sobre el cual hago la recursión.
-- Voy con recursión hacia atrás, cuando llego a "m = 1", devuelvo 1 ya que es divisor 
-- universal.

sumaDivisores :: Integer -> Integer 
sumaDivisores n = sumaDivisoresHasta n n 

-- Le doy un "n" y me calcula la suma de sus divisores.

tomaValorMax :: Integer -> Integer -> Integer 
tomaValorMax n1 n2 | n1 == n2 = n1 
                   | sumaDivisores n1 >= sumaDivisores (tomaValorMax (n1+1) n2) = n1
                   | otherwise = tomaValorMax (n1+1) n2 

-- Agarro un rango de números [n1,n2] y quiero ver qué número en ese rango tiene mayor suma
-- de divisores. La idea es que mágicamentes conozco la respuesta entre el rango [n1 + 1 , n2].
-- Entonces, comparo (sumaDeDivisores n1) con (sumaDeDivisores (tomaValorMax (n1+1) n2)), 
-- porque conozco la respuesta de (tomaValorMax (n1+1) n2). Así voy a ir recursivamente 
-- hasta que n1 llegue a n2; es decír, n1 = n2. En ese caso, la respuesta trivial es n2.
-- La última comparación es (sumaDeDivisores n1) con (sumaDeDivisores (paso recursivo)).
-- Allí gana o el n1 o el paso recursivo (el resultado de todas las recursiones).  

-- Esta es otra forma de pensar la recursión. Yo conozco el resultado del "paso recursivo"
-- "mágicamente". Entonces, es como que lo uso en la función que estoy comparando.
-- El caso base es el caso "trivial".


-- * Ejercicio 21   

auxiliar1 :: Integer -> Integer -> Integer -> Integer 
auxiliar1 m n r | ( n == 0 ) && ( m <= r ) = 1 
                | ( n == 0 ) && ( m > r ) = 0 
                | ( m ^ 2 ) + ( n ^ 2 ) <= ( r ^ 2 ) = ( auxiliar1 m ( n - 1 ) r ) + 1 
                | otherwise = auxiliar1 m ( n - 1 ) r 

-- ! Revisar el cuaderno.
-- En el cuaderno tengo el desarrollo en papel de un caso. Esta función deja fijo
-- el "m" y hace la recursión sobre el "n". Cada vez que verifica la desigualdad, 
-- suma 1 (para ir contando); si no se verifica la desigualdad, no suma nada y sigue 
-- bajando en la recursión.
-- En cuanto a los dos casos base... Cuando "n = 0", la desigualdad depende de "m".
-- Si "m <= r", entonces "(m^2) <= (r^2)"; por lo tanto quiero que se sume ese caso
-- (sumo 1). Si "m > r", entonces "(m^2) > (r^2)"; por lo tanto no quiero que se sume
-- ese caso (sumo 0, no sumo nada).  

pitagoras :: Integer -> Integer -> Integer -> Integer 
pitagoras m n r | ( m == 0 ) = auxiliar1 0 n r 
                | otherwise = ( auxiliar1 m n r ) + ( pitagoras ( m - 1 ) n r ) 

-- Nuevamente -- ! Revisar el cuaderno.
-- Esta función hace la recursión sobre "m", y a cada "m" le aplica la función 
-- "auxiliar1".      


-- * Fin de la Práctica 4. 