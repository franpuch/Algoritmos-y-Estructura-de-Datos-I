-- Primer Parcial - Haskell
-- 2do Cuatrimestre 2023 - Tema A


-- Ejercicio 1.
sumaTotalVotos :: [Int] -> Int 
sumaTotalVotos [] = 0 
sumaTotalVotos (x:xs) = x + sumaTotalVotos xs 

-- Total los elementos de una listas y los suma entre sí. Si le paso [votos],
-- me va a devolver la cantidad total de votos afirmativos (que corresponden 
-- a alguna fórmula presidencial).

votosEnBlanco :: [(String,String)] -> [Int] -> Int -> Int 
votosEnBlanco [] _ cantTotalVotos = cantTotalVotos 
votosEnBlanco _ [] cantTotalVotos = cantTotalVotos  
votosEnBlanco formulas votos cantTotalVotos = cantTotalVotos - (sumaTotalVotos (votos))  

-- La lista vacía es una lista de formulasValidas, por lo tanto tengo que atajar ese caso.
-- Al mismo tiempo estoy atajando el caso de lista de votos vacía, ya que por especificación
-- [formulas] y [votos] tienen la misma longitud.
-- Es raro que exista una elección sin candidatos, pero bueno... si no hay candidato, todos
-- los votos son votos blancos. 


-- Ejercicio 2.
pertenece :: (Eq t) => t -> [t] -> Bool 
pertenece _ [] = False 
pertenece t (x:xs) | (t == x) = True 
                   | otherwise = pertenece t xs 

aplanar :: [(String,String)] -> [String] 
aplanar [] = [] 
aplanar((t1,t2):xs) = t1 : t2 : (aplanar xs) 

-- Toma una lista de tuplas y devuelve una lista con todos los elementos de cada tupla.

noHayRepetidos :: (Eq t) => [t] -> Bool 
noHayRepetidos [] = True 
noHayRepetidos (x:xs) | pertenece x xs == True = False 
                      | otherwise = noHayRepetidos xs

-- Toma una lista y se fija que no tenga elementos repetidos. 

formulasValidas :: [(String,String)] -> Bool 
formulasValidas [] = True 
formulasValidas formulas = noHayRepetidos (aplanar (formulas)) 


-- Ejercicio 3. 
posicionDelElemento :: (Eq t) => t -> [t] -> Int 
posicionDelElemento t (x:xs) | t == x = 0
                             | otherwise = 1 + (posicionDelElemento t xs)  

-- La primera posición de una lista es la "posición 0".
-- En la especificación de "posicionDelElemento" pido:
--                          ~ t pertenece a la (x:xs)
--                          ~ si "t" aparece en las de una pisición, devuelvo la primera.
-- Como después le voy a pasar una lista que no tiene repetidos, me alcanza con cómo labura
-- esta función.

iesimaPosicionAux :: Int -> Int -> [t] -> t     
iesimaPosicionAux posicion contador (x:xs) | posicion == contador = x 
                                           | otherwise = iesimaPosicionAux posicion (contador + 1) xs   

iesimaPosicion :: Int -> [t] -> t 
iesimaPosicion posicion lista = iesimaPosicionAux posicion 0 lista

-- En la especificación pido que la lista no sea la lista vacía, y que posicion <= |lista|.

candidatosPresidente :: [(String,String)] -> [String] 
candidatosPresidente [] = [] 
candidatosPresidente ((p,v):xs) = p : candidatosPresidente xs 

-- Dada la lista de formulas, te devuelve la lista con los candidato a presidente.

votosDeCandidato :: String -> [(String,String)] -> [Int] -> Int 
votosDeCandidato presidente formulas votos = iesimaPosicion (posicionDelElemento (presidente) (candidatosPresidente (formulas))) votos  

-- La posición de la fórmula da el mismo valor que la posición del candidato (a 
-- presidente) en [presidentes]. La función devuelve la posición de [votos] 
-- que le corresponde a la fórmula de "presidente" en [formulas].

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

porcentajeDeVotos :: String -> [(String,String)] -> [Int] -> Float 
porcentajeDeVotos presidente formulas votos = ((votosDeCandidato presidente formulas votos) * 100) `division` (sumaTotalVotos (votos)) 


-- Ejercicio 4.
