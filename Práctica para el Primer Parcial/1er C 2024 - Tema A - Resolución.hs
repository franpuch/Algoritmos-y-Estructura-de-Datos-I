-- Primer Parcial - Haskell
-- 1er Cuatrimestre 2024 - Tema A 


-- Ejercicio 1.

hayQueCodificar :: Char -> [(Char,Char)] -> Bool 
hayQueCodificar _ [] = False 
hayQueCodificar c (x:xs) | c == fst (x) = True 
                         | otherwise = hayQueCodificar c xs  

-- Toma la 1er tupla de [mapeo] y verifica que su 1er elemento sea igual
-- a el caracter "c". Si es igual, devuelve True. Si no es igual, pasa
-- a la siguiente tupla y vuelve a verificar. Si [mapeo] se queda sin 
-- elementos, quiere decir que "c" no es 1er elemento de ninguna tupla.


-- Ejercicio 2.

aparicionesEnFrase :: Char -> [Char] -> Int 
aparicionesEnFrase _ [] = 0
aparicionesEnFrase c (x:xs) | c == x = 1 + aparicionesEnFrase c xs 
                            | otherwise = aparicionesEnFrase c xs

-- Devuelve cuántas veces aparece el caracter "c" en [frase]. 

cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Int
cuantasVecesHayQueCodificar c frase mapeo | hayQueCodificar c mapeo == False = 0
                                          | otherwise = aparicionesEnFrase c frase 

-- Por especificación, "c" siempre está en [frase].
-- Primero reviso que "hayQueCodificar" sea True. Si es así, cuento cuántas
-- veces aparece "c" en [frase]. Si es False, devuelvo 0 pues no puedo
-- codificar "c".


-- Ejercicio 3. 

laQueMasHayQueCodificar :: [Char] -> [(Char,Char)] -> Char 
laQueMasHayQueCodificar [x] _ = x 
laQueMasHayQueCodificar (x:xs) mapeo | (cuantasVecesHayQueCodificar x (x:xs) mapeo) >= (cuantasVecesHayQueCodificar (laQueMasHayQueCodificar xs mapeo) (x:xs) mapeo) = x 
                                     | otherwise = laQueMasHayQueCodificar xs mapeo 

-- Para [frase] de un solo elemento, el caracter que más hay que codificar
-- es ese único elemento. Recuerdo que por especificación, ese único elemento
-- debe (también) estar en [mapeo].
-- Para [frase] con más de un elemento. Cuento "cuantasVecesHayQueCodificar" 
-- el primer caracter de [frase] y lo comparo con el caracter que más hay 
-- que codificar en "xs". Digamos que la función "magicamente" sabe cuál es
-- el caracter que más hay que codificar en "xs". En realidad, ese "saber 
-- magicamente" es el resultado de ir comparando recursivamente dentro de "xs".


-- Ejercicio 4.

encontrarTupla :: Char -> [(Char,Char)] -> (Char,Char) 
encontrarTupla c (x:xs) | c == fst (x) = x 
                        | otherwise = encontrarTupla c xs 

-- Busca y devuelve la tupla en la que está "c" como primera componente.
-- En la especificación pondría como "requiere" que "c" sea necesariamente
-- la primer componente de alguna tupla de [mapeo] (para lo que la voy a 
-- usar, será suficiente). 

codificarFrase :: [Char] -> [(Char,Char)] -> [Char] 
codificarFrase [] _ = [] 
codificarFrase (x:xs) mapeo | hayQueCodificar x mapeo = (snd (encontrarTupla x mapeo)) : (codificarFrase xs mapeo) 
                            | otherwise = x : codificarFrase xs mapeo 

-- Toma el primer caracter de [frase]; si hay que codificarlo, busca el par,
-- toma la 2da componente y la sustituye añadiendola a la lista que resulta
-- de ir recorriendo recursivamente [frase]. Si no hay que codificarla, no
-- sustituye por nada, añade ese mismo caracter a la lista que resulta de seguir
-- recorriendo recursivamente a [frase].
-- Cuando [frase] se queda sin elementos, devuelve la lista vacía y allí va
-- metiendo todos los caracteres que fue dejando en el camino.

