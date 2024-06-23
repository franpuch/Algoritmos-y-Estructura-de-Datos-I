
from queue import Queue as Cola

# Ejercicio 1.

def reordenar_cola_priorizando_vips(fila_clientes: Cola[tuple[str,str]]) -> Cola[str]:
    reconstructor:list[tuple[str,str]] = [] 
    lista_comunes:list[tuple[str,str]] = [] 
    lista_vips:list[tuple[str,str]] = []

    while (not (fila_clientes.empty())) :
        clientes_actual:tuple[str,str] = fila_clientes.get() 
        if (clientes_actual[1] == "comun") :
            reconstructor.append(clientes_actual)
            lista_comunes.append(clientes_actual) 
        else :
            reconstructor.append(clientes_actual) 
            lista_vips.append(clientes_actual) 

    for i in range (0,len(reconstructor),1) :
        fila_clientes.put(reconstructor[i]) 

    res:Cola[str] = Cola()
    for j in range (0,len(lista_vips),1) :
        res.put(lista_vips[j][0]) 
    for k in range (0,len(lista_comunes),1) :
        res.put(lista_comunes[k][0])

    return res 


# Ejercicio 2.

def torneo_de_gallinas(estrategias: dict[str,str]) -> dict[str,int]:
    res:dict[str,int] = {}

    for i in estrategias.keys() :
        res[i] = 0

    ya_jugaron:list[tuple[str,str]] = []

    for j in estrategias.keys() :
        for k in estrategias.keys() :
            if ((not ((j,k) in ya_jugaron)) and (not ((k,j) in ya_jugaron))) :
                if ((j != k) and (estrategias[j] == 'me la banco y no me desvio') and (estrategias[k] == 'me la banco y no me desvio')) :
                    res[j] -= 5
                    res[k] -= 5
                elif ((j != k) and (estrategias[j] == 'me desvio siempre') and (estrategias[k] == 'me desvio siempre')) : 
                    res[j] -= 10
                    res[k] -= 10
                elif ((j != k) and (estrategias[j] == 'me desvio siempre') and (estrategias[k] == 'me la banco y no me desvio')) :
                    res[j] -= 15
                    res[k] += 10
                elif (((j != k) and (estrategias[j] == 'me la banco y no me desvio') and (estrategias[k] == 'me desvio siempre'))) :
                    res[j] += 10
                    res[k] -= 15
                ya_jugaron.append((j,k))

    return res 


# Funcionamiento General del Algoritmo:
# A cada una de las claves, la hago jugar contra todas las demás. Como el resultado de la disputa modifica el valor de ambas claves, primero debo
# ver que no hayan jugado antes (consulto si la tupla (jugador1,jugador2) está en la lista 'ya_jugaron').
# Si esa tupla existe en la lista, no los hago jugar (porque ya jugaron y el resultado de la partida modificó los puntos de ambos).
# Si esa tupla no está en la lista: los hago jugar, modifico los puntos de cada uno según el resultado y añado la tupla (jugador1,jugador2) a la lista
# 'ya_jugaron' (para que cuando haga jugar a 'jugador2' con todos, no vuelva a jugar con 'jugador1').
# OBS -> También verifico que en cada jugada, un jugador no juegue contra sí mismo.


# Ejercicio 3.

def columnas_de_matriz (matriz:list[list[str]]) -> list[list[str]] :
    res:list[list[str]] = []

    for i in range (0,len(matriz[0]),1) :
        columna:list[str] = []
        for j in matriz :
            columna.append(j[i])
        res.append(columna)

    return res 


def hay_3_caracteres_consecutivos_iguales (columnas:list[list[str]] , caracter:str) -> bool :
    res:bool = False 

    for i in columnas :
        ultimo_índice_válido:int = len(i) - 3
        for j in range (0,(ultimo_índice_válido + 1),1) :
            if ((i[j] == caracter) and (i[j + 1] == caracter) and (i[j + 2] == caracter)) :
                res = True 

    return res 


def quien_gano_el_tateti_facilito(tablero: list[list[str]]) -> int:
    columnas:list[list[str]] = columnas_de_matriz (tablero)

    if ((hay_3_caracteres_consecutivos_iguales (columnas,'X')) and (not (hay_3_caracteres_consecutivos_iguales (columnas,'O')))) :
        return 1
    elif ((hay_3_caracteres_consecutivos_iguales (columnas,'O')) and (not (hay_3_caracteres_consecutivos_iguales (columnas,'X')))) :
        return 2
    elif ((not (hay_3_caracteres_consecutivos_iguales (columnas,'O'))) and (not (hay_3_caracteres_consecutivos_iguales (columnas,'X')))) :
        return 0
    elif ((hay_3_caracteres_consecutivos_iguales (columnas,'X')) and (hay_3_caracteres_consecutivos_iguales (columnas,'O'))) :
        return 3 


# Ejercicio 4. 

def reverso_de_string (s:str) -> str :
    res:str = ''
    for i in range((len(s)-1),-1,-1) :
        res = res + s[i]
    return res


def lista_de_sufijos (texto:str) -> list[str] :
    res:list[str] = [] 

    for i in range (0,len(texto),1) :
        sufijo:str = ''
        for j in range (i,len(texto),1) :
            sufijo = sufijo + texto[j]
        res.append(sufijo)

    return res 


def cuantos_sufijos_son_palindromos(texto: str) -> int:
    res:int = 0
    sufijos:list[str] = lista_de_sufijos (texto)

    for i in sufijos :
        if (i == reverso_de_string (i)) :
            res += 1 

    return res 



# Fin.

# A continuación dejo todos los modelos y casos de testeo que utilicé.

# Casos de Testeo: EJERCICIO 1.

# c:Cola[tuple[str,str]] = Cola()
# c.put(('J','comun'))
# c.put(('M','vip'))
# c.put(('F','vip'))
# c.put(('L','comun'))
# print (reordenar_cola_priorizando_vips (c)) 

# Casos de Testeo: EJERCICIO 2.

# print (torneo_de_gallinas ({"jugador1": "me desvio siempre"})) 
# print (torneo_de_gallinas ({"jugador1": "me la banco y no me desvio", "jugador2": "me desvio siempre"}))
# print (torneo_de_gallinas ({"jugador1": "me la banco y no me desvio", "jugador2": "me desvio siempre", "jugador3": "me la banco y no me desvio"}))
# print (torneo_de_gallinas ({"jugador1": "me la banco y no me desvio", "jugador2": "me desvio siempre", "jugador3": "me la banco y no me desvio", "jugador4": "me desvio siempre"}))

# Casos de Testeo: EJERCICIO 3.

# Pruebo con matrices de números tipo strings.
# print (columnas_de_matriz([['1'],['2'],['3'],['4']]))
# print (columnas_de_matriz([['1','2']])) 
# print (columnas_de_matriz([['1','2'],['3','4']])) 
# print (columnas_de_matriz([['1','2','3'],['4','5','6'],['7','8','9']]))
# print (columnas_de_matriz([['1','2','3'],['4','5','6']]))

# print (hay_3_caracteres_consecutivos_iguales ([['x','x',' ','o',' '],['o',' ','o','x',' '],[' ','o','o','o','x'],['x','o','o','x',' '],['o',' ','x','x','x']],'x')) 
# print (hay_3_caracteres_consecutivos_iguales ([['x','x',' ','o',' '],['o',' ','o','x',' '],[' ','o','o','o','x'],['x','o','o','x',' '],['o',' ','x','x','x']],'o'))
# print (hay_3_caracteres_consecutivos_iguales ([['x','x',' ','o',' '],['o',' ','o','x',' '],[' ','o','o','o','x'],['x','o','o','x',' '],['o',' ','x',' ','x']],'x'))  
# print (hay_3_caracteres_consecutivos_iguales ([['x','x',' ','o',' ','x'],['o','o','o','x','x','x'],[' ','o','o','o','x','o'],['x','o','o','x',' ','x'],['o',' ','x',' ','x','x']],'o'))
# print (hay_3_caracteres_consecutivos_iguales ([['x','x',' ','o',' ','x'],['o','o','o','x','x','x'],[' ','o','o','o','x','o'],['x','o','o','x',' ','x'],['o',' ','x',' ','x','x'],[' ','o','x','o',' ','x']],'x'))

# print (quien_gano_el_tateti_facilito ([['X', 'O', ' ', ' ', ' '],['X', 'O', ' ', ' ', ' '],['X', ' ', ' ', ' ', ' '],[' ', ' ', ' ', 'O', 'O'],[' ', ' ', ' ', 'O', 'O']]))
# print (quien_gano_el_tateti_facilito ([['X', 'O', ' ', ' ', ' '],['X', 'O', ' ', ' ', ' '],[' ', 'O', ' ', ' ', ' '],[' ', ' ', ' ', 'O', 'O'],[' ', ' ', ' ', 'O', 'O']]))
# print (quien_gano_el_tateti_facilito ([['X', 'O', ' ', 'X', ' '],['O', 'O', ' ', 'O', 'O'],['X', ' ', ' ', 'X', ' '],[' ', 'X', ' ', 'O', 'O'],['O', ' ', ' ', 'O', 'O']])) 
# print (quien_gano_el_tateti_facilito ([['X', 'O', ' ', 'X', ' '],['X', 'O', ' ', 'X', ' '],[' ', 'O', ' ', 'X', ' '],['O', ' ', ' ', 'O', 'O'],[' ', 'X', ' ', 'O', 'O']]))
# print (quien_gano_el_tateti_facilito ([
#             [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
#             [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
#             [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
#             [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
#             [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
#             [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
#             [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
#             [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
#         ]))

# Casos de Testeo: EJERCICIO 4.

# print (reverso_de_string (''))
# print (reverso_de_string ('H'))
# print (reverso_de_string ('Hola'))
# print (reverso_de_string ('Hola que tal')) 

# print (lista_de_sufijos (''))
# print (lista_de_sufijos ('Diego'))
# print (lista_de_sufijos ('D')) 
# print (lista_de_sufijos ('Diego es carnicero')) 

# print (cuantos_sufijos_son_palindromos (''))
# print (cuantos_sufijos_son_palindromos (' '))
# print (cuantos_sufijos_son_palindromos ('Diego'))
# print (cuantos_sufijos_son_palindromos ('h'))
# print (cuantos_sufijos_son_palindromos (' HooH '))
# print (cuantos_sufijos_son_palindromos ('Diego paap'))
# print (cuantos_sufijos_son_palindromos ('aaaaa'))
# print (cuantos_sufijos_son_palindromos ('1661'))


# Fin del Fin.