# Segundo Parcial.
# 2do Cuatrimestre 2023.
# TEMA A.

from queue import Queue as Cola

print ('Ejercicio -: ')

# Ejercicio 1. 

def acomodar (s:list[str]) -> list[str] :
    up:list[str] = [] 
    lla:list[str] = [] 

    i:int = 0
    while (i < len(s)) :
        if (s[i] == 'UP') :
            up.append(s[i]) 
            i += 1
        else :
            lla.append(s[i]) 
            i += 1 
    
    acomodado:list[str] = []
    for i in range (0,len(up),1) :
        acomodado.append(up[i]) 
    for j in range (0,len(lla),1) :
        acomodado.append(lla[j]) 
    
    return acomodado 

# print (acomodar (['LLA','UP','LLA','LLA','UP'])) 
# print (acomodar ([])) 


# Ejercicio 2.

def pos_umbral (s:list[int] , u:int) -> int :
    flujo:Cola[int] = Cola() 
    for i in range (0,len(s),1) :
        flujo.put(s[i]) 

    res:int = -1 
    entradas:int = 0 
 
    while ((entradas < u) and (not (flujo.empty()))) :
        cantidad_actual:int = flujo.get() 
        if (cantidad_actual > 0) :
            res += 1 
            entradas += cantidad_actual 
        else : 
            res += 1 
    
    if (entradas < u) :
        res = -1

    return res 

# print (pos_umbral ([1,-2,0,5,-7,3],5))
# print (pos_umbral ([1,-2,0,5,-7,3],15))
# print (pos_umbral ([1,-2,0,5,-7,3],8))
# print (pos_umbral ([5,-2,0,5,-7,3],5))
# print (pos_umbral ([],5))
# print (pos_umbral ([0,-1,-5,0,0],4))

# Comentarios del Código: 
# > res arranaca en -1 ya que la primera posicion de cualquier lista es el 
#   subíndice 0. Por lo tanto, como cada vez que saco algo de la Cola sumo 1,
#   debo empezar el -1 para que en la primer extracción 'res' refiera a la 1ra 
#   posicion.
# > Ciclo: antes de hacer una pasada del ciclo, fijate que 'entradas' no supere
#          el umbral ('u'), y que la Cola no esté vacía. Si entradas supera al umbral,
#          no me importa qué está pasando en la Cola (ya que sé que la respuesta no es 
#          res = -1); si la Cola llega a estar vacía primero, no me importa qué está 
#          pasando con 'entradas' (ya que sé que la respuesta es -1 porque el umbral no
#          fue superado).


# Ejercicio 3. 

def columnas_de_matriz (matriz:list[list[int]]) -> list[list[int]] : 
    res:list[list[int]] = [] 
    for i in range (0,len(matriz[0]),1) :
        columna:list[int] = [] 
        for j in range (0,len(matriz),1) :
            columna.append(matriz[j][i])
        res.append(columna) 
    return res 

# print (columnas_de_matriz ([]))
# print (columnas_de_matriz ([[1,5,9],[2,6,10],[3,7,11],[4,8,12]])) 
# print (columnas_de_matriz ([[4,3],[2,4],[1,1]]))
# print (columnas_de_matriz ([[1,2,3],[4,5,6],[7,8,9]])) 

def columnas_repetidas (mat:list[list[int]]) -> bool :
    res:bool = True
    columnas:list[list[int]] = columnas_de_matriz (mat) 

    for i in range (0,int((len(columnas))/2),1) :
        if (columnas[i] != columnas[int((len(columnas))/2) + i]) :
            res = False 
    
    return res 

# print (columnas_repetidas ([[1,2,1,2],[-5,6,-5,6],[0,1,0,1]])) 
# print (columnas_repetidas ([[1,1],[2,2],[3,3]]))
# print (columnas_repetidas ([[1,3,1,3],[0,1,0,1]]))
# print (columnas_repetidas ([[7,8,7,8],[1,4,1,4],[2,0,2,0],[3,1,3,1]])) 
# print (columnas_repetidas ([[1,1,1,1]]))

# print (columnas_repetidas ([[1,1],[2,3],[3,2]]))
# print (columnas_repetidas ([[1,4,1,5],[1,2,1,2],[1,3,1,3]]))
# print (columnas_repetidas ([[1,4,3,4],[1,4,3,4],[1,4,3,4],[1,4,3,4]]))
# print (columnas_repetidas ([[1,1,3,1]])) 


# Ejercicio 4. 

def cuenta_posiciones_por_nacion (naciones:list[str] , torneos:dict[int,list[str]]) -> dict[str,list[int]] :
    res:dict[str,list[int]] = {} 

    posiciones:list[list[str]] = [] 
    for i in torneos.values() :
        posiciones.append(i) 

    for a in naciones :
        historial:list[int] = [0]*(len(naciones))

        for b in posiciones :
            for c in range (0,len(b),1) :
                if (b[c] == a) : 
                    historial[c] += 1

        res[a] = historial 
    
    return res 

# print (cuenta_posiciones_por_nacion (["arg","aus","nz","sud"],{2023:["nz","sud","arg","aus"],2022:["nz","sud","aus","arg"]})) 
# print (cuenta_posiciones_por_nacion ([],{ 2023:[], 2022:[]}))
# print (cuenta_posiciones_por_nacion (['arg'],{2023:['arg']})) 
# print (cuenta_posiciones_por_nacion (['arg'],{2023:['arg'],2022:['arg'],2021:['arg'],2020:['arg'],2019:['arg']}))
# print (cuenta_posiciones_por_nacion (['arg','nz','aus','sud','fra','sct','ing'],{2024:['arg','nz','aus','sud','fra','sct','ing'],2023:['nz','arg','sud','aus','fra','ing','sct'],2022:['fra','nz','aus','sct','ing','sud','arg'],2021:['sct','aus','sud','nz','arg','fra','ing']}))

# Funcionamiento General del Algoritmo:
# 1. Crea un diccionario vacío.
# 2. Crea la lista 'posiciones' y meté los valores de todas las claves (del diccionario
#    'torneos').
# 3. Para cada elemento de la lista 'naciones':
#       --> Crea una lista de tantos ceros como cantidad de naciones.
#       --> Para cada elemento de 'posiciones':
#                   --> En un ciclo de índices (for in range) andá comparando cada 
#                       elemento (en esa posición) de la lista de 'posiciones' (que agarré)
#                       con la 'nación' (tomada al principio de 3): si son iguales, andá a esa
#                       posición en 'historial' y sumale 1.
#       --> Añadí al diccionario 'res' el par nación:historial. 
#       --> Pasá al siguiente elemento de 'naciones' y repetí.


# Fin.