# Práctica 8 - Archivos, Pilas, Colas y Diccionarios.

import typing
import random 
from queue import LifoQueue as Pila      # Librería para trabajar con listas LIFO bajo la 
                                         # denominación 'Pila'.
from queue import Queue as Cola          # Librería para trabajar con listas FIFO bajo la
                                         # denominación 'Cola'.


print ('Práctica 8')
print ('Ejercicio ')

#* Ejercicio 1.

# 1.1 
def contar_lineas (nombre_archivo:str) -> int : 
    archivo:typing.IO = open (nombre_archivo,'r') 
    lista_lineas:list[str] = archivo.readlines() 
    archivo.close() 
    return len(lista_lineas) 

# print (contar_lineas ('Pruebas - Practica 8.txt')) 

# 1.2 
def palabra_contenida (palabra:str , linea:str) -> bool : 
    ultimo_indice_valido:int = len(linea) - len(palabra) 
    if (ultimo_indice_valido < 0) : 
        return False 
    else : 
        res = False 
        for i in range (0,(ultimo_indice_valido + 1),1) :  
            candidato:str = ''
            for j in range (i,(i + len(palabra)),1) : 
                candidato = candidato + linea[j] 
            if (candidato == palabra) : 
                res = True 
            else : 
                None 
        return res 

# Toma una palabra y una lineas (u oración). Recorre toda la linea fijandose si la palabra
# aparece en alguna parte.
#! No separa en palabras según espacios ni símbolos de puntuación.
#! Si le pasas (como parámetros) 'avion' y 'superavionF16' devuelve True.

def existe_palabra (palabra:str , nombre_archivo:str) -> bool :
    archivo:typing.IO = open(nombre_archivo,'r') 
    lista_lineas:list[str] = archivo.readlines() 
    archivo.close() 
    res:bool = False 
    for i in range (0,len(lista_lineas),1) : 
        if ((palabra_contenida (palabra,lista_lineas[i])) == True) : 
            res = True 
        else : 
            None 
    return res 

# print (existe_palabra ('avion','Pruebas - Practica 8.txt'))
# print (existe_palabra ('refieren','Pruebas - Practica 8.txt')) 
# print (existe_palabra (',','Pruebas - Practica 8.txt'))

# 1.3 
# Para esta resolución, considero PALABRA = conjunto de caracteres
# separados por espacios, comas o puntos.
def linea_a_lista_de_string (linea:str) -> list[str] :
    res:list[str] = [] 
    i:int = 0 
    palabra:str = ''
    while (i < len(linea)) : 
        if ((linea[i] != ' ') and (linea[i] != ',') and (linea[i] != '.')) : 
            palabra = palabra + linea[i] 
            i += 1 
        else : 
            res.append(palabra) 
            palabra = '' 
            i += 1
    return res 

# print (linea_a_lista_de_string (''))
# print (linea_a_lista_de_string (' , ')) 
# print (linea_a_lista_de_string ('  Hola  '))
# print (linea_a_lista_de_string ('Hola, me llamo Fran. Soy amigo.')) 

#! OBS -> res, que es la lista de palabras, también tiene strings vacíos '' (ya que
#!        cada vez que la función se cruza con un espacio/punto/coma, 'palabra' queda como
#!        string vacío). No importa, a fines prácticos (es una función auxiliar) me sirve igual.

def cantidad_apariciones (nombre_archivo:str , palabra:str) -> int :
    archivo:typing.IO = open(nombre_archivo,'r') 
    lista_lineas:list[str] = archivo.readlines() 
    archivo.close() 
    apariciones:int = 0 
    for i in range (0,len(lista_lineas),1) :
        palabras_de_linea:list[str] = linea_a_lista_de_string (lista_lineas[i]) 
        for j in range (0,len(palabras_de_linea),1) : 
            if ((palabras_de_linea[j]) == palabra) : 
                apariciones = apariciones + 1 
            else : 
                None 
    return apariciones 

# print (cantidad_apariciones ('Pruebas - Practica 8.txt','avion'))
# print (cantidad_apariciones ('Pruebas - Practica 8.txt','Archivo'))
# print (cantidad_apariciones ('Pruebas - Practica 8.txt','muro'))

#! Esta función NO FUNCIONA cuando PALABRA es una PALABRA CON VOCAL TILDADA.
#! Inicié el Debugger (para ver qué estaba pasando) y noté que cuando define 
#! <palabras_de_linea> las vocales tildadas las manda como caracter con símbolo
#! raro. Y cuando compara, no machea correctamente la vocal tildada con el 
#! caracter trambólico que mandó como vocal tildada (en el paso de definición
#! de <palabras_de_linea>).
#? Misteriosamente, en las compus del los Labos de la Facu sí funciona bien.
#? No sé qué onda.

# Otra forma de resolverlo, considerando PALABRA = conjunto de caracteres (a secas).
def cantidad_apariciones_2 (nombre_archivo:str , palabra: str) : 
    archivo:typing.IO = open(nombre_archivo,'r') 
    apariciones:int = 0 
    lista_lineas:list[str] = archivo.readlines() 
    archivo.close()
    for i in range (0,len(lista_lineas),1) : 
        if (len(lista_lineas[i]) < len(palabra)) : 
            None 
        else : 
            ultimo_indice_a_tomar: int = (len(lista_lineas[i])) - (len (palabra))
            for j in range (0,(ultimo_indice_a_tomar + 1),1) :
                candidato:str = '' 
                for w in range (j,(j + len(palabra)),1) :
                    candidato = candidato + lista_lineas[i][w] 
                if (candidato == palabra) : 
                    apariciones = apariciones + 1 
                else : 
                    None 
    return apariciones


#* Ejercicio 2.
def es_comentario (linea:str) -> bool :
    sin_espacios:str = '' 
    i:int = 0 
    while (i < len(linea)) : 
        if (linea[i] == ' ') : 
            i += 1 
        else : 
            sin_espacios = sin_espacios + linea[i] 
            i += 1
    if (sin_espacios[0] == '#') : 
        return True 
    else : 
        return False 
    
# print (es_comentario ('#esto es un comentario'))
# print (es_comentario ('# esto también es un comentario'))
# print (es_comentario ('       #esto también es un comentario'))
# print (es_comentario ('       # esto también es un comentario'))
# print (es_comentario ('esto NO es un comentario'))
# print (es_comentario ('esto tampoco es #un comentario')) 

def clonar_sin_comentarios (nombre_archivo:str) -> None :
    archivo:typing.IO = open(nombre_archivo,'r') 
    lista_lineas:list[str] = archivo.readlines() 
    archivo.close()
    lista_lineas_no_comentarios:list[str] = [] 
    for i in range (0,len(lista_lineas),1) :
        if ((es_comentario (lista_lineas [i])) == True) : 
            None 
        else : 
            lista_lineas_no_comentarios.append (lista_lineas[i]) 
    archivo2 = open('Copia Sin Comentarios.txt','w') 
    archivo2.writelines(lista_lineas_no_comentarios) 
    archivo2.close()

# clonar_sin_comentarios ('Pruebas - Practica 8.txt') 

def clonar_sin_comentarios_2 (nombre_archivo:str) -> str : 
    archivo:typing.IO = open(nombre_archivo,'r')
    archivo2:typing.IO = open('Copia Sin Comentarios.txt','w')
    lista_de_lineas = archivo.readlines() 
    for i in range (0,len(lista_de_lineas),1) : 
        if (not (es_comentario (lista_de_lineas[i]))) : 
            archivo2.write(lista_de_lineas[i]) 
        else : 
            None 
    archivo.close()
    archivo2.close() 

# Versión 2: escribimos línea por línea (no todas las líneas de un saque, 
# como en el anterior).


#* Ejercicio 3.
def reverso_lista_Strings (s:list[str]) -> list[str] :
    reverso:list[str] = [] 
    for i in range ((len(s)-1),(-1),-1) :
        reverso.append(s[i]) 
    return reverso 

def invertir_lineas (nombre_archivo:str) -> None :
    archivo:typing.IO = open(nombre_archivo,'r') 
    lista_lineas:list[str] = archivo.readlines() 
    archivo.close() 
    reverso_lista_lineas:list[str] = reverso_lista_Strings (lista_lineas) 
    archivo2:typing.IO = open('reverso.txt','w') 
    archivo2.writelines(reverso_lista_lineas) 
    archivo2.close() 

# invertir_lineas ('Pruebas - Practica 8.txt') 

#* Ejercicio 4. 
def agregar_frase_al_final (nombre_archivo:str , frase:str) -> None : 
    archivo:typing.IO = open(nombre_archivo,'r')
    lineas:list[str] = archivo.readlines() 
    archivo.close()
    lineas.append(frase) 
    archivo2:typing.IO = open(nombre_archivo,'w') 
    archivo2.writelines(lineas) 
    archivo2.close() 

# agregar_frase_al_final ('Pruebas - Practica 8.txt','El camino asi es.') 

#* Ejercicio 5. 
def agregar_frase_al_principio (nombre_archivo:str , frase:str) -> None :
    archivo:typing.IO = open(nombre_archivo,'r') 
    lineas:list[str] = archivo.readlines() 
    archivo.close()
    lineas2:list[str] = [frase] 
    i:int = 0 
    while (i < len(lineas)) :
        lineas2.append(lineas[i]) 
        i += 1 
    archivo = open(nombre_archivo,'w') 
    archivo.writelines(lineas2) 
    archivo.close() 

# agregar_frase_al_principio ('Pruebas - Practica 8 (2).txt','El camino así es. ') 


#* Ejercicio 6.
def es_caracter_valido (c:str) -> bool : 
    if (((c >= 'a') and ( c <= 'z')) or ((c >= 'A') and (c <= 'Z')) or ((c >= '0') and (c <= '9')) or (c == ' ') or (c == '_')) : 
        return True 
    else : 
        return False 
    
def listar_palabras_de_archvio (nombre_archivo:str) -> list[str] : 
    archivo:typing.IO = open(nombre_archivo,'b') 
    lista_bytes = archivo.read() 
    archivo.close()
    res:list[str] = []
    palabra_actual:str = ''
    for i in range (0,len(lista_bytes),1) : 
        if (es_caracter_valido (chr(lista_bytes[i]))) : 
            palabra = palabra + chr(lista_bytes[i]) 
        else : 
            if ((len(palabra_actual)) >= 5) :
                res.append(palabra_actual) 
            else : 
                None 
            palabra_actual = '' 
    return res 

#? No sé cómo probar esto. No entiendo qué tipo de archivos debo pasarle.


#* Ejercicio 7.
def pertenece (s:list[str] , e:str) : 
    res = False
    i:int = 0 
    while (i < len(s)) :
        if (s[i] == e) :
            res = True 
            i += 1
        else : 
            i += 1
    return res 

def posicion_de_la_primer_coma (l:str) -> int : 
    i:int = 0 
    while (l[i] != ',') : 
        i += 1 
    return i 

def buscador_alumno (li:str , lu:str) -> bool :
        primer_coma:int = posicion_de_la_primer_coma (li)
        lu_actual:str = '' 
        for i in range (0,primer_coma,1) :  
            if ((li[i]) != ',') : 
                lu_actual = lu_actual + li[i] 
            else : 
                None 
        if (lu_actual == lu) : 
            lu_actual = ''
            return True 
        else : 
            lu_actual = ''
            return False 
        
def nota_de_linea (lin:str) -> float : 
        nota:str =''
        contador_de_comas:int = 0 
        for i in range (0,len(lin),1) : 
            if ((lin[i] == ',') and (contador_de_comas < 3)) : 
                contador_de_comas = contador_de_comas + 1 
            elif (contador_de_comas == 3) : 
                nota = nota + lin[i] 
            elif (lin[i] == '\n') : 
                None 
            else : 
                None 
        return float(nota)

def notas_de_estudiante (lineas:list[str] , lu:str) -> list[float] : 
        notas:list[float] = [] 
        for i in range (0,len(lineas),1) : 
            if ((buscador_alumno (lineas[i],lu)) == True) : 
                notas.append(nota_de_linea(lineas[i]))
            else : 
                None 
        return notas

def promedio_estudiante (nombre_archivo:str , lu:str) -> float : 
    archivo:typing.IO = open(nombre_archivo,'r')
    lineas:list[str] = archivo.readlines() 
    archivo.close()  
    suma_notas:float = 0 
    notas:list[float] = notas_de_estudiante(lineas,lu)
    i:int = 0 
    while (i < len(notas)) :
        suma_notas = suma_notas + notas[i] 
        i += 1 
    promedio:float = suma_notas / len(notas) 
    return promedio

def lista_estudiantes (nombre_archivo:str) -> list[str] : 
    archivo:typing.IO = open(nombre_archivo,'r')
    lineas:list[str] = archivo.readlines() 
    archivo.close()
    lu_estudiantes:list[str] = [] 
    estudiante_actual:str = ''
    for i in range (1,len(lineas),1) : 
        for j in range (0,posicion_de_la_primer_coma(lineas[i]),1) :
            estudiante_actual = estudiante_actual +  lineas[i][j] 
        if ((pertenece (lu_estudiantes,estudiante_actual)) == False) :
            lu_estudiantes.append(estudiante_actual) 
        estudiante_actual = ''
    return lu_estudiantes

def calcular_promedio_por_estudiante (nombre_archivo_notas:str , nombre_archivo_promedios:str) -> None :
    archivo1:typing.IO = open (nombre_archivo_notas,'r')
    lineas_notas:list[str] = archivo1.readlines() 
    archivo1.close() 

    lista_de_estudiantes:list[str] = lista_estudiantes (nombre_archivo_notas)
    promedios:list[float] = [] 
    for i in range (0,len(lista_de_estudiantes),1) :
        promedios.append(promedio_estudiante (nombre_archivo_notas,lista_de_estudiantes[i])) 
    
    lista_escritura:list[str] = ['LU de alumno,Promedio de Notas de la Carrera\n']
    for i in range (0,len(promedios),1) : 
        lista_escritura.append (str(str(lista_de_estudiantes[i]))+','+(str(promedios[i]))+'\n') 
    
    archivo2:typing.IO = open (nombre_archivo_promedios,'w')
    archivo2.writelines(lista_escritura)
    archivo2.close()

# calcular_promedio_por_estudiante ('Ejercicio 7 - Practica 8.csv','Ejercicio 7 - Practica 8 (2).csv') 

# Tres horas estuve diseñando esto, estoy explotado. Pero funciona como quiero :) (capaz no entendí bien
# la consigna y no funciona como debe, PERO SI COMO QUIERO).


#* Ejercicio 8. 
def generar_nros_al_azar (cantidad:int , desde:int , hasta:int) -> Pila[int] :
    p:Pila[int] = Pila() 
    i:int = 1 
    while (i <= cantidad) : 
        numero:int = random.randint(desde,hasta) 
        p.put(numero) 
        i += 1
    # print (p.queue)  --> para verificar quién es la pila 'p'.
    return p 

# print (generar_nros_al_azar (3,0,8)) 
# print (generar_nros_al_azar (5,-8,7))


#* Ejercicio 9. 
def cantidad_elementos (p:Pila) -> int : 
    elementos:list = [] 
    while ((p.empty()) == False) : 
        elementos.append(p.get()) 
    cantidad:int = len(elementos) 
    for i in range (((len(elementos))-1),-1,-1) : 
        p.put(elementos[i]) 
    print(p.queue)
    return cantidad 

# p_vacía = Pila() 
# p_con_cosas = Pila()
# p_con_cosas.put(_)
# p_con_cosas.put(_)
# p_con_cosas.put(_)
# print (cantidad_elementos(p_vacía))
# # print (cantidad_elementos(p_con_cosas)) 


#* Ejercicio 10.
def buscar_el_maximo (p:Pila[int]) -> int :
    elementos:list[int] = [] 
    maximo:int = p.get()
    elementos.append(maximo) 
    while ((p.empty()) == False) : 
        candidato:int = p.get()
        if (maximo <= candidato) : 
            maximo = candidato 
            elementos.append(maximo)  
        else : 
            elementos.append(candidato) 
    for i in range (((len(elementos))-1),-1,-1) :
        p.put(elementos[i]) 
    print (p.queue)
    return maximo 

# p = Pila()
# p.put(_)
# p.put(_)
# p.put(_)
# print (buscar_el_maximo(p)) 


#* Ejercicio 11.
def esta_bien_balanceada (s:str) -> bool :
    p:Pila[str] = Pila() 
    i:int = 0 
    while (i < len(s)) :
        if (s[i] == '(') : 
            p.put(s[i]) 
            i += 1
        elif (s[i] == ')') :
            if (not (p.empty())) : 
                p.get()
                i += 1 
            else : 
                return False 
        else : 
            i += 1 
    if (p.empty()) : 
        return True 
    else : 
        return False 

# print (esta_bien_balanceada ('1 + ( 2 x 3 - ( 2 0 / 5 ) )')) 
# print (esta_bien_balanceada ('10 * ( 1 + ( 2 * ( -1)))'))
# print (esta_bien_balanceada ('1 + ) 2 x 3 ( ( )'))  
# print (esta_bien_balanceada (' 2 ) + 8 ) + (4 * 3) - ( (8 + 8) ())))')) 

# El algoritmo consiste en: andá recorriendo el string; cada vez que te encontres un 
# '(', metelo en la pila; cada vez que te encontres un ')', sacá un elemento de la pila;
# si está bien balanceada, por cada vez que cierro con ')', tuve que haber abierto antes '('.
# Por eso, al final, si está bien balanceada, la pila debe estar vacía (ya que por cada vez
# que cerré un paréntesis, saqué de la pila su correspondiente abertura). Si no, está
# desbalanceada, ya que estoy abriendo de más (la pila le quedaron elementos) o cerrando
# de más (llegué a un ')' y la pila no tiene elemento para darme).

#* Ejercicio 12.
def divisor_de_expresion (s:str) -> list[str] :
    tokens:list[str] = [] 
    ascensor:str = ''
    for i in range (0,len(s),1) :
        if (s[i] != ' ') :
            ascensor = ascensor + s[i]
        else :
            tokens.append(ascensor)
            ascensor = ''
    if (s[len(s)-1] != ' ') :
        tokens.append(ascensor) 
    else :
        None 
    return tokens 

# print (divisor_de_expresion ("3 4 + 5 * 2 -"))
# print (divisor_de_expresion ('10 5 /'))

# OBS -> Tuve que añadir ese último "if" para la última posición de [s] porque
#        sino no metía en [tokens] el último elemento de [s].   

def evaluar_expresion (s:str) -> float :
    p:Pila[str] = Pila() 
    tokens:list[str] = divisor_de_expresion(s)
    for i in range (0,len(tokens),1) : 
        if ((tokens[i] != '+') and (tokens[i] != '-') and (tokens[i] != '*') and (tokens[i] != '/')) :
            p.put(tokens[i])
        else: 
            if (tokens[i] == '+') : 
                operando1:float = float(p.get()) 
                operando2:float = float(p.get()) 
                resultado:float = operando2 + operando1 
                p.put(resultado) 
            elif (tokens[i] == '-') : 
                operando1:float = float(p.get()) 
                operando2:float = float(p.get()) 
                resultado:float = operando2 - operando1 
                p.put(resultado)
            elif (tokens[i] == '*') : 
                operando1:float = float(p.get()) 
                operando2:float = float(p.get()) 
                resultado:float = operando2 * operando1 
                p.put(resultado)
            elif (tokens[i] == '/') : 
                operando1:float = float(p.get()) 
                operando2:float = float(p.get()) 
                resultado:float = operando2 / operando1 
                p.put(resultado)
    resultado_final:float = p.get() 
    return resultado_final 

# print (evaluar_expresion ("3 4 + 5 * 2 -"))
# print (evaluar_expresion ("10 5 /"))


#* Ejercicio 13.
def generar_nros_al_azar_2 (cantidad:int , desde:int , hasta:int) -> Cola[int] :
    c:Cola[int] = Cola() 
    i:int = 0 
    while (i < cantidad) : 
        numero:int = random.randint (desde,hasta) 
        c.put(numero) 
        i = i + 1 
    # print(c.queue)  --> para verificar quién es la cola 'c'.
    return c

# print (generar_nros_al_azar_2 (5,0,10))
# print (generar_nros_al_azar_2 (0,7,1048))
# print (generar_nros_al_azar_2 (2,-5,0))
# print (generar_nros_al_azar_2 (10,-25,10)) 


#* Ejercicio 14. 
def cantidad_elementos_2 (c:Cola) -> int : 
    elementos:list = [] 
    while (c.empty() == False) :
        elem = c.get() 
        elementos.append(elem) 
    res = len(elementos) 

    for i in range (0,len(elementos),1) :
        c.put(elementos[i]) 
    
    # print (c.queue)  --> para verificar que volví a construir bien la Cola (dato de tipo IN).
    return res 

# c_vacia = Cola() 
# c_con_cosas = Cola() 
# c_con_cosas.put(_) 
# c_con_cosas.put(_)
# c_con_cosas.put(_)
# c_con_cosas.put(_)
# c_con_cosas.put(_)
# c_con_cosas.put(_) 
# print (cantidad_elementos_2 (c_vacia))
# print (cantidad_elementos_2 (c_con_cosas)) 

# La diferencia principal con la "cantidad_elementos" hecha en el Ejercicio 9 es la reconstrucción
# del dato de entrada (IN). En la función "cantidad_elementos" es una PILA, por lo que voy a ir 
# reconstruyendola insertando los elementos de [elementos] desde el último hacia el primero.
# En este caso, al ser una COLA, para reconstruir debo ir insertando los elementos de [elementos]
# desde el primero hacia el último.


#* Ejercicio 15. 
def buscar_el_maximo_2 (c:Cola[int]) -> int :
    elementos:list[int] = [] 
    maximo:int = c.get() 
    elementos.append(maximo)

    while (c.empty() == False) : 
        candidato = c.get()
        elementos.append(candidato) 
        if (maximo < candidato) : 
            maximo = candidato 
        else : 
            None 
    
    for i in range (0,len(elementos),1) :
        c.put(elementos[i]) 

    print (c.queue) 
    return maximo 

# c_con_cosas = Cola() 
# c_con_cosas.put(_) 
# c_con_cosas.put(_)
# c_con_cosas.put(_)
# c_con_cosas.put(_)
# c_con_cosas.put(_)
# c_con_cosas.put(_) 
# print (buscar_el_maximo_2 (c_con_cosas))

# Si comparo esta implementación con la hecha en el Ejercicio 10, la parte que busca el máximo
# es lo mismo; cambia la parte en la que reconstruyo el dato de entrada (como en el ejercicio 
# anterior). 


#* Ejercicio 16.
def pertenece_ints (e:int , s:list[int]) : 
    res:bool = False
    i:int = 0 
    while (i < len(s)) : 
        if (s[i] == e) :
            res = True 
            i += 1 
        else : 
            i += 1 
    return res 

def armar_secuencia_de_bingo () -> Cola[int] : 
    numeros_0_a_99:list[int] = [] 
    i:int = 0 
    while (i <= 99) :
        numeros_0_a_99.append(i) 
        i += 1 
    
    random.shuffle(numeros_0_a_99)   # Tomo la lista y la desordeno al azar.

    secuencia:Cola[int] = Cola() 
    for i in range (0,len(numeros_0_a_99),1) : 
        secuencia.put(numeros_0_a_99[i]) 
    return secuencia 

# OBS --> 'random.shuffle(lista)' recibe una lista y permuta sus elementos al azar.

def jugar_carton_de_bingo (carton:list[int] , bolillero:Cola[int]) -> int : 
    numeros_carton_tachados:int = len(carton) 
    jugadas:int = 0 
    reconstructor:list[int] = [] 

    while (numeros_carton_tachados > 0) : 
        bolilla:int = bolillero.get()
        reconstructor.append(bolilla) 
        jugadas = jugadas + 1
        if (pertenece_ints (bolilla,carton)) :
            numeros_carton_tachados = numeros_carton_tachados - 1  
    
    while (not (bolillero.empty())) : 
        bolilla:int = bolillero.get() 
        reconstructor.append(bolilla)
    
    for i in range (0,len(reconstructor),1) :
        bolillero.put(reconstructor[i]) 
    
    print(bolillero.queue)
    return jugadas 

# print (jugar_carton_de_bingo ([0,1,2,3,4,5,6,7,8,9,10,11],armar_secuencia_de_bingo ())) 


#* Ejercicio 17. 
def n_pacientes_urgentes (c:Cola[(int,str,str)]) -> int : 
    reconstuctor:list[(int,str,str)] = [] 
    res:int = 0

    while (not (c.empty())) :
        paciente_actual:tuple[int,str,str] = c.get() 
        reconstuctor.append(paciente_actual) 
        if (pertenece_ints (paciente_actual[0],[1,2,3])) : 
            res += 1 
    
    for i in range (0,len(reconstuctor),1) : 
        c.put(reconstuctor[i]) 
 
    return res 

# pacientes:Cola[(int,str,str)] = Cola() 
# pacientes.put((5,'Juan','Guardia'))
# pacientes.put((6,'Maria','Guardia'))
# pacientes.put((2,'Pedro','Pedia'))
# pacientes.put((8,'Fran','Pedia'))
# pacientes.put((3,'Carlos','Trauma'))
# pacientes.put((1,'Fiore','Cardio'))
# pacientes.put((4,'Fede','Gastro'))
# pacientes.put((1,'Walter','Trauma')) 
# print (n_pacientes_urgentes (pacientes))


#* Ejercicio 18.
def atencion_a_clientes (c:Cola[(str,int,bool,bool)]) -> Cola[(str,int,bool,bool)] :
    reconstructor: list[(str,int,bool,bool)] = []
    prioritarios_grupo_selecto:list[(str,int,bool,bool)] = []
    prioritarios_cuenta_preferencial: list[(str,int,bool,bool)] = []
    clientes_comunes:list[(str,int,bool,bool)] = [] 
    res:Cola[(str,int,bool,bool)] = Cola() 

    while (not (c.empty())) : 
        cliente_actual:tuple[str,int,bool,bool] = c.get()
        reconstructor.append(cliente_actual) 
        if (cliente_actual[3] == True) :
            prioritarios_grupo_selecto.append(cliente_actual) 
        elif (cliente_actual[2] == True) :
            prioritarios_cuenta_preferencial.append(cliente_actual) 
        else : 
            clientes_comunes.append(cliente_actual) 

    for i in range (0,len(prioritarios_grupo_selecto),1) : 
        res.put(prioritarios_grupo_selecto[i]) 

    for i in range (0,len(prioritarios_cuenta_preferencial),1) : 
        res.put(prioritarios_cuenta_preferencial[i]) 

    for i in range (0,len(clientes_comunes),1) : 
        res.put(clientes_comunes[i]) 
    
    for i in range (0,len(reconstructor),1) :
        c.put(reconstructor[i])
    
    return res 

# llegada_banco:Cola[(str,int,bool,bool)] = Cola()
# llegada_banco.put(('Juan',45,False,False)) 
# llegada_banco.put(('Maria',43,True,False))
# llegada_banco.put(('Pepe',25,False,True))
# llegada_banco.put(('Carla',36,True,True)) 
# llegada_banco.put(('July',25,True,False))
# llegada_banco.put(('Sofi',20,False,True))
# llegada_banco.put(('Juan',40,False,False))
# llegada_banco.put(('Vale',36,False,False))
# llegada_banco.put(('Fede',47,False,True))
# llegada_banco.put(('Lucas',39,True,True))
# llegada_banco.put(('Rodri',35,False,True)) 
# print (atencion_a_clientes (llegada_banco)) 


#* Ejercicio .