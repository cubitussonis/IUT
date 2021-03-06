#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
TP 4
Marius Longeanie 
Groupe : A1

"""
import random
import numpy as np

'''def ruine(wallet,obj,lance):
    c = 1
    while (wallet != 0 and wallet != obj and c <= lance):
        piece = random.randint(0,1)
        if (piece == 0):
            wallet = wallet+1
        else:
            wallet = wallet-1
        c = c + 1
    
    if(wallet == obj):
        return True
    else:
        return False
    

def probRuine(N,f,wallet,obj,lance):
    success = 0
    for i in range(N):
        if(f(wallet,obj,lance)== True):
            success +=1
    
    return success/N


print(probRuine(1000,ruine,3,6,5))
print(probRuine(1000,ruine,3,6,24))
print()
print(probRuine(1000,ruine,3,6,5))
print(probRuine(1000,ruine,3,6,24))'''


pn= np.array([[1,1/2,0,0,0,0,0],
             [0,0,1/2,0,0,0,0],
             [0,1/2,0,1/2,0,0,0],
             [0,0,1/2,0,1/2,0,0],
             [0,0,0,1/2,0,1/2,0],
             [0,0,0,0,1/2,0,0],
             [0,0,0,0,0,1/2,1]])

p0 = np.array([[0],[0],[0],[1],[0],[0],[0]])


def ruine (wallet,mat,obj,n):
    
    for i in range(n):
        wallet = mat.dot(wallet)
        #print(wallet)
    
    return wallet


print(ruine(p0,pn,6,100))

       
    