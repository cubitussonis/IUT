#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
TP 3
Marius Longeanie 
Groupe : A1

"""


from math import sqrt, exp, sin		
import random	



def findPi(N):
    c = 0			
    
    for i in range(N):
    	x = random.random()		
    	y = random.random()		
    	r = sqrt(x**2+y**2)	
    	if r <= 1:		
    		c=c+1
    
    return  4*c / N

#print("Pi = %f" % findPi(100000))


def integralexp(N):
    c = 0
    for i in range(N):
        x = random.random()		
        y = random.uniform(0,exp(1))
        if(exp(x) <= y):
            c=c+1

    return ((N-c)/N)*exp(1)


def funcMax(func,a,b):
    x = (b-a)/1000
    maxf = 0
    for i in range(1000):
        if(func(a+(i*x))>maxf):
            maxf = func(a+(i*x))
    return maxf



def integrale(func,a,b,N):
    c = 0
    maxf = funcMax(func,a,b)
    for i in range(N):
        x = random.uniform(a,b)	
        y = random.uniform(0,maxf)
        if(func(x) <= y):
            c=c+1
    print(c)
    return ((N-c)/N)*((b-a)*(func(b)-a))
    


print("integrale de exp = %f" % integrale(sin,0,1,100000))



