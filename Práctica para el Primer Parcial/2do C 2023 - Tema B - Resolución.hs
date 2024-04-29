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

--formulasInvalidas :: [(String, String)] -> Bool 
--formulasInvalidas _ = True     

-- Ejercicio 3.
--porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
--porcentajeDeVotos _ _ _ = 0.0

-- Ejercicio 4.
--menosVotado :: [(String, String)] -> [Int] -> String
--menosVotado _ _ = " "
