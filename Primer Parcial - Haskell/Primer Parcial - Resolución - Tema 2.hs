module SolucionT2 where


-------------------------------------- Ejercicio 1 --------------------------------------

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False 
pertenece t (x:xs) | t == x = True
                   | otherwise = pertenece t xs  

-- Función auxiliar. Te dice si el elemento "t" está en la lista.

productosSinRepetidos :: [[Char]] -> [[Char]] 
productosSinRepetidos [] = [] 
productosSinRepetidos (x:xs) | pertenece x xs == True = productosSinRepetidos xs 
                             | otherwise = x : productosSinRepetidos xs 

-- Esta función recibe [productos] y te devuelve una lista con todos
-- los productos sin repetir.

contarProducto :: [Char] -> [[Char]] -> Int 
contarProducto _ [] = 0 
contarProducto p (x:xs) | p == x = 1 + contarProducto p xs 
                        | otherwise = contarProducto p xs 

-- Esta función recibe un "producto" y la lista [productos]. 
-- Cuenta cuántas veces aparece "producto" en la lista [productos].

crearPar :: [[Char]] -> [[Char]] -> [([Char],Int)] 
crearPar [] _ = [] 
crearPar (x:xs) productos = (x,contarProducto x productos) : (crearPar xs productos) 

-- Esta función recibe [productosSinRepetir] y [productos].
-- Devuelve una lista de tuplas donde la 1ra componente es un producto
-- (el primer elemento de [productosSinRepetir]) y la 2da componente es
-- la cantidad de veces que ese producto aparece en [productos].
-- Es una generalización de "generarStock", esta última función es un caso
-- particular de la actual.

generarStock :: [[Char]] -> [([Char],Int)]
generarStock productos = crearPar (productosSinRepetidos (productos)) (productos) 

-- Llamo a la función "crearPar" y le paso como parámetros [productosSinRepetir] y 
-- [productos]. La especificación no me dice que el orden en el que aparecen los 
-- productos (con su correspondiente cantidad) debe ser el mismo en el que aparecen 
-- en [productos], así que pueden aparecen en orden distinto.


-------------------------------------- Ejercicio 2 --------------------------------------

stockDeProducto :: [([Char],Int)] -> [Char] -> Int
stockDeProducto [] _ = 0 
stockDeProducto (x:xs) producto | producto == fst x = snd x 
                                | otherwise = stockDeProducto xs producto 

-- Compara si la 1ra componente de la 1ra tupla de [stock] es igual a "producto".
-- Si evalúa True, devuelve la 2da componente de esa tupla (que es la cantidad de 
-- productos que hay). Si evalúa False, hace recursión y verifica con la primer 
-- tupla de "xs".
-- Si [stock] llega a la lista vacía (no encontró a "producto" entre las 1ras componentes
-- de alguna de las tuplas), quiere decir que ese producto NO está en [stock] y devuelve
-- cero.                                 


-------------------------------------- Ejercicio 3 --------------------------------------

precioDelProducto :: [([Char],Float)] -> [Char] -> Float 
precioDelProducto (x:xs) producto | producto == fst x = snd x 
                                  | otherwise = precioDelProducto xs producto

-- Dada la lista de precios (de cada producto) y un producto, busca ese producto 
-- en la lista de precios y me devuelve la segunda componente de su tupla (que es su 
-- precio). No le coloco caso base porque siempre "producto" va a ser una 1ra componente 
-- de alguna tupla de [precios]; es decir, [precios] nunca va a llegar a ser la lista
-- vacía y la función va a terminar.

dineroEnStock :: [([Char],Int)] -> [([Char],Float)] -> Float 
dineroEnStock [] _ = 0
dineroEnStock (x:xs) precios = ((fromIntegral (snd x)) * (precioDelProducto precios (fst x))) + (dineroEnStock xs precios) 

-- Agarra la 1er tupla de [stock] y hago la cuenta: candtidad de producto (2da componente) * 
-- precio del producto (llamo a la función "precioDelProducto" y le paso como "producto" la
-- 1er componente de la tupla). Y sumo el llamado recursivo.
-- Cuando [stock] se queda sin elementos, devuelvo 0 y termino. 


-------------------------------------- Ejercicio 4 --------------------------------------

aplicarOferta :: [([Char],Int)] -> [([Char],Float)] -> [([Char],Float)]
aplicarOferta _ [] = [] 
aplicarOferta stock (x:xs) | (stockDeProducto stock (fst x)) > 10 = (fst x, (snd x) * (0.80)) : (aplicarOferta stock xs) 
                           | otherwise = x : (aplicarOferta stock xs)  

-- Esta función recibe [stock] y [precios].
-- Para la primer tupla de [precios], toma su producto (1ra componente) y consulta cúanto
-- stock hay de ese producto (llama a la función "stockDeProducto" con [stock] y "producto").
-- Si el número resultado es mayor que 10, arma una nueva tupla donde la 1ra componente es
-- el "producto" (o 1ra componente de la primer tupla de [precios]) y la 2da componente
-- es el precio del producto (2da componente de la tupla) multiplicado por 0.8.
-- Si el número resultado es menor/igual que 10, devuelve "x" como viene (no hace nada al
-- precio). 
-- El resultado de trabajar con "x" (1ra tupla de [precios]) lo deja en cancha y vuelve
-- a llamar a la función recursivamente con "xs" de precios. Cuando llega a [precios] es 
-- [], termina, devuelve [] y allí va metiendo todos los resultados que fue obteniendo 
-- de los distintos elementos de [precios].


-- Fin. 