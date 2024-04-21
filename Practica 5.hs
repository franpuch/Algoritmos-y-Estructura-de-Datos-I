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
pertenece n [x] = n == x 
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
todosDistintos (x:xs) | longitud xs == 1 = True 
                      | pertenece x xs == False = todosDistintos xs 
                      | otherwise = False    

-- Agarro el primer elemento de la lista y verifico si "pertenece" a la lista resultante 
-- de sacar ese primer elemento. Si evalúa a False, quiere decir que ese elemento no está
-- repetido; vuelvo a llamar a la función pero con la lista resultante de sacar ese primer
-- elemento (el que ya verifiqué que no está repetido).
-- ¿Cuando paro? Cuando la lista sobre la que aplico "todosDistintos" tiene un solo
-- elemento. Como ya verifiqué todos los anteriores, sé que no está repetido.

-- 2.4 
hayRepetidos :: ( Eq t ) => [t] -> Bool 
hayRepetidos l = not ( todosDistintos l ) 

-- 2.5 
-- TODO: Quise hacer "quita" y me salió "quitaTodos". Así que me falta "quitar".  

-- 2.6 
quitarTodos :: ( Eq t ) => t -> [t] -> [t]
quitarTodos n (x:xs) | longitud (x:xs) == 1 = (x:xs)    
                | n == x = [] ++ quitarTodos n xs 
                | n /= x = [x] ++ quitarTodos n xs   