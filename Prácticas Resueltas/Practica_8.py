# Práctica 8 - Archivos, Pilas, Colas y Diccionarios.


print ('Práctica 8')
print ('Ejercicio ')

#* Ejercicio 1.

# 1.1 
def contar_lineas (nombre_archivo:str) -> int : 
    archivo = open (nombre_archivo,'r') 
    lista_lineas:list[str] = archivo.readlines() 
    archivo.close() 
    return len(lista_lineas) 

# print (contar_lineas ('Pruebas Practica 8.txt')) 

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
    archivo = open(nombre_archivo,'r') 
    lista_lineas:list[str] = archivo.readlines() 
    archivo.close() 
    res:bool = False 
    for i in range (0,len(lista_lineas),1) : 
        if ((palabra_contenida (palabra,lista_lineas[i])) == True) : 
            res = True 
        else : 
            None 
    return res 

# print (existe_palabra ('avion','Pruebas Practica 8.txt'))
# print (existe_palabra ('refieren','Pruebas Practica 8.txt')) 
# print (existe_palabra (',','Pruebas Practica 8.txt'))

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
    archivo = open(nombre_archivo,'r') 
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

# print (cantidad_apariciones ('Pruebas Practica 8.txt','avion'))
# print (cantidad_apariciones ('Pruebas.txt','Archivo'))
# print (cantidad_apariciones ('Pruebas.txt','muro'))

#! Esta función NO FUNCIONA cuando PALABRA es una PALABRA CON VOCAL TILDADA.
#! Inicié el Debugger (para ver qué estaba pasando) y noté que cuando define 
#! <palabras_de_linea> las vocales tildadas las manda como caracter con símbolo
#! raro. Y cuando compara, no machea correctamente la vocal tildada con el 
#! caracter trambólico que mandó como vocal tildada (en el paso de definición
#! de <palabras_de_linea>).

# Otra forma de resolverlo, considerando PALABRA = conjunto de caracteres (a secas).
def cantidad_apariciones_2 (nombre_archivo:str , palabra: str) : 
    archivo = open(nombre_archivo,'r') 
    apariciones:int = 0 
    lista_lineas:list[str] = archivo.readlines() 
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
    archivo = open(nombre_archivo,'r') 
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

# clonar_sin_comentarios ('Pruebas Practica 8.txt') 

def clonar_sin_comentarios_2 (nombre_archivo:str) -> str : 
    archivo = open(nombre_archivo,'r')
    archivo2 = open('Copia Sin Comentarios.txt','w')
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
    archivo = open(nombre_archivo,'r') 
    lista_lineas:list[str] = archivo.readlines() 
    archivo.close() 
    reverso_lista_lineas:list[str] = reverso_lista_Strings (lista_lineas) 
    archivo2 = open('reverso.txt','w') 
    archivo2.writelines(reverso_lista_lineas) 
    archivo2.close() 

# invertir_lineas ('Pruebas Practica 8.txt') 

#* Ejercicio 4. 
def agregar_frase_al_final (nombre_archivo:str , frase:str) -> None : 
    archivo = open(nombre_archivo,'r')
    lineas:list[str] = archivo.readlines() 
    archivo.close()
    lineas.append(frase) 
    archivo2 = open(nombre_archivo,'w') 
    archivo2.writelines(lineas) 
    archivo2.close() 

# agregar_frase_al_final ('Pruebas Práctica 8.txt','El camino asi es.') 

#* Ejercicio 5. 
def agregar_frase_al_principio (nombre_archivo:str , frase:str) -> None :
    archivo = open(nombre_archivo,'r') 
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

# agregar_frase_al_principio ('Pruebas Práctica 8 (2).txt','El camino así es. ') 


#* Ejercicio 6.
def es_caracter_valido (c:str) -> bool : 
    if (((c >= 'a') and ( c <= 'z')) or ((c >= 'A') and (c <= 'Z')) or ((c >= '0') and (c <= '9')) or (c == ' ') or (c == '_')) : 
        return True 
    else : 
        return False 
    
def listar_palabras_de_archvio (nombre_archivo:str) -> list[str] : 
    archivo = open(nombre_archivo,'b') 
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