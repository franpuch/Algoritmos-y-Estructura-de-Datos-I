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


