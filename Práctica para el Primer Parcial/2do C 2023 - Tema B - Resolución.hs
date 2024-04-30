-- Primer Parcial - Haskell
-- 2do Cuatrimestre 2023 - Tema B


-- Ejercicio 1.
sumaTotalDeVotos :: [Int] -> Int 
sumaTotalDeVotos [] = 0 
sumaTotalDeVotos (x:xs) = x + sumaTotalDeVotos xs 

-- Esta función suma (entre sí) todos los elementos de una lista.

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

porcentajeDeVotosAfirmativos :: [(String, String)] -> [Int] -> Int -> Float
porcentajeDeVotosAfirmativo _ _ 0 = 0
porcentajeDeVotosAfirmativos _ l v = division ((sumaTotalDeVotos l) * 100) v 


-- Ejercicio 2.
pertenece :: (Eq t) => [t] -> t -> Bool 
pertenece [] _ = False 
pertenece (x:xs) n | ( n == x ) = True
                   | otherwise = pertenece xs n      

aplanar :: [(String,String)] -> [String] 
aplanar [] = [] 
aplanar (x:xs) = (fst x) : (snd x) : aplanar xs

-- Recibe una lista de tuplas de Strings, y devuelve una lista con cada uno de los elementos 
-- (de las tuplas) como elementos de la lista.

unicaAparicionCandidatos :: [String] -> Bool 
unicaAparicionCandidatos [] = True 
unicaAparicionCandidatos (x:xs) | pertenece xs x = False 
                                | otherwise = unicaAparicionCandidatos xs   

-- Esta función recibe la lista resultado de "aplanar" y revisa que cada candidato aparezca 
-- una sola vez (es decir, no esté repetido; es decir, no se postule para presidente y vice 
-- a la vez ni se postule en dos fórmulas distintas).

formulasInvalidas :: [(String, String)] -> Bool 
formulasInvalidas [] = False 
formulasInvalidas l = not (unicaAparicionCandidatos (aplanar l))       


-- Ejercicio 3.
votosDeLaFormula :: String -> [(String,String)] -> [Int] -> Int 
votosDeLaFormula v (x:xs) (y:ys) | (v == snd x) = y 
                                 | otherwise = votosDeLaFormula v xs ys 

-- Busca a "v" en la segunda componente de la primera tupla de [formulas]. Si lo encuentra,
-- devuelve el primer elemento de [votos] (cantidad de votos de esa fórmula). Si no lo 
-- encuentra, vuelve a buscar en la "xs" de [formulas]. Como "elimino" a esa primer fórmula
-- (de la lista [formulas]), también elimino sus votos de [votos]; por eso le paso el "ys" de
-- [votos] también.
-- v -> candidato a vice-presidente.
-- (x:xs) -> [formulas]
-- (y:ys) -> [votos]

porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos vice formulas votos = division ((votosDeLaFormula vice formulas votos) * 100) (sumaTotalDeVotos (votos)) 


-- Ejercicio 4.
votosDeLaFormula2 :: String -> [(String,String)] -> [Int] -> Int 
votosDeLaFormula2 p (x:xs) (y:ys) | (p == fst x) = y 
                                  | otherwise = votosDeLaFormula2 p xs ys

-- Esta función hace lo mismo que "votosDeLaFormula", pero busca los votos de la fórmula
-- utilizando a candidato a presidente.

candidatosAPresidente :: [(String,String)] -> [String] 
candidatosAPresidente [] = [] 
candidatosAPresidente (x:xs) = (fst x) : candidatosAPresidente xs 

-- Devuelve una lista con los candidatos a Presidente.

menosVotadoAux :: [String] -> [(String,String)] -> [Int] -> String 
menosVotadoAux [x] _ _ = x  
menosVotadoAux (p:ps) f v | (votosDeLaFormula2 p f v) < (votosDeLaFormula2 (menosVotadoAux ps f v) f v) = p   
                          | otherwise = menosVotadoAux ps f v 

-- Hace las comparaciones y la recursión.
-- Toma una lista (que después va a ser la lista de candidatos a presidente), le calcula los
-- votos a su primer elemento y lo compara con el siguiente recursivamente.
-- Los parámetros "p" y "v" son [formulas] y [votos] (respectivamente). Le cargo esos parámetros 
-- ya que los necesita para que "votosDeLaFormula2" arranque.      

menosVotado :: [(String, String)] -> [Int] -> String
menosVotado f v = menosVotadoAux (candidatosAPresidente f) f v  

-- * Fin del Primer Parcial 