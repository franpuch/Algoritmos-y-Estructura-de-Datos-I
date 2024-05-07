-- Primer Parcial - Haskell
-- 1er Cuatrimestre 2024 - Tema B 


-- Ejercicio 1. 

cantidadMateriasAprobadas :: [Int] -> Int 
cantidadMateriasAprobadas [] = 0 
cantidadMateriasAprobadas (x:xs) | x >= 4 = 1 + (cantidadMateriasAprobadas xs) 
                                 | otherwise = cantidadMateriasAprobadas xs    

-- Le pasas la 2da componente de [registro] (que es [notas del alumno]) y te devuelve
-- la cantidad de notas aprobadas (que son mayores/iguales a 4).

aproboMasDeNMaterias :: [([Char],[Int])] -> [Char] -> Int -> Bool 
aproboMasDeNMaterias [] _ _ = False 
aproboMasDeNMaterias (x:xs) alumno n | alumno /= (fst x) = aproboMasDeNMaterias xs alumno n 
                                     | (alumno == (fst x)) && ((cantidadMateriasAprobadas (snd x)) > n) = True 
                                     | otherwise = False  

-- No estoy seguro de si [registro] vacío puede ser un caso a resolver, por las dudas
-- me atajo y lo contemplo.
-- Agarro [alumno] y me fijo que sea igual a la 1ra componente del 1er elemento de 
-- [registro]. Si es distinto, paso a la siguiente tupla y vuelvo a verificar.
-- Si es igual, pido que "cantidadMateriasAprobadas" sea mayor que "n". Si se cumplen
-- ambas, devuelvo True; sino, devuelvo "False". 


-- Ejercicio 2. 

cantidadDeNotas :: [Int] -> Int 
cantidadDeNotas [] = 0 
cantidadDeNotas (x:xs) = 1 + (cantidadDeNotas xs) 

-- Le pasas [notas] y te devuelve la cantidad de elementos (notas) que hay.

sumarTotalNotas :: [Int] -> Int 
sumarTotalNotas [] = 0 
sumarTotalNotas (x:xs) = x + (sumarTotalNotas xs) 

-- Le pasas [notas] y te devuelve la suma de sus elementos (entre sí). 

promedioNotas :: [Int] -> Float 
promedioNotas notas = (fromIntegral (sumarTotalNotas (notas))) / (fromIntegral (cantidadDeNotas (notas)))  

-- Calcula el promedio de los elementos de [notas].

noTieneAplazos :: [Int] -> Bool 
noTieneAplazos [] = True 
noTieneAplazos (x:xs) | x < 4 = False 
                      | otherwise = noTieneAplazos xs 

-- Le pasas [notas] y te dice si esa lista de notas tiene (o no) aplazos
-- (notas menores que 4).

alumnosSinAplazos :: [([Char],[Int])] -> [[Char]] 
alumnosSinAplazos [] = [] 
alumnosSinAplazos ((a,n):xs) | noTieneAplazos n == True = a : alumnosSinAplazos xs 
                             | otherwise = alumnosSinAplazos xs 

-- Le pasas [registro] y va, alumno por alumno, verificando cuál tiene aplazos y cuál no.
-- Los que no tienen aplazos, los mete en una lista. Al final devuelve esa lista con
-- los alumnos que no tienen aplazos.

buenosAlumnos :: [([Char],[Int])] -> [[Char]] 
buenosAlumnos [] = [] 
buenosAlumnos ((alumno,notas):xs) | (noTieneAplazos (notas) == True) && ((promedioNotas (notas)) >= 8) = (alumno) : (buenosAlumnos xs) 
                                  | otherwise = buenosAlumnos xs 


-- Ejercicio 3. 

mejorPromedio :: [([Char],[Int])] -> [Char] 
mejorPromedio [(alumno,notas)] = alumno 
mejorPromedio ((a1,n1):(a2,n2):xs) | (promedioNotas n1) >= (promedioNotas n2) = mejorPromedio ((a1,n1):xs) 
                                   | otherwise = mejorPromedio ((a2,n2):xs)  


-- Ejercicio 4.

pertenece :: (Eq t) => t -> [t] -> Bool 
pertenece _ [] = False 
pertenece a (x:xs) | a == x = True 
                   | otherwise = pertenece a xs 

promedioNotas2 :: [([Char],[Int])] -> [Char] -> Float 
promedioNotas2 [(a,n)] _ = promedioNotas n    
promedioNotas2 ((a,n):xs) alumno | a == alumno = promedioNotas n 
                                 | otherwise = promedioNotas2 xs alumno    

-- Le pasas [registro] y algún "alumno". Va a buscar a "alumno" en [registro] y le va a 
-- calcular el "promedio" a sus notas.             

seGraduoConHonores :: [([Char],[Int])] -> Int -> [Char] -> Bool
seGraduoConHonores r c a | ((aproboMasDeNMaterias r a (c - 1)) == True) && ((pertenece a (buenosAlumnos (r))) == True) && (((promedioNotas2 (r) (mejorPromedio (r))) - (promedioNotas2 (r) (a))) < 1) = True  
                         | otherwise = False 

-- Esta función verifica que "a" (alumno) cumpla todas las condiciones (que pide la
-- especificación) simultaneamente.


-- Ejercicio 5.

-- Encontrar fallas en un programa.

