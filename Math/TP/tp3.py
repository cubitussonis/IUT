#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
TP 3
Marius Longeanie 
Groupe : A1

"""


from math import sqrt, exp		
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




def integrale(func,a,b,N):
    c = 0
    for i in range(N):
        x = random.uniform(a,b)	
        y = random.uniform(a,func(b))
        if(func(x) <= y):
            c=c+1
    print(c)
    return ((N-c)/N)*((b-a)*(func(b)-a))
    


print("integrale de exp = %f" % integrale(exp,0,1,100000))


