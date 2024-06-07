# Segundo Parcial.
# 2do Cuatrimestre 2023.
# TEMA B.

from queue import Queue as Cola 

print ('Ejercicio -: ') 

# Ejercicio 1.

def ind_nesima_aparicion (s:list[int] , n:int , elem:int) :
    res:int = -1 
    apariciones:int = 0

    i:int = 0 
    while ((i < len(s)) and (apariciones < n)) :
        if (s[i] == elem) : 
            apariciones = apariciones + 1
            if (apariciones == n) :
                res = i
        i += 1 
    
    return res 

# print (ind_nesima_aparicion ([-1, 1, 1, 5, -7, 1, 3],2,1)) 
# print (ind_nesima_aparicion ([],2,7))
# print (ind_nesima_aparicion ([1,2,3],2,5))
# print (ind_nesima_aparicion ([1,2,3,4,1,2,3,4],4,2))
# print (ind_nesima_aparicion ([1,2,1,1,1,2,3,4],2,1)) 


# Ejercicio 2.

def mezclar (s1:list[int] , s2:list[int]) -> list[int] :
    mazo1:Cola[int] = Cola() 
    mazo2:Cola[int] = Cola() 

    for i in s1 :
        mazo1.put(i) 
    for j in s2 :
        mazo2.put(j) 
    
    res:list[int] = [] 
    i:int = 0 
    while (i < ((len(s1))*2)) :
        if ((i % 2) == 0) :
            res.append(mazo1.get()) 
        else :
            res.append(mazo2.get()) 
        i += 1 
    return res 

# print (mezclar ([1,3,0,1],[4,0,2,3])) 
# print (mezclar ([],[])) 
# print (mezclar ([1,1,1,1,1,1,1,1],[2,2,2,2,2,2,2,2])) 


# Ejercicio 3.

def frecuencia_posiciones_por_caballo (caballos:list[str] , carreras:dict[str,list[str]]) -> dict[str,list[int]] :
    res:dict[str,list[int]] = {} 

    for i in caballos :
        posiciones:list[int] = [0]*(len(caballos)) 

        for j in carreras.values() :
            for k in range (0,len(j),1) :
                if (j[k] == i) :
                    posiciones[k] += 1
        
        res[i] = posiciones 
    
    return res 

# print (frecuencia_posiciones_por_caballo (['linda','petisa','mister','luck'],{ 'carrera 1':['linda','petisa','mister','luck'], 'carrera 2':['petisa','mister','linda','luck'] }))
# print (frecuencia_posiciones_por_caballo ([],{'carrera1':[],'carrera2':[]})) 


# Ejercicio 4.

def reverso (s:list[int]) -> list[int] :
    res:list[int] = [] 
    for i in range ((len(s)-1),-1,-1) :
        res.append(s[i]) 
    return res 

# print (reverso ([1,2,3,4]))
# print (reverso ([])) 

def matriz_capicua (m:list[list[int]]) -> bool :
    res:bool = True 

    if (len(m) == 0) :
        res = False 
    else : 
        for i in range (0,len(m),1) :
            if (len(m[i]) == 0) :
                res = False 
            else :
                lista_reverso:list[int] = reverso (m[i])
                j:int = 0 
                while (j < len(m[i])) :
                    if (m[i][j] != lista_reverso[j]) :
                        res = False 
                    j += 1
    
    return res 

# print (matriz_capicua ([[1,2,2,1],[-5,6,6,-5],[0,1,1,0]])) 
# print (matriz_capicua ([])) 
# print (matriz_capicua ([[],[],[]])) 
# print (matriz_capicua ([[1,2,1],[5,4,5],[8,7,7],[8,9,8]])) 
# print (matriz_capicua ([[5],[8],[7],[5]])) 
# print (matriz_capicua ([[1,2,1],[5,4,5],[8,7,8],[8,9,8]])) 


# Fin.