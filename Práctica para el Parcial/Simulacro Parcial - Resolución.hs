-- Simulacro de Parcial - Clase Práctica 24/04

-- * Ejercicio 1

pertenece :: (Eq t) => t -> [t] -> Bool 
pertenece _ [] = False 
pertenece n (x:xs) | n == x = True
                   | otherwise = pertenece n xs 

inverso :: (a,b) -> (b,a)
inverso (a,b) = (b,a) 

relacionesValidas :: [(String,String)] -> Bool
relacionesValidas [] = True 
relacionesValidas (x:xs) | pertenece x xs == True = False 
                         | pertenece (inverso x) xs == True = False 
                         | pertenece ((fst x, fst x)) (x:xs) = False 
                         | otherwise = relacionesValidas xs 

-- Agarro el 1er elemento de la lista y me fijo que no esté en la "tail".
-- También agarro el "inverso" del primer elemento y me fijo que no esté en la "tail".
-- Por último, agarro una tupla que tenga dos elementos iguales y me fijo que no esté en
-- la "tail".
-- Si ninguna de esas está, quiere decir que no está repetida (tuplas de la pinta que
-- consideramos "repetidos" en el problema). Hago recursión hasta llegar a la lista vacía.
-- Si no encontró repetidos hasta la lista vacía, devuelvo True. 


-- * Ejercicio 2

{- quitarTodos :: (Eq t) => t -> [t] -> [t] 
quitarTodos _ [] = [] 
quitarTodos n (x:xs) | n == x = quitarTodos n xs 
                     | n /= x = x : quitarTodos n xs -}

-- Esta función no la utilicé, pero la dejo por si llego a necesitarla.

eliminarRepetidos :: (Eq t) => [t] -> [t] 
eliminarRepetidos [] = [] 
eliminarRepetidos (x:xs) | pertenece x xs == False = x : eliminarRepetidos xs 
                         | pertenece x xs == True = eliminarRepetidos xs 

elementos :: [(String,String)] -> [String] 
elementos [] = []
elementos (x:xs) = (fst x) : (snd x) : elementos xs 

-- Esta función agarra los elementos de cada dupla (de la lista de duplas) y los mete en 
-- una lista nueva (como elemento de la lista). 

personas :: [(String, String)] -> [String]
personas [] = []
personas l = eliminarRepetidos (elementos l) 


-- * Ejercicio 3

amigosDe :: String -> [(String, String)] -> [String]
amigosDe _ [] = [] 
amigosDe p (x:xs) | (p == fst x) = (snd x) : amigosDe p xs 
                  | (p == snd x) = (fst x) : amigosDe p xs 
                  | otherwise = amigosDe p xs 

-- Agarro la primer tupla de la lista y miro si "p" es alguno de sus elementos.
-- Si "p" es elemento de la tupla, agarro el otro elemento (de la tupla), lo 
-- meto en una lista y paso a la siguiente tupla.
-- Si "p" no es elemento de la tupla, no hago nada y paso a la siguiente tupla.
-- cuando la recursión llega a la lista vacía, devuelvo la lista vacía (en esa lista
-- se van a ir metiendo los elementos que fui separando).


-- * Ejercicio 4

contarApariciones :: String -> [(String,String)] -> Integer 
contarApariciones _ [] = 0 
contarApariciones p (x:xs) | (p == fst x) || (p == snd x) = 1 + contarApariciones p xs 
                           | otherwise = contarApariciones p xs 

-- Cuenta la cantidad de tuplas que tienen a "p" como uno de sus elementos.

aparicionesPorPersonaAux :: String -> [(String,String)] -> (String,Integer) 
aparicionesPorPersonaAux p l = ( p , contarApariciones p l )   

-- Devuelve una tupla, donde el primer elemento es "p" y el segundo (elemento)
-- es la cantidad de tuplas que tienen a "p" como uno de sus elementos; dentro
-- de una lista de tuplas. 

aparicionesPorPersonaAux2 :: [String] -> [(String,String)] -> [(String,Integer)]  
aparicionesPorPersonaAux2 [] _ = [] 
aparicionesPorPersonaAux2 (x:xs) l = (aparicionesPorPersonaAux x l) : (aparicionesPorPersonaAux2 xs l)      

-- Llama a la función "aparicionesPorPersonaAux" y le dice que haga recursión sobre la primer lista
-- (que en la próxima función le voy a decir que esa lista sea "personas"). 

aparicionesPorPersona :: [(String,String)] -> [(String,Integer)] 
aparicionesPorPersona l = aparicionesPorPersonaAux2 (personas l) l  

-- Llama a la función "aparicionesPorPersonaAux2" y le dice que la primer lista sea el resultado
-- de aplicar "personas" a la lista de entrada "relaciones".

maximoDeTuplas :: [(String,Integer)] -> (String,Integer)
maximoDeTuplas (x:y:xs) | (xs == []) && ((snd x) >= (snd y)) = x 
                        | (xs == []) && ((snd x) < (snd y)) = y 
                        | (snd x) >= (snd y) = maximoDeTuplas (x:xs) 
                        | otherwise = maximoDeTuplas (y:xs) 

-- En el contexto de mi desarrollo, esta función compara dos tuplas y te devuelve
-- aquella en la que está la persona con mayor apariciones (respecto la otra).
-- Va a ir comparando las tuplas de la lista que sale de "aparicionesPorPersona",
-- y te devuelve la tupla de la persona con mas apariciones.

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos l = fst (maximoDeTuplas (aparicionesPorPersona l))   

-- Te devuelve el primer elemento (o sea, la persona) de la tupla que más apariciones
-- tiene. Para eso, pide el resultado de "maximoDeTuplas" y te da su primer elemento.

