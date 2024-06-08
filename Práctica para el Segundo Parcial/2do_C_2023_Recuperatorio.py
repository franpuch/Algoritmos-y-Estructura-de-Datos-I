# Recuperatorio Segundo Parcial.

print ('Ejercicio 2: ') 

# Ejercicio 1.

def verificar_transacciones (s:str) -> int :
    saldo_actual:int = 0 

    i:int = 0 
    while ((saldo_actual >= 0) and (i < len(s)) and (s[i] != 'x')) :
        if (s[i] == 'r') :
            saldo_actual += 350
        elif (s[i] == 'v') :
            saldo_actual -= 56 
        else :
            print ('Saldo actual: ',saldo_actual) 
        i += 1
    
    if (saldo_actual < 0) :
        saldo_actual += 56 
        return saldo_actual 
    else : 
        return saldo_actual 

# print (verificar_transacciones (''))
# print (verificar_transacciones ("ssrvvrrvvsvvsxrvvv"))
# print (verificar_transacciones ("ssrvvvvsvvsvvv"))
# print (verificar_transacciones ('rvv')) 


# Ejercicio 2.

def valor_minimo (s:list[(float,float)]) -> float :
    res:float = s[0][0]

    for i in range (1,len(s),1) :
        if (s[i][0] < res) :
            res = s[i][0] 

    return res 

# print (valor_minimo ([(5.5,20.4)]))
# print (valor_minimo ([(1.0, 5.2), (10.4, 15.1), (19.7, 28.9), (25.4, 35.6), (-3.1, 1.3)])) 
# print (valor_minimo ([(1.0, 5.2), (10.4, 15.1), (19.7, 28.9), (25.4, 35.6), (3.1, 1.3)]))
# print (valor_minimo ([(1.0, 5.2), (10.4, 15.1), (19.7, 28.9), (-2.3, 8.2), (25.4, 35.6), (3.1, 1.3)])) 


# Ejercicio 3.

def buscar_menor (s:list[(int,float)]) -> float :
    res:float = s[0][1]

    for i in range (1,len(s),1) :
       if (s[i][1] < res) :
           res = s[i][1]
    
    return res 

def buscar_mayor (s:list[(int,float)]) -> float :
    res:float = s[0][1]

    for i in range (1,len(s),1) :
       if (s[i][1] > res) :
           res = s[i][1]
    
    return res 

def valores_extremos (cotizaciones_diarias:dict[str,list[(int,float)]]) -> dict[str,(float,float)] :
    res:dict[str,(float,float)] = {} 

    for i in cotizaciones_diarias.keys() :
        extremos:tuple[float,float] = ((buscar_menor (cotizaciones_diarias[i])),(buscar_mayor (cotizaciones_diarias[i]))) 
        res[i] = extremos 
    
    return res 

# print (valores_extremos ({"YPF" : [(1,10),(15, 3), (31,100)], "ALUA" : [(1,0), (20, 50), (31,30)]})) 
# print (valores_extremos ({}))
# print (valores_extremos ({'YPF' : [(5,30)]}))
# print (valores_extremos ({"YPF" : [(1,10),(15, 3), (31,100)], "ALUA" : [(1,0), (20, 50), (31,30)], 'GOO' : [(5,20),(8,60),(14,5),(30,2)], 'SPX' : [(1,20),(2,40),(8,60),(14,80),(20,100),(25,120),(30,150)]})) 


# Ejercicio 4. 

def tiene_repetidos (s:list[int]) -> bool :
    res:bool = False
    borrador:list[int] = []
    ceros:list[int] = []

    for i in s :
        if (not i in borrador) :
            borrador.append(i) 
        elif (i == 0) :
            ceros.append(i)
        else : 
            res = True 
    
    return res 

# print (tiene_repetidos ([]))
# print (tiene_repetidos ([1,2,3,4]))
# print (tiene_repetidos ([5]))
# print (tiene_repetidos ([1,2,3,1,4,5,2,4]))
# print (tiene_repetidos ([2,2])) 

# OBS IMP --> Es una función auxiliar a 'es_sudoku_valido' que NO tiene en cuenta los ceros.
#             Los ceros son una forma de completar casillas en blanco, NO UN ELEMENTO QUE DEBA 
#             CHECKEAR SI HAY REPETIDOS O NO. Por eso los meto en una lista aparte que no voy
#             a revisar (a la hora de buscar repetidos).

def columnas_de_matriz (matriz:list[list[int]]) -> list[list[int]] : 
    res:list[list[int]] = []

    for i in range (0,len(matriz[0]),1) :
        columna:list[int] = []
        for j in matriz :
            columna.append(j[i]) 
        res.append(columna) 
    
    return res 

# print (columnas_de_matriz ([[1,5,9],[2,6,10],[3,7,11],[4,8,12]])) 
# print (columnas_de_matriz ([[4,3],[2,4],[1,1]])) 
# print (columnas_de_matriz ([[1,2,3],[4,5,6],[7,8,9]]))
# print (columnas_de_matriz ([[1,3,1,3],[0,1,0,1]])) 
# print (columnas_de_matriz ([[7,8,7,8],[1,4,1,4],[2,0,2,0],[3,1,3,1]]))
# print (columnas_de_matriz ([[1,1,3,1]])) 

def es_sudoku_valido (m:list[list[int]]) -> bool : 
    res:bool = True
    filas:list[list[int]] = list(m) 
    columnas:list[list[int]] = columnas_de_matriz (m) 

    for i in range (0,len(filas),1): 
        if (tiene_repetidos (filas[i])) :
            res = False 
    
    for j in columnas :
        if (tiene_repetidos (j)) :
            res = False 
    
    return res 

# print (es_sudoku_valido ([ 
# [1, 2, 3, 4, 5, 6, 7, 8, 9], 
# [9, 8, 7, 6, 4, 5, 3, 2, 1], 
# [0, 0, 0, 0, 0, 0, 1, 0, 0], 
# [0, 0, 0, 0, 0, 4, 0, 0, 0], 
# [0, 0, 0, 0, 6, 0, 0, 0, 0], 
# [0, 0, 0, 5, 0, 0, 0, 0, 0], 
# [0, 0, 4, 0, 0, 0, 0, 0, 0], 
# [0, 3, 0, 0, 0, 0, 0, 0, 0], 
# [2, 0, 0, 0, 0, 0, 0, 0, 0] 
# ] ))        --> res = True.
# print (es_sudoku_valido ([ 
# [1, 2, 3, 4, 5, 6, 7, 8, 9], 
# [9, 8, 7, 6, 4, 5, 3, 2, 1], 
# [0, 3, 0, 0, 3, 0, 1, 0, 0], 
# [0, 0, 0, 0, 0, 4, 0, 0, 0], 
# [0, 0, 0, 0, 6, 0, 0, 0, 0], 
# [0, 0, 0, 5, 0, 0, 0, 0, 0], 
# [0, 0, 4, 0, 0, 0, 0, 0, 0], 
# [0, 3, 0, 0, 0, 0, 0, 0, 0], 
# [2, 0, 0, 0, 0, 0, 0, 0, 0] 
# ] ))        --> res = False.
# print (es_sudoku_valido ([ 
# [1, 2, 3, 4, 5, 6, 7, 8, 9], 
# [9, 8, 7, 6, 4, 5, 3, 2, 1], 
# [0, 0, 0, 0, 0, 0, 1, 0, 0], 
# [0, 0, 0, 0, 0, 4, 0, 0, 0], 
# [0, 0, 0, 0, 6, 0, 0, 0, 0], 
# [0, 0, 0, 5, 0, 0, 0, 0, 0], 
# [0, 0, 4, 0, 0, 0, 0, 0, 0], 
# [0, 3, 0, 0, 0, 0, 3, 0, 0], 
# [2, 0, 0, 0, 0, 0, 0, 0, 0] 
# ] ))        --> res = False.


# Fin.