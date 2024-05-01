-- Primer Parcial - Haskell
-- 2do Cuatrimestre 2023 - Tema C


-- Ejercicio 1.
totalGolesATitulares :: [Int] -> Int 
totalGolesATitulares [] = 0 
totalGolesATitulares (x:xs) = x + totalGolesATitulares xs   

-- Recibe la lista "goles" (eso lo determino mas adelate) y suma todos sus elementos entre
-- sí, dandote el total de goles recibidos por arqueros titulares.

atajaronSuplentes :: [(String,String)] -> [Int] -> Int -> Int 
atajaronSuplentes e g t = t - (totalGolesATitulares g) 

-- Como [goles] (o sea "t") tiene los goles recibidos por arqueros titulares, calculo la 
-- cantidad total de goles recibidos por arqueros titulares (utilizando 
-- "totalGolesATitulares") y eso le resto a "t" (que es la cantidad total de goles del 
-- torneo). De la diferencia, obtengo los goles recibidos por arqueros suplentes.


-- Ejercicio2.
pertenece :: (Eq t) => t -> [t] -> Bool 
pertenece _ [] = False 
pertenece t (x:xs) | t == x = True 
                   | otherwise = pertenece t xs  

-- Responde si el elemento "t" está en la lista o no.

aplanar :: [(t,t)] -> [t] 
aplanar [] = [] 
aplanar (x:xs) = [fst x] ++ [snd x] ++ aplanar xs

-- Agarra una lista de tuplas, y arma una nueva lista donde mete todos las componentes
-- de cada tupla. Devuelve una lista de elementos de las tuplas.

tuplasValidas :: (Eq t) => [t] -> Bool
tuplasValidas [] = True  
tuplasValidas (x:xs) | pertenece x xs == True = False 
                     | otherwise = tuplasValidas xs 

-- Toma una lista (que en la próxima función le voy a decir que sea la lista que sale 
-- de "aplanar (arquerosPorEquipo)") y se fija que cada elemento no esté repetido. 

equiposValidos :: [(String,String)] -> Bool
equiposValidos e = tuplasValidas (aplanar e) 

-- Revisa que todas las componentes de cada tupla tengan única aparicion en toda la lista
-- y todas las tuplas.


-- Ejercicio 3. 
division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b

golesAEsteArquero :: String -> [(String,String)] -> [Int] -> Int 
golesAEsteArquero a (x:xs) (y:ys) | a == snd x = y 
                                  | otherwise = golesAEsteArquero a xs ys 

-- Agarra la primer tupla de (x:xs) y se fija sin "a" es el arquero (2da componente) 
-- de esa tupla. Si evalúa True, agarra el primer elemento de (y:ys), es decir, la 
-- cantidad de goles recibidos por ese arquero. Si evalúa no, vuelve a proceder con
-- el primer elemento de "xs" y "ys"; de alguna forma "saca" los primeros elementos de 
-- ambas listas (saca a ese equipo/arquero y su respectiva cantidad de goles). 
-- No hace falta caso base ya que la especificación me garantiza que "a" si o si es un 
-- arquero de algún equipo. Siempre voy a encontrar a "a" en las tuplas de (x:xs). 

porcentajeDeGoles :: String -> [(String,String)] -> [Int] -> Float 
porcentajeDeGoles a e g = division ((golesAEsteArquero a e g) * 100) (totalGolesATitulares g) 


-- Ejercicio 4.
arqueros :: [(String,String)] -> [String] 
arqueros [] = [] 
arqueros (x:xs) = (snd x) : arqueros xs  

-- Recibe [arquerosPorEquipo] y te devuelve una lista con todos los arqueros, en el orden 
-- en el que aparecen en [arquerosPorEquipo].

arqueroConMenosGoles :: [String] -> [(String,String)] -> [Int] -> String 
arqueroConMenosGoles [x] _ _ = x 
arqueroConMenosGoles (x:xs) a g | (golesAEsteArquero x a g) < (golesAEsteArquero (arqueroConMenosGoles xs a g) a g) = x 
                                | otherwise = arqueroConMenosGoles xs a g 

-- Toma una lista (que después va a ser [arqueros]), le calcula el número de 
-- goles a su primer elemento y lo compara con el siguiente recursivamente.
-- Los parámetros "a" y "g" son [arquerosPorEquipo] y [goles] (respectivamente). Le cargo 
-- esos parámetros ya que los necesita para que "golesAEsteArquero" arranque.  

vallaMenosVencida :: [(String,String)] -> [Int] -> String 
vallaMenosVencida a g = arqueroConMenosGoles (arqueros a) a g 

-- No me preocupo de la lista vacía ya que la especificación me dice que [goles] siempre
-- tiene elementos (nunca es la lista vacía). Y si [goles] tiene elementos, 
-- [arquerosPorEquipo] también tiene elementos (también es una condicion dada por la 
-- especificación). 

-- * Fin del Primer Parcial.