# Práctica 7 - Funciones sobre Listas.

print ("Práctica 7 - Funciones sobre Listas")
print ("\nEjercicio 3\n")


#* Ejercicio 1.

# 1.1
def pertenece (s:list[int] , e:int) -> bool : 
    i:int = 0 
    while (i < len(s)) and (s[i] != e) :
        i += 1
    return i < len(s) 

# print (pertenece ([1,2,3],1))  
# print (pertenece ([1,2,3],2)) 
# print (pertenece ([1,2,3],3)) 
# print (pertenece ([1,2,3],8)) 
# print (pertenece ([],7)) 

def pertenece_v2 (s:list[int] , e:int) -> bool :
    res:bool = False  
    for elem in s :
        if elem == e : 
            res = True 
    return res

# Esta forma de construir el "for" es particular: dentro de la lista "s"
# recorre elemento por elemento (i = elemento , no la posición).
# La desventaja es que siempre recorre de a un elemento y de "izquierda"
# a derecha (para adelante).

# print (pertenece_v2 ([1,2,3],1))  
# print (pertenece_v2 ([1,2,3],2)) 
# print (pertenece_v2 ([1,2,3],3)) 
# print (pertenece_v2 ([1,2,3],8)) 
# print (pertenece_v2 ([],7)) 

def pertenece_v3 (s:list[int] , e:int) -> bool : 
    res = False 
    for i in range (0,len(s),1) : 
        if s[i] == e :
            res = True 
    return res

# En esta implementación de "for", le estoy explicitando el rango
# (movete entre las posiciones de "s", de a una por vez). Como le estoy
# especificando un rango, "i" van a ser las posiciones, por lo tanto, 
# para acceder al elemento (y compararlo con "e") debo llamarlo.

# print (pertenece_v3 ([1,2,3],1))  
# print (pertenece_v3 ([1,2,3],2)) 
# print (pertenece_v3 ([1,2,3],3)) 
# print (pertenece_v3 ([1,2,3],8)) 
# print (pertenece_v3 ([],7)) 

# 1.2 
def divide_a_todos (s:list[int] , e:int) -> bool : 
        i:int = 0 
        while ((i < len(s)) and (s[i] % e == 0)) : 
            i += 1 
        if i == len(s) :
            return True 
        else : 
            return False 

# print (divide_a_todos ([2,4,6,8],2))
# print (divide_a_todos ([3,6,10,9,4],3))
# print (divide_a_todos ([1,2,3],5)) 
# print (divide_a_todos ([],4))

# 1.3 
def suma_total (s:list[int]) -> int : 
    acum:int = 0 
    for i in range (0,len(s),1) : 
        acum += s[i] 
    return acum 

# print (suma_total ([1,2,3]))
# print (suma_total ([])) 

# 1.4 
def ordenados (s:list[int]) -> bool : 
    i:int = 0 
    while (i < (len(s)-1)) and (s[i] < s[i+1]) : 
        i += 1 
    if (i == len(s) -1) : 
        return True 
    else :
        return False

# print (ordenados ([1,2,3]))
# print (ordenados ([1,2,5,3]))
# print (ordenados ([7,25,48,100]))  
# print (ordenados ([20,85,13,12])) 
# print (ordenados ([1,2,3,3,4,5])) 
# print (ordenados ([1,2,3,4,2])) 

# 1.5 
def alguna_palabra_larga (s:list[str]) -> bool :
    i:int = 0 
    while ((i < len(s)) and (len(s[i]) < 7)) : 
        i += 1 
    if (i == len(s)) : 
        return False 
    else : 
        return True 

# print (alguna_palabra_larga (["hola","xd","rive","b"])) 
# print (alguna_palabra_larga (["boca","campeon","de","elMundoMundial","jeje"])) 
# print (alguna_palabra_larga ([]))
# print (alguna_palabra_larga (["qcyo7palabras","riber te fuiste a la b","gomita"])) 

# 1.6 
def reverso_del_String (s:str) -> str : 
    revers = "" 
    for i in range (len(s)-1,-1,-1) : 
        revers = revers + s[i] 
    return revers

# Toma un String "s" y lo invierte. 

# print (reverso_del_String ("")) 
# print (reverso_del_String ("RiBer te fuiste a la B")) 
# print (reverso_del_Sting ("Somos o no somos")) 

def elimininar_del_String (s:str , n:str) -> str : 
    limpio:str = ""
    i:int = 0
    while (i < len(s)) :
        if (s[i] != n) :
            limpio = limpio + s[i]
            i += 1 
        else :
            i += 1 
    return limpio   

# Agarra un String "s" y elimina el caracter (que pertenece al string) que le
# pidas (parámetro "n").

# print (elimininar_del_String ("hola","h"))  
# print (elimininar_del_String ("Somos o no somos"," ")) 

def es_palíndromo (s:str) -> bool :
    if ((elimininar_del_String (s," ")) == (reverso_del_String (elimininar_del_String (s," ")))) : 
        return True 
    else : 
        return False  

# No me dicen si el parámetro "s" es de tipo In/Out/InOut. Por lo tanto no me preocupo
# si lo modifico o no. De todas formas, no lo estoy modificando, sólo trabajo con su 
# valor de entrada. 
#? Consultar si en este caso estoy trabajando con "s" de tipo IN o no.

# print (es_palíndromo ("somos o no somos")) 
# print (es_palíndromo ("riber te fuiste a la b")) 
# print (es_palíndromo (" moom ")) 
# print (es_palíndromo ("prueba false")) 

# 1.7 
def tiene_letra_minúscula (s:str) -> bool :
    res = False 
    i:int = 0 
    while (i < len(s)) : 
        if ((s[i] >= 'a') and (s[i] <= 'z')) : 
            res = True 
            i += 1 
        else : 
            i += 1 
    return res 

# print (tiene_letra_minúscula ("hola"))
# print (tiene_letra_minúscula ("HOLA"))
# print (tiene_letra_minúscula ("HOlA"))

def tiene_letra_MAYÚSCULA (s:str) -> bool :
    res = False 
    i:int = 0 
    while (i < len(s)) : 
        if ((s[i] >= 'A') and (s[i] <= 'Z')) : 
            res = True 
            i += 1 
        else : 
            i += 1 
    return res

# print (tiene_letra_MAYÚSCULA ("hola"))
# print (tiene_letra_MAYÚSCULA ("HOLA"))
# print (tiene_letra_MAYÚSCULA ("HOlA"))

def tiene_dígito_numérico (s:str) -> bool :
    res = False 
    i:int = 0 
    while (i < len(s)) : 
        if ((s[i] >= '0') and (s[i] <= '9')) : 
            res = True 
            i += 1 
        else : 
            i += 1 
    return res

# print (tiene_dígito_numérico ("Hola"))
# print (tiene_dígito_numérico ("HOLA"))
# print (tiene_dígito_numérico ("H0l4")) 
# print (tiene_dígito_numérico ("hOLa49")) 

def fortaleza_contraseña (contraseña:str) -> str : 
    res:int = "Amarillo"
    if ((len(contraseña)) < 5) :
        res = "Rojo"
        return res 
    elif (((len(contraseña)) > 8) and (tiene_letra_minúscula (contraseña)) and (tiene_letra_MAYÚSCULA (contraseña)) and (tiene_dígito_numérico (contraseña))) :
        res = "Verde"
        return res 
    else : 
        return res 

# print (fortaleza_contraseña ("Hola"))
# print (fortaleza_contraseña ("Cient1f1c0 XD m4x")) 
# print (fortaleza_contraseña ("la típica 45")) 

#? No entiendo por qué funciona bien con letras tildadas, ya que estas son caracteres especiales
#? fuera del rango ASCII que le estoy dando. Se lo puedo añadir (como una función auxiliar más a
#? verificar), pero funciona igual.

# 1.8 
def saldo_actual (s:list[tuple]) -> int :
    saldo:int = 0 
    i:int = 0 
    while (i < len(s)) : 
        if (s[i][0] == "I") : 
            saldo = saldo + s[i][1] 
            i += 1 
        else : 
            saldo = saldo - s[i][1] 
            i += 1 
    return saldo 

#! Cómo recorrer tuplas y listas de tuplas.
#! Recorrer elemento de las tuplas se hace igual que los elementos de una listas: t[n]
#! --> t = tupla
#! -- n = posición del elemento que quiero obtener.
#! Para listas de tuplas, uso la misma sintaxis pero doble: s[i][n] 
#! --> s = lista de tuplas.
#! --> i = posición de la tupla (elemento de s) que quiero leer.
#! --> n = posición del elemento DENTRO DE LA TUPLA "i" que quiero obtener.

# print (saldo_actual ([("I",2000), ("R", 20),("R", 1000),("I", 300)])) 
# print (saldo_actual ([("R",10),("R",25),("R",5)]))
# print (saldo_actual ([("I",10),("I",25),("I",5)])) 

# 1.9 
def tieneAlMenos3VocalesDistintas (s:str) -> bool : 
    vocales:str = ""
    for i in range (0,len(s),1) :
        if ((s[i] =='a') or (s[i] == 'e') or (s[i] == 'i') or (s[i] == 'o') or (s[i] == 'u')) and (pertenece (vocales, s[i]) == False) :
            vocales = vocales + s[i] 
        else : 
            None 
    if (len(vocales) >= 3) :
        return True 
    else : 
        return False 
    
# Andá letra por letra. Si es vocal y si no pertenece a "vocales", metela en vocales.
# Si no es vocal o ya está en "vocales" (porque encontré esa vocal antes y ya la metí), no 
# hagas nada. Al final, calculá la longitud de "vocales": si es mayor/igual que 3, quiere decir
# que hay al menos 3 vocales (distintas, porque las repetidas no las metí), devolvé True; 
# sino, devolvé False.

# print (tieneAlMenos3VocalesDistintas ("aeiu"))
# print (tieneAlMenos3VocalesDistintas ("ai"))
# print (tieneAlMenos3VocalesDistintas ("aiaoauoiuaa"))
# print (tieneAlMenos3VocalesDistintas ("Distintas"))
# print (tieneAlMenos3VocalesDistintas ("srtgw"))


#* Ejercicio 2

# 2.1 
def cero_en_posicion_par (s:list[int]) -> list[int] : 
    i:int = 0 
    while (i < len(s)) :
        if (i % 2 == 0) :
            s[i] = 0
            i += 1
        else : 
            i += 1 
    return s 

# print (cero_en_posicion_par ([]))
# print (cero_en_posicion_par ([4]))
# print (cero_en_posicion_par ([0,1,2,3,4])) 

# 2.2 
def cero_en_posicion_par_v2 (s:list[int]) -> list[int] :
    x = s.copy() 
    for i in range (0,len(x),1) :
        if (i % 2 == 0) :
            x[i] = 0 
        else : 
            None
    return x 

#! Si antes del return añado la instrucción print(s), verifico que efectivamente "s" no 
#! se modificó.

# print (cero_en_posicion_par_v2 ([]))
# print (cero_en_posicion_par_v2 ([4]))
# print (cero_en_posicion_par_v2 ([0,1,2,3,4])) 

# 2.3 
def borrar_vocales (s:str) -> str : 
    vocales:list[str] = ['a','e','i','o','u']
    sinVocales:str = "" 
    i:int = 0 
    while (i < len(s)) :
        if (pertenece (vocales,s[i])) : 
            i += 1 
        else : 
            sinVocales = sinVocales + s[i] 
            i += 1 
    return sinVocales 

# print (borrar_vocales (""))
# print (borrar_vocales ("t"))
# print (borrar_vocales ("hola"))
# print (borrar_vocales ("xd xd qcy"))
# print (borrar_vocales ("aeiaiou")) 

# 2.4 
def reemplazar_vocales (s:str) -> str : 
    vocales:list[str] = ['a','e','i','o','u']
    x:str = "" 
    for i in range (0,len(s),1) : 
        if (not (pertenece (vocales,s[i]))) : 
            x = x + s[i] 
        else : 
            x = x + "_"
    return x 

#? Probé el siguiente algoritmo < Copio en "x" a "s" y recorro "x" con x[i]. Si x[i] es una
#?                                vocal (pertenece a [vocales]), hago "x[i]='_'". Si x[i] no
#?                                es una vocal (no pertenece a [vocales]), lo dejo y paso 
#?                                al siguiente. >
#? Pero no me reconocía el x[i]='_'.

# print (reemplazar_vocales (""))
# print (reemplazar_vocales ("hola"))
# print (reemplazar_vocales ("xd xd xd"))
# print (reemplazar_vocales ("aeieioou oooo")) 

# 2.5 
def da_vuelta_str (s:str) -> str : 
    reverso:str = "" 
    i:int = (len(s) - 1) 
    while (i >= 0) : 
        reverso = reverso + s[i]
        i -= 1 
    return reverso 

#! Otra implementación del mismo problema la hice en el Ejercicio 1.6
#! Esta vez lo implementé con WHILE (antes con FOR).

# print (da_vuelta_str ("")) 
# print (da_vuelta_str ("d"))
# print (da_vuelta_str ("Hola")) 
# print (da_vuelta_str ("Hola ¿que TAL?")) 

# 2.6 
def eliminar_repetidos (s:str) -> str : 
    limpio:str = ""
    for i in range (0,len(s),1) :
        if (not (pertenece (limpio,s[i]))) : 
            limpio = limpio + s[i] 
        else : 
            None  
    return limpio 

# print (eliminar_repetidos (""))
# print (eliminar_repetidos ("hola"))
# print (eliminar_repetidos ("Hoolaaaaa"))
# print (eliminar_repetidos ("VVVVVVV"))
# print (eliminar_repetidos ("xd xd xd rs")) 

