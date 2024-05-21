# Práctica 6.
## Ejercicio 8 y Ejercicicio 9.


### Ejercicio 8.

#### 8.1 

x = 5 , y = 7
* Estado a.

x = x + y 
* Estado b.
* vale x == x@a + y@a  --> x == 5 + 7

#### 8.2

x = 5   y = 7 
* Estado a.

z = x + y 
* Estado b.
* vale z == x@a + y@a  --> z = 5 + 7 

y = z * 2
* Estado c.
* vale y@c == z@b * 2  --> y = (5 + 7) * 2

#### 8.3

x = 5   y = 7 
* Estado a.

x = "hora"
* Estado b.
* vale x != x@a  --> x = "hora"
* vale tipo (x@b) != tipo (x@a)  --> tipo (x) = String 

y = x * 2 
* Estado c.
* vale y == x@b * 2  --> y = "hora" * 2

#### 8.4

x = False 
* Estado a.

res = not (x) 
* Estado b.
* vale res == - x@a  --> res = True

#### 8.5 

x = False
* Estado a. 

x = not (x) 
* Estado b.
* vale x == - x@a  --> x = True

#### 8.6

x = True   Y = False
* Estado a.

res = x and y 
* Estado b.
* vale res == x@a && y@a  --> res = True && False 

x = res and x 
* Estado c.
* vale x == res@b && x@a  --> x = True && False && True


### Ejercicio 9.

#### 9.1 

Primera evaluación de ro(1) --> 2 
* En Return --> g = 1 // x = 1 

Segunda evaluación de ro(1) --> 3 
* En Return --> g = 2 // x = 1

Tercera evalción de ro(1) --> 4 
* En Return --> g = 3 // x = 1 

La variable g está definida como Valiable Global, al momento de ejecutar esta función (está "mas arriba" que ro, en el código). 
Ahora, la función llama a esa variable g global y la modifica. 
Por lo tanto, con cada ejecución de ro, g va ir cambaiando de estado y valor. 

#### 9.2 

Primera evaluación de rt(1,0) --> 2 
* En Return --> g = 0 // x = 1

Segunda evaluación de rt(1,0) --> 2 
* En Return --> g = 0 // x = 1 

Tercera evaluación de rt(1,0) --> 2 
* En Return --> g = 0 // x = 1 

En esta función, ambas variables son Variables Locales. 
Por lo que su mofificación tiene sólo alcanse en la propia función; al finalizar la función, "desaparecen". 
Por esto, cada ejecución de rt es independiente al anterior. 
Y como siempre estoy pasandole los mismos valores a las variables (locales), siempre da el mismo resultado (en todas las ejecucuiones). 

#### 9.3 

##### def rt (x:int, g:int) -> int :
* Estado a.

g = g + 1
* Estado b.
* g = g@a + 1 

return x + g 
* Estado c.
* return = x@a + g@b 

##### def ro (x:int) -> int : 
* Estado a.

global g 
* Estado b.
* g = valor definido en Estado Definición g.

g = g + 1 
* Estado c.
* g = g@b + 1 
* g es re-asignada globalmente.

return x + g 
* Estado d.
* return = x@a + g@c 

#### 9.4 

**problema** rt (in x:int , inout g:int) -> int :  
requiere: { True }  
asegura: { g = g@entrada + 1 }  
asegura: { res = x + g } 

**problema** ro (in x:int) -> int :  
requiere: { True }  
requiere: { variable global g definida previamente }  
asegura: { g = g@global + 1 }  
asegura: { res = x + g }

