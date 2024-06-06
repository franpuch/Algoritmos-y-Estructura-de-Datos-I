# Simulacro de Parcial.

print ('Ejercicio : ')

# Ejercicio 1.

def ultima_aparicion (s:list[int] , e:int) -> int :
    for i in range ((len(s)-1),-1,-1) : 
        if (s[i] == e) :
            return i 

# print (ultima_aparicion ([1,2,2,3,5,4,2,1],1))
# print (ultima_aparicion ([1,2,2,3,5,4,2,1],2))
# print (ultima_aparicion ([1,2,2,3,5,4,2,1],3)) 
# print (ultima_aparicion ([9,1,2,2,3,5,4,2,1],9)) 
# print (ultima_aparicion ([1],1)) 


# Ejercicio 2.

def pertenece_ints (e:int , s:list[int]) -> bool :
    res:bool = False 
    i:int = 0 
    while (i < len(s)) : 
        if (s[i] == e) :
            res = True 
            i += 1 
        else :
            i += 1
    return res 

def elementos_exclusivos (s:list[int] , t:list[int]) -> list[int] : 
    res:list[int] = [] 

    for i in range (0,len(s),1) :
        if (not (pertenece_ints (s[i],t))) : 
            res.append(s[i]) 
    
    for j in range (0,len(t),1) :
        if (not (pertenece_ints (t[j],s))) :
            res.append(t[j])

    return res 

# print (elementos_exclusivos ([],[]))
# print (elementos_exclusivos ([],[1,2,3]))
# print (elementos_exclusivos ([4,5,6],[]))
# print (elementos_exclusivos ([1,2,3],[4,5,6])) 
# print (elementos_exclusivos ([1,2,3],[4,5,2,3])) 


# Ejercicio 3. 

def contar_traducciones_iguales (ing:dict[str,str] , ale:dict[str,str]) -> int :
    res:int = 0 

    for i in (ing.keys()) : 
        if ((i in (ale.keys())) and (ing[i] == ale[i])) : 
            res += 1 
    
    return res 

# ingles:dict[str,str] = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}
# aleman:dict[str,str] = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
# aleman2:dict[str,str] = {"Mano":"xd", "XD":"fras", "Finger":"Dedo", "Pie":"Foot"}
# aleman3:dict[str,str] = {"Mano":"xd", "XD":"fras", "Finger":"Dedo"}  

# print (contar_traducciones_iguales (ingles,aleman))
# print (contar_traducciones_iguales (ingles,aleman2)) 
# print (contar_traducciones_iguales (ingles,aleman3)) 


# Ejercicio 4. 

# Para este ejercicio, utilizo la función 'pertenece_ints' definida en el Ejercicio 2.

def lista_sin_repetidos (s:list[int]) -> list[str] :
    sin_repetidos:list[int] = [] 

    for i in range (0,len(s),1) :
        if (not (pertenece_ints (s[i],sin_repetidos))) :
            sin_repetidos.append(s[i]) 
    
    return sin_repetidos 

def cantidad_de_apariciones (e:int , s:list[int]) -> int : 
    res:int = 0 

    i:int = 0 
    while (i < len(s)) :
        if (s[i] == e) :
            res += 1 
            i += 1 
        else : 
            i += 1 
    
    return res 

def convertir_a_diccionario (s:list[int]) -> dict[int,int] :
    res:dict[int,int] = {} 
    claves:list[int] = lista_sin_repetidos (s) 

    for i in range (0,len(claves),1) :
        res[claves[i]] = cantidad_de_apariciones (claves[i],s) 

    return res 

# print (convertir_a_diccionario ([-1,0,4,100,100,-1,-1])) 
# print (convertir_a_diccionario ([])) 
# print (convertir_a_diccionario ([25])) 


# Fin.