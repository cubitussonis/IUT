# -*- coding: utf-8 -*-

"""
TP 1 : integration numerique
Marius Longeanie 
Groupe : A1

"""

import math

def cube(x):
    return x*x*x

def unsurx(x):
    return 1/x

def pi(x):
    return math.sqrt(4-x**2)

def rect(f,a,b,n):
    h = (b-a)/n
    i=0
    sumAire = 0
    for i in range(n):
        sumAire = sumAire + (h*f(a+(i*h)))
    
    return sumAire

print("rectangle")
print("f(x^3)")
print("n = 10  => " + str(rect(cube,0,1,10)))
print("n = 100  => " + str(rect(cube,0,1,100)))
print("n = 1000  => " + str(rect(cube,0,1,1000)))
print("cos(x)")
print("n = 10  => " + str(rect(math.cos,0,1,10)))
print("n = 100  => " + str(rect(math.cos,0,1,100)))
print("n = 1000 => " + str(rect(math.cos,0,1,1000)))

def trap(f,a,b,n):
    h = (b-a)/n
    i=0
    sumAire = 0
    for i in range(n):
        sumAire = sumAire + (h*f(a+(i*h))) + abs(((f(a+((i+1)*h)) -f(a+(i*h)))*h)/2)
    
    return sumAire


print()
print("tramsimpsonpeze")
print("f(x^3)")
print("n = 10  => " + str(trap(cube,0,1,10)))
print("n = 100  => " + str(trap(cube,0,1,100)))
print("n = 1000  => " + str(trap(cube,0,1,1000)))
print("cos(x)")
print("n = 10  => " + str(trap(math.cos,0,1,10)))
print("n = 100  => " + str(trap(math.cos,0,1,100)))
print("n = 1000 => " + str(trap(math.cos,0,1,1000)))



def simpson(f,a,b,n):
    h = (b-a)/(n)
    i=0
    sumAire = 0
    for i in range(n):
        k = a+(i*h)
        k1 = a+((i+1)*h)
        sumAire = sumAire + (b-a)/(6*n) *(f(k) + 4*f((k+k1)/2) + f(k1))
    
    return sumAire

print()
print("simpson")
print("f(x^3)")
print("n = 10  => " + str(simpson(cube,0,1,10)))
print("n = 100  => " + str(simpson(cube,0,1,100)))
print("n = 1000  => " + str(simpson(cube,0,1,1000)))
print("cos(x)")
print("n = 10  => " + str(simpson(math.cos,0,1,10)))
print("n = 100  => " + str(simpson(math.cos,0,1,100)))
print("n = 1000 => " + str(simpson(math.cos,0,1,1000)))



print()
print("trouver ln(2) avec f(x) = 1/x ")
print("n = 10  => " + str(simpson(unsurx,1,2,10)))
print("n = 21  => " + str(simpson(unsurx,1,2,21)))
print("n = 22 => " + str(simpson(unsurx,1,2,22)))
print("n = 1000  => " + str(simpson(unsurx,1,2,1000)))

print("c'est a partir de 22 iterations que l'on trouve ln(2) a 10^-8 avec la methode de simpson ")


print()
print("trouver pi avec f(x) = sqrt(4-x**2) ")
print("n = 10  => " + str(simpson(pi,0,2,10)))
print("n = 100  => " + str(simpson(pi,0,2,100)))
print("n = 1000 => " + str(simpson(pi,0,2,1000)))
print("n = 1000000  => " + str(simpson(pi,0,2,1000000)))

print("c'est a partir de 1000000 iterations que l'on trouve pi a 10^-8 avec la methode de simpson")