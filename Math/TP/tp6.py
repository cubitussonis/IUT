#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
TP 6
Marius Longeanie 
Groupe : A1

"""

import numpy as np

carte = [[0,210,95,180],
         [210,0,126,53],
         [95,126,0,113],
         [180,53,113,0]]
         m      n       aj       p       p       an   
carte = [[0,    122,    521,    773,    217,    421,    561,    403,    66],
         [122,  0,      601,    711,    203,    359,    499,    290,    187],
         [521,  601,    0,      1252,   796,    840,    953,    882,    471],
         [773,  711,    1252,   0,      845,    537,    409,    677,    838],
         [217,  203,    796,    845,    0,      559,    698,    206,    382],
         [421,  359,    840,    537,    539,    0,      215,    646,    ],
         [561,53,113,0],
         [403,53,113,0],
         [66,53,113,0]]


def trajetAlea(n):
    trajet = np.arange(n)
    np.random.shuffle(trajet)
    return trajet
        

def popAlea(n,p):
    pop = []
    for i in range(p):
        pop += [trajetAlea(n)]
    return pop

#print(popAlea(8,20))

def longTrajet(t,carte):
    km = 0
    for i in range(len(t)):
        if(i < len(t)-1):
            km +=carte[t[i]][t[i+1]]
    return km
    
p= popAlea(4,10)
#t= trajetAlea(4)
#longTrajet(t,carte)

def LongPop(p,carte):
    res = []
    for i in range(len(p)):
        sumKM = longTrajet(p[i],carte)
        res += [sumKM]
    
    return res

print(LongPop(p,carte))

def findMax(l):
    res = []
    res += [0]
    res += [0]
    for i in range(len(l)):
        if(len(l)> res[0]):
            res[0] = l[i]
            res[1] = i
    return res;
            

def selection(p,carte):
    res = []
    maxPlace = []
    listSum = LongPop(p,carte);
    for i in range(len(listSum)):
        if(len(res)< len(listSum)/2):
            if(len(res)==0):
                res += [listSum[i]]
                maxPlace += [listSum[i]]
                maxPlace += [len(res)-1]
            elif(listSum[i] < maxPlace[0]):
                res += [listSum[i]]
                maxPlace[0] = listSum[i]
                maxPlace[1] = len(res)-1
            else:
                res += [listSum[i]]
        else:
            if(listSum[i] < maxPlace[0]):
                maxPlace[0] = listSum[i]
                maxPlace = findMax(res)
            
            
    return res


print(selection(p,carte))
        
                
 
    
                                                           	


