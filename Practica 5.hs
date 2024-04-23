-- Práctica 5 - Recursión sobre Listas.

-- * Ejercicio 1

-- 1.1
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = ( longitud xs ) + 1 

-- 1.2
ultimo :: [t] -> t 
ultimo (x:xs) | longitud (x:xs) == 1 = x 
              | otherwise = ultimo xs

-- 1.3
principio :: [t] -> [t] 
principio (x:xs) | longitud (x:xs) == 1 = []
                 | otherwise = x : principio xs  

-- Esta función devuelve la misma lista de entrada pero sin el último elemento. Si la 
-- lista tiene un solo elemento, devuelve la lista vacía (porque saca el último elemento,
-- que es el único que tiene). Si tiene mas de un elemento, toma el primero y lo va
-- concatenando con el primer elemento de la lista que queda; cuando llega a un solo 
-- elemento en la original, mete todos en una lista vacía.

-- 1.4
reverso :: [t] -> [t] 
reverso [x] = [x] 
reverso (x:xs) = reverso xs ++ [x]   

-- Reverso de una lista de un solo elemento, es la misma lista de entrada.
-- Cuando la lista tiene mas de un elemento: Agarro la lista "tail" y la concateno con la
-- lista formada por el 1er elemento, así voy haciendo recursión. 


-- * Ejercicio 2

-- 2.1
pertenece :: ( Eq t ) => t -> [t] -> Bool 
pertenece n [] = False 
pertenece n (x:xs) = ( n == x ) || ( pertenece n xs )   

-- 2.2
comparaConsecutivos :: ( Eq t ) => [t] -> Bool 
comparaConsecutivos l = head ( l ) == head ( tail ( l ) ) 

-- Compara el primer elemento de la lista con el primer elemento de la lista resultante
-- de sacar ese primer elemento.

todosIguales :: ( Eq t ) => [t] -> Bool 
todosIguales l | longitud l == 1 = True   
               | comparaConsecutivos l == True = todosIguales ( tail ( l ) ) 
               | otherwise = False     

-- 2.3 
todosDistintos :: ( Eq t ) => [t] -> Bool
todosDistintos [] = True  
todosDistintos (x:xs) | longitud xs == 0 = True 
                      | pertenece x xs == False = todosDistintos xs 
                      | otherwise = False    

-- Agarro el primer elemento de la lista y verifico si "pertenece" a la lista resultante 
-- de sacar ese primer elemento. Si evalúa a False, quiere decir que ese elemento no está
-- repetido; vuelvo a llamar a la función pero con la lista resultante de sacar ese primer
-- elemento (el que ya verifiqué que no está repetido).
-- ¿Cuando paro? Cuando la lista sobre la que aplico "todosDistintos" no tiene elementos. 

-- 2.4 
hayRepetidos :: ( Eq t ) => [t] -> Bool 
hayRepetidos l = not ( todosDistintos l ) 

-- 2.5 
quitar :: ( Eq t ) => t -> [t] -> [t] 
quitar n (x:xs) | n == x = [] ++ xs 
                | n /= x = [x] ++ quitar n xs 

-- 2.6 
quitarTodos :: ( Eq t ) => t -> [t] -> [t]
quitarTodos n (x:xs) | ( longitud (x:xs) == 1 ) && ( n == x ) = [] 
                     | ( longitud (x:xs) == 1 ) && ( n /= x ) = (x:xs)     
                     | n == x = [] ++ quitarTodos n xs 
                     | n /= x = [x] ++ quitarTodos n xs 

-- Le paso un número "n" y una lista. Comparo a ese "n" con el primer elemento de la lista.
-- Si "n" no es igual al primer elemento (de la lista), concateno la lista [x] (lista nueva
-- que solo tiene el primer elemento) con la lista que va a salir de volver a ejecutar 
-- "quitarTodos" con "xs" como lista (la "tail" de la lista original). Si "n" es igual
-- al primer elemento, concateno la lista vacía [] (ya que quiero quitar ese primer elemento
-- que es igual a "n") con la lista que va a salir de volver a ejecutar "quitarTodos" con
-- "xs"
-- Tengo dos casos base. Independientemente de todo, siempre quiero parar la recursión 
-- cuando la lista llega a tener un solo elemento. Allí paro la recursión y comparo ese
-- único elemento (que queda) con "n". Si es igual a "n", devuelvo la lista vacía (porque
-- quiero sacar ese elemento); sino, devuelvo la lista como está (para no perder ese elemento
-- que tiene).  

-- 2.7
eliminarUnRepetido :: ( Eq t ) => [t] -> [t]  
eliminarUnRepetido [x] = [x] 
eliminarUnRepetido (x:xs) = x : ( quitarTodos x (x:xs) )

-- Recibe una lista, toma su primer elemento, lo elimina de todos lados (esté repetido o
-- no) y luego lo añade al principio de la lista. La idea es eliminar todos los repetidos
-- del primer elemento; pero si no está repetido, quiero que funcione igual. 
-- El caso en que la lista tenga un solo elemento, lo pongo aparte. 

eliminarRepetidos :: ( Eq t ) => [t] -> [t]  
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) | hayRepetidos (x:xs) == False = (x:xs)     
                         | otherwise = x : ( eliminarRepetidos ( tail ( eliminarUnRepetido (x:xs) ) ) ) 

-- Agarra el primer elemento de la lista de entrada, y lo añade (con la función
-- ":") a la lista resultado de: eliminar el primer elemento de la "tail" de la 
-- lista original. Basicamente la función agarra el primer elemento, lo elimina de
-- toda la lista (para eliminar repetidos en el camino) y luego lo vuelve a añadir 
-- (para que en la lista resultado esté una sola vez). No le importa si el elemento
-- está repetido o no, lo elimina de todos lados y luego lo vuelve a meter.
-- La recursión se va haciendo sobre la lista que queda tras sacar ese primer elemento
-- (la "tail" de la original).
-- Como caso base pongo a la lista vacía.
-- Antes de arrancar, le digo que verifique si en la lista "hayRepetidos"; ya que si 
-- no hay repetidos, no debe eliminar nada y quiero que me devuelva la lista como entro.

-- 2.8 
elementosIncluidosAux :: ( Eq t ) => [t] -> [t] -> Bool  
elementosIncluidosAux (x:xs) l | longitud (x:xs) == 1 = pertenece x l  
                               | pertenece x l = elementosIncluidosAux xs l  
                               | otherwise = False 

-- Esta función se fija si los elementos de la primer lista están incluídos
-- en la segunda lista. Agarra el primer elemento de "(x:xs)" y se fija si
-- pertenece a la segunda lista. Luego agarra la "tail (x:xs)" y vuelve a 
-- verificar. Cuando la lista (x:xs) tiene un solo elemento, detiene la
-- recursión y verifica que ese elemento esté o no en la segunda lista 
-- (para terminar).     

mismosElementos :: ( Eq t ) => [t] -> [t] -> Bool 
mismosElementos [] [] = False 
mismosElementos [] i = False 
mismosElementos l [] = False   
mismosElementos l i = ( elementosIncluidosAux l i ) && ( elementosIncluidosAux i l )

-- Verifica la todos los elementos de "l" estén en "i" y viceversa.
-- No le importa si se repiten los elementos, sólo que todos estén en ambas listas.
-- Las listas vacías no tienen elementos, por lo tanto NO tienen mismos elementos.
-- De igual forma, la lista vacía no comparte elementos con cualquier otra lista no
-- vacía. 
-- Para que funciones, pido una "doble inclusión": para ello llamo a la función 
-- "elementosIncluidosAux".
-- No le especifico el valor de verdad del "True", le digo que me devuelva el valor
-- de verdad de la conjunción (donde ambas fórmulas tienen valor de verdad por sí 
-- mismos).

-- 2.9 
capicua :: ( Eq t ) => [t] -> Bool 
capicua [] = False 
capicua l = l == reverso ( l ) 

-- La lista vacía no tiene elementos, por lo tanto no tiene sentido evaluar capicúa.
-- Si las lista "l" es igual a su reverso (llamo a la función "reverso"), entonces 
-- la lista es capicúa.


-- * Ejercicio 3

-- 3.1
sumatoria :: [ Integer ] -> Integer 
sumatoria [] = 0
sumatoria (x:xs) | longitud (x:xs) == 1 = x 
                 | otherwise = x + sumatoria xs 

-- Esta función suma los elementos (de cada una de las posiciones) entre sí.
-- La lista vacía no tiene elementos, la suma de "cero elementos" es 0.

-- 3.2
productoria :: [ Integer ] -> Integer 
productoria [] = 0 
productoria (x:xs) | longitud (x:xs) == 1 = x 
                   | otherwise = x * productoria xs  

-- Esta función hace el producto de los elementos (de cada una 
-- de las posiciones) entre sí.
-- La lista vacía no tiene elementos, el producto de "cero elementos" es 0.  

-- 3.3 
maximoAux :: [ Integer ] -> Integer -> Integer 
maximoAux (x:xs) n | ( longitud (x:xs) == 1 ) && ( n >= x ) = n  
                   | ( longitud (x:xs) == 1 ) && ( n < x ) = x 
                   | n >= x = maximoAux xs n 
                   | otherwise = maximoAux xs x  

-- Esta función auxiliar toma una lista y un número "n". Va a ir comparando a "n"
-- con cada posición de la lista. Compara de a dos, por eso toma "n" y el primer
-- elemento de la lista. Si "n > primer elemento de la lista", vuelve a comparar
-- entre "n" y xs (la "tail" de la lista). Si "n < primer elemento de la lista",
-- agarra como nuevo "n" a ese primer elemento y sigue comparando con xs.
-- ¿Cuando para la Recursión? Cuando xs tiene un solo elemento. Allí compara
-- directamente "n" con ese único elemento y resuelve. 
 
maximo :: [ Integer ] -> Integer 
maximo (x:xs) = maximoAux (x:xs) x 

-- Llama a "maximoAux" y le dice que arranque con "n = primer elemento de la lista".

maximo2 :: [ Integer ] -> Integer 
maximo2 [x] = x 
maximo2 (x:y:xs) | x >= y = maximo2 (x:xs) 
                 | otherwise = maximo2 (y:xs) 

-- Otra forma de contruir la función "maximo". 

-- 3.4 
sumarN :: Integer -> [ Integer ] -> [ Integer ]
sumarN n [] = [] 
sumarN n [x] = [x+n]  
sumarN n (x:xs) = [x+n] ++ sumarN n xs 

-- Toma un "n" y una lista, suma "n" a todos los elementos de la lista.
-- Suma "n" al primer elemento de la lista, crea una lista con esa suma y la 
-- concatena con el mismo procedimiento aplicado a la "tail" de la lista (xs).

-- 3.5 
sumarElPrimero :: [ Integer ] -> [ Integer ] 
sumarElPrimero (x:xs) = sumarN x (x:xs) 

-- 3.6
sumarElUltimo :: [ Integer ] -> [ Integer ]
sumarElUltimo l = sumarN ( ultimo l ) l  

-- 3.7 
esPar :: Integer -> Bool 
esPar n = mod n 2 == 0  

pares :: [ Integer ] -> [ Integer ] 
pares [] = [] 
pares (x:xs) | ( longitud (x:xs) == 1 ) && ( esPar x == True ) = [x] 
             | ( longitud (x:xs) == 1 ) && ( esPar x == False ) = [] 
             | esPar x == True = x : pares xs 
             | esPar x == False = pares xs 

-- Toma el primer elemento de la lista y verifica que sea par. Si evalua True,
-- añade ese elemento a la lista resultado de volver a aplicar la función "pares" 
-- a la "tail" (de la lista original). Si evalua False, no hace nada y pasa al 
-- siguiente evaluando "pares" a la "tail" (de la lista original).
-- ¿Cuando detiene la recursión? Cuando la lista tiene un solo elemento. Si es par,
-- devuelve una lista con ese elemento (esa lista es a la que se va añadir los "x"
-- pares que fue encontrando antes). Si no es par, devuelve una lista vacía 
-- (esa lista es a la que se va añadir los "x" pares que fue encontrando antes). 

-- 3.8 
esMultiplo :: Integer -> Integer -> Bool 
esMultiplo n m = mod n m == 0

-- Determina si "n" es multiplo de "m". 

multiplosDeN :: Integer -> [ Integer ] -> [ Integer ] 
multiplosDeN n [] = [] 
multiplosDeN n (x:xs) | ( longitud (x:xs) == 1 ) && ( esMultiplo x n ) = [x] 
                      | ( longitud (x:xs) == 1 ) && ( esMultiplo x n == False ) = [] 
                      | esMultiplo x n = x : multiplosDeN n xs 
                      | otherwise = multiplosDeN n xs  

-- Agarra el primer elemento de la lista y verifica que sea múltiplo de "n".
-- Si evalua True, añade ese elemento a la lista resultado de volver a 
-- aplicar la función "multiplosDeN" a la "tail" (de la lista original). 
-- Si evalua False, no hace nada y pasa al siguiente evaluando "multiplosDeN" 
-- a la "tail" (de la lista original).
-- ¿Cuando detiene la recursión? Cuando la lista tiene un solo elemento. Si es multiplo
-- de "n", devuelve una lista con ese elemento (esa lista es a la que se va añadir los "x"
-- multiplos que fue encontrando antes). Si no es multiplo de "n", devuelve una lista vacía 
-- (esa lista es a la que se va añadir los "x" multiplos que fue encontrando antes). 

-- ? El enunciado no dice nada sobre si la lista resultado debe tener los múltiplos 
-- ? sin repetirse, o en el orden en el que aparecen.

-- 3.9
ordenar :: [ Integer ] -> [ Integer ] 
ordenar [] = [] 
ordenar (x:xs) = ordenar ( quitar ( maximo (x:xs) ) (x:xs) ) ++ [ maximo (x:xs) ]  

-- ! ordenar (x:xs) = ( maximo (x:xs) ) : ordenar ( quitar ( maximo (x:xs) ) ( x:xs) ) 
-- La línea de código de arriba es otra solución, sólo que ordena al revés 
-- (de mayor a menor). Si quiero que quede de menor a mayor, debo armar otra función
-- que aplique "reverso" al resultado. 


-- * Ejercicio 4 

-- 4.a
sacarBlancosRepetidos :: [ Char ] -> [ Char ] 
sacarBlancosRepetidos [] = [] 
sacarBlancosRepetidos (x:xs) | ( x == ' ' ) && ( head xs == ' ' ) = x : ( quitar ' ' xs )   
                             | otherwise = x : sacarBlancosRepetidos xs 

-- Voy comparando el primer elemento de la lista ("x") con el primer elemento de la
-- lista resultante de quitar ese "x" (o sea "head xs"). Cuando ambos son un espacio 
-- en blanco (' '), quito el primer elemento de "xs" (sería el segundo ' ' 
-- consecutivo) y le añado al resultado el espacio atrapado en "x". 
-- Si no hay dos espacios consecutivos, añado el primer elemento ("x") a la lista
-- resultante de ir navegando con "sacarBlancosRepetidos" en "xs".

-- 4.b 
contarPalabras :: [ Char ] -> Integer 
contarPalabras [] = 0
contarPalabras (x:xs) | longitud (x:xs) == 1 = 1 
                      | x == ' ' = 1 + contarPalabras xs  
                      |otherwise = contarPalabras xs 

-- Va recorriendo la lista recursivamente. Cada vez que se encuentra un espacio
-- (o sea ' '), suma 1 y sigue recorriendo.
-- Como caso base pido que cuando la longitud de la lista (que cae de la recursión) 
-- sea 1, sume 1; para que me cuente la ultima
-- ! En la especificación debo pedir que el primer elemento (de la lista) no sea 
-- ! un espacio (' '). Sino, cuenta 1 de más.
-- ! Si quiero abarcar el caso cuando la lista empieza con un espacio (' '), debo
-- ! usar la siguiente función auxiliar:

quitarEspacioInicio :: [ Char ] -> [ Char ] 
quitarEspacioInicio [] = []
quitarEspacioInicio (x:xs) | x == ' ' = xs 
                           | otherwise = (x:xs)  

-- ! Pero no sé cómo hacer compatible mi forma de contar (con los espacios) si 
-- ! cada vez que la recursión pone un espacio adelante, lo saca.

-- 4.c
primeraPalabraAux :: [ Char ] -> [ Char ] 
primeraPalabraAux [] = [] 
primeraPalabraAux (x:xs) | contarPalabras (x:xs) == 1 = (x:xs) 
                         | x /= ' ' = [x] ++ primeraPalabraAux xs 
                         | otherwise = []  

-- Esta función te devuelve la primera palabra. 
-- ! Se rompre cuando la lista empieza con un espacio (' ').
-- ! Lo soluciono en la siguiente función.

primeraPalabra :: [ Char ] -> [ Char ] 
primeraPalabra (x:xs) = primeraPalabraAux ( quitarEspacioInicio (x:xs) ) 

-- Ahora sí, esta función devuelve la primera palabra sin importar que
-- la lista de entrada inicie con espacio o no.

palabrasAux :: [ Char ] -> [ Char ] -> [ [ Char ] ] 
palabrasAux [] l = [ primeraPalabra l ] 
palabrasAux (x:xs) l | x == ' ' = primeraPalabra l : palabrasAux xs xs  
                     | otherwise = palabrasAux xs l 

-- Agarra dos listas (lista A y lista B). Empieza a recorrer la lista A. 
-- Cuando se encuentra un espacio (' '), agarra la primera palabra de la
-- Lista B y la añade a la lista resultante de volver a ejecutar 
-- "palabrasAux" con el "tail" de lo que queda en la lista A como ambas
-- listas de entrada. Cuando la lista A se queda sin elementos, agarro
-- la primera palabra de la lista B (que en realidad es la única que le
-- queda) y la mete en una lista nueva (formando una lista de listas).
-- Finalmente, empieza a añadir a esta nueva lista de listas todas las
-- palabras que fue sacando (y guardando para después) en el camino.
-- Volver a llamar a la función con las mismas listas de entrada es una
-- forma de "quitar" esa primer palabra que "guardé para después".

palabras :: [ Char ] -> [ [ Char] ] 
palabras l = palabrasAux l l 

-- Llama a la función "palabrasAux" con la misma lista en ambas entradas. La idea es que
-- la primera sea la que voy recorriendo, mientras que la segunda no pierda nada. De esa
-- forma, cuando llego a un espacio (' ') en la primera, puedo "recuperar" esa palabra
-- (que fui borrando al ir sacando sus caracteres) de la segunda lista (que está intacta).

-- ! La función colapsa cuando la lista "l" empieza o termina con espacio (' ').
-- ! La consigna no tiene especificación clara, por lo tanto espero que esos casos no
-- ! esten permitidos.

-- 4.d 
