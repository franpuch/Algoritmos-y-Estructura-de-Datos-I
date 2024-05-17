# Práctica 6 - Introducción a Lenguaje Imperativo.

import math 
# Importo la librería con funciones y constantes matemáticas. 

#* Ejercicio 1. 

print ("\nEjercicio 1 \n")  # Para que los test no me salga todo junto y sea un lío en terminal.

# 1.1 

def imprimirHolaMundo () -> None : 
    print ("¡Hola Mundo!") 

imprimirHolaMundo () # Antes definí la función, ahora la llamo (para que se ejecute).

# 1.2 

def imprimirUnVerso () -> None :
    print ("Verso 1 \nVerso 2 \nVerso 3") 

imprimirUnVerso () # Antes definí la función, ahora la llamo (para que se ejecute).

# 1.3

def raizDe2 () -> None : 
    print (round (math.sqrt (2),2)) 

raizDe2 ()  # Antes definí la función, ahora la llamo (para que se ejecute).

# 1.4 

def factorial_de_dos () :
    print (math.factorial (2)) 

factorial_de_dos ()  # Antes definí la función, ahora la llamo (para que se ejecute).  

# 1.5 

def perimetro () : 
    res = 2 * math.pi 
    print (res) 

perimetro ()  # Antes definí la función, ahora la llamo (para que se ejecute).


#* Ejercicio 2.

print ("\nEjercicio 2 \n")  # Para que los test no me salga todo junto y sea un lío en terminal.

# 2.1 

def imprimir_saludo (nombre:str) -> str : 
    print ("Hola " + nombre) 

imprimir_saludo ("Juan")  # Antes definí la función, ahora la llamo (para que se ejecute).

# 2.2 

def raizCuadradaDe (n:int) -> float : 
    return round (math.sqrt (n),2) 

# No llamo la función, no quiero que se imprima en la terminal. Abro el intérprete y
# la llamo particularmente con algún ejemplo (por eso le incluyo la instrucción 
# "return", para que tenga que devolver un resultado). 

# 2.3 

def fahrenheit_a_celsius (temp_far:float) -> float :
    return round (((temp_far - 32) * 5) / (9),2)     

# No llamo la función, no quiero que se imprima en la terminal. Abro el intérprete y
# la llamo particularmente con algún ejemplo (por eso le incluyo la instrucción 
# "return", para que tenga que devolver un resultado). 

# 2.4 

def ImprimirDosVeces (estribillo:str) -> str : 
    print ((estribillo) * 2) 

ImprimirDosVeces ("Verso 1 \nVerso 2 \nVerso 3 \nVerso 4 \n") 

# Al final del llamado de la función, le pongo un "\n" para que la segunda impresión
# la haga debajo.

# 2.5

def es_multiplo_de (n:int , m:int) -> bool : 
    return n % m == 0 

print (es_multiplo_de (25,5)) 
print (es_multiplo_de (19,10))  

# 2.6 

def es_par (n:int) -> bool : 
    return es_multiplo_de (n,2) 

print (es_par (8)) 
print (es_par (23)) 

# 2.7 

def cantidadDePizzas (comensales:int , min_cant_de_porciones:int) -> int : 
    cant_de_pizzas = (comensales * min_cant_de_porciones) // 7 
    return cant_de_pizzas 

# Prefiero que me sobren porciones; para eso, considero que
# cada pizza tiene 7 porciones y de esa forma siempre voy a estar añadiendo una pizza mas.

print (cantidadDePizzas (20 , 3))


#* Ejercicio 3.

print ("\nEjercicio 3 \n")  # Para que los test no me salga todo junto y sea un lío en terminal.

# 3.1 

def alguno_es_0 (n:int , m:int) -> bool : 
    return (n == 0) or (m == 0) 

print (alguno_es_0 (0,0))
print (alguno_es_0 (5,10))  
print (alguno_es_0 (0,2)) 
print (alguno_es_0 (5,0))  

# 3.2 

def ambos_son_0 (n:int , m:int) -> bool : 
    return (n == 0) and (m == 0) 

print (ambos_son_0 (0,0)) 
print (ambos_son_0 (0,8))
print (ambos_son_0 (9,0)) 
print (ambos_son_0 (25,874)) 

# 3.3 

def esNombreLargo (nombre:str) -> bool : 
    return (len(nombre) >= 3) and (len(nombre) <= 8) 

print (esNombreLargo ("Lucianardo"))
print (esNombreLargo ("Xd")) 
print (esNombreLargo ("Fran"))  

# 3.4 

def es_bisiesto (a:int) -> bool : 
    res = (es_multiplo_de (a,400)) or ((es_multiplo_de (a,4)) and (not (es_multiplo_de (a,100))))
    return res 

# No llamo la función, no quiero que se imprima en la terminal. Abro el intérprete y
# la llamo particularmente con algún ejemplo.


#* Ejercicio 4. 

print ("\nEjercicio 4 \n")  # Para que los test no me salga todo junto y sea un lío en terminal.

def peso_pino (altura:int) -> int :
    if (altura <= 3) : 
        return altura * 100 * 3 
    else : 
        return 900 + ((altura - 3) * 100 * 2) 
    
# Si el pino mide menos/igual a 3 metros, paso a centímetros (la altura) y lo 
# multiplico por 3 (ya que son 3 kg por centímetro).
# Cuando la altura es mayor a 3 metros, voy a sumar 900 (peso de los primeros 3 metros)
# con el peso del cacho que queda (altura - 3 metro) (que se calcula de la otra
# forma). 

def es_peso_util (peso:int) -> bool : 
    if ((peso >= 400) and (peso <= 1000)) : 
        return True 
    else : 
        return False 
    
print (es_peso_util (400))  # TestOutput True.
print (es_peso_util (700))  # TestOutput True.
print (es_peso_util (1000)) # TestOutput True.
print (es_peso_util (184))  # TestOutput False.
print (es_peso_util (1745)) # TestOutput False.

def sirve_pino (altura:int) -> bool : 
    if ((es_peso_util (peso_pino (altura))) == True) : 
        return True 
    else :
        return False 

print (sirve_pino (2))   # TestOutput True.
print (sirve_pino (5))   # TestOutput False. 


#* Ejercicio 5.

print ("\nEjercicio 5 \n")  # Para que los test no me salga todo junto y sea un lío en terminal.

# 5.1 

def devolver_el_doble_si_es_par (n:int) -> int : 
    if (es_par (n)) : 
        return 2 * n 
    else : 
        return n 
    
# En el Lenguaje de Especificación, "n" es una variable inout. Ya que me importa su valor de 
# entrada, lo modifico (o no) y lo devuelvo como resultado.

print (devolver_el_doble_si_es_par (26))  # TestOutput 52 
print (devolver_el_doble_si_es_par (0))   # TestOutput 0
print (devolver_el_doble_si_es_par (7))   # TestOutput 7 

# 5.2

def devolver_el_valor_si_es_par_sino_el_que_sigue (n:int) -> int : 
    if (es_par (n)) : 
        return n 
    else : 
        return n + 1 
    
# En el Lenguaje de Especificación, "n" es una variable inout. Ya que me importa su valor de 
# entrada, lo modifico (o no) y lo devuelvo como resultado.

print (devolver_el_valor_si_es_par_sino_el_que_sigue (88))  # TestOutput 88
print (devolver_el_valor_si_es_par_sino_el_que_sigue (0))   # TestOutput 0
print (devolver_el_valor_si_es_par_sino_el_que_sigue (107)) # TestOutput 108 

# 5.3 

def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(n:int) -> int : 
    if (es_multiplo_de (n,9)) : 
        return 3 * n 
    elif (es_multiplo_de (n,3)) : 
        return 2 * n 
    else : 
        return n 

# Primero atajo el caso que sea múltiplo de 9. Ya que si ubico primero la condición de ser
# multiplo de 3, como ser multiplo de 9 es ser múltiplo de 3, nunca va a entrar por múltiplo 
# de 9 (porque lo ataja primero "mutiplo de 3").

print (devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9 (18))   # TestOutput 54
print (devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9 (33))   # TestOutput 66
print (devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9 (5))    # TestOutput 5
print (devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9 (107))  # TestOutput 107
print (devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9 (0))    # TestOutput 0

# 5.4 

def lindo_nombre (nombre: str) -> None :
    if (len(nombre) >= 5) : 
        return print ("Tu nombre tiene muchas letras!") 
    else :
        return print ("Tu nombre tiene menos de 5 caracteres.") 
    
lindo_nombre ("Francisco") 
lindo_nombre ("Sofía") 
lindo_nombre ("Sol") 
lindo_nombre ("") 

# 5.5 

def elRango (n:int) -> None : 
    if (n < 5) : 
        return print ("Menor a 5") 
    elif ((n >= 10) and (n <= 20)) :
        return print ("Entre 10 y 20") 
    elif (n > 20) : 
        return print ("Mayor a 20") 
    else : 
        return None 

# Elijo que, si el número está entre 5 y 10, la función no imprima ni haga nada.
# La especificación no me indica qué hacer en ese caso.

elRango (-4) 
elRango (0) 
elRango (15) 
elRango (78) 
elRango (7) 

# 5.6 

def chamba (sexo: str , edad: int) -> None : 
    if (edad < 18) : 
        return print ("Andá de vacaciones.") 
    elif (sexo == "F") and (edad > 60) : 
        return print ("Andá de vacaciones.") 
    elif (sexo == "M") and (edad > 65) : 
        return print ("Andá de vacaciones.") 
    else : 
        return print ("Te toca trabajar.") 

# Por especificación, "sexo" puede ser F o M (no me ocupo del caso en que se ingrese otra
# letra). 

chamba ("X",15) 
chamba ("F",64) 
chamba ("F",25) 
chamba ("M",74) 
chamba ("M",22) 


#* Ejercicio 6.

print ("\nEjercicio 5 \n")  # Para que los test no me salga todo junto y sea un lío en terminal.

# 6.1 

def numeros_1_al_10 () :
    i:int = 1 
    while (i != 11) : 
        print (i) 
        i += 1

numeros_1_al_10 () 

# En la condición del "while" establezco el límite en 10 ya que la resticción es exclusive.

# 6.2 

def pares_entre_10_y_40 () : 
    i:int = 10 
    while (i < 41) : 
        print (i) 
        i += 2 

pares_entre_10_y_40 () 

# Establezco el límite del "while" en 41 para que el 40 me lo incluya en la impresión. 

# 6.3 

def imprimir_eco () : 
    i:int = 1 
    while (i < 11) : 
        print ("eco ") 
        i += 1

imprimir_eco () 

# 6.4

def lanzamiento (n:int) -> None : 
   while (n != 0) : 
       print (n) 
       n -= 1 
   print ("Despegue!") 

lanzamiento (15)   

# 6.5 

def monitoreo_viaje (p:int , a:int) -> None : 
    while (p != a) :
        print ("Viajó un año al pasado, estamos en el año: ",(p - 1)) 
        p -= 1 
    print ("Finalizó el viaje, estamos en el año: ",a)  

monitoreo_viaje (2024 , 2017) 

# 6.6 

def monitoreo_viaje_2 (p:int) -> None : 
    while ( p > (-384)) : 
        print ("Viajó 20 años al pasado, estamos en el año: " + str(p - 20)) 
        p -= 20 
    if (p == -384) : 
        return print ("Fin del viaje. Llegó al año: " + str (-p) + " aC")
    else : 
        print ("Fin del viaje. Llegó al año: " + str(-p - 20) + " aC")

# Quiero llegar lo mas cercano al año "384 aC" (en cuentas, el -384). Mientas "p" sea mayor a 
# -384, voy a ir restando 20 e imprimiendo el "texto" + "p".
# Cuando "p" deje de cumplir la condición del "while", voy a tener dos casos:
#                        1) "p = -384" --> imprimo el "texto" + "p" positivo + "aC"
#                        2) "(p - 20) se pasa de -384"  --> como no quiero pasarme de -384, le
#                            cambio el signo a "p" (para que quede positivo y sea coherente
#                            con la sigla "aC") y le resto esos 20 años de más que me pasé.
#                            Quedando el valor lo mas cercano a 384 aC que llegué.          

monitoreo_viaje_2 (-304)  # Este llega a 384 aC.
monitoreo_viaje_2 (-307)  # Este no llega a 384 aC, se queda antes. 

