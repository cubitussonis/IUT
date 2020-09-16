# -*- coding: utf-8 -*-

"""
TP 2 
Marius Longeanie 
Groupe : A1

"""

import math;
import random;

import matplotlib.pyplot as plt


'''
N=100000
c=[]
for i in range(N):
    ran = random.random()
    c = c+[ran]




plt.hist(c, range = (0, 1), bins = 10, color = 'yellow',
            edgecolor = 'red')
plt.xlabel('valeurs')
plt.ylabel('nombres')
plt.show()
'''

def lance4():
    for i in range(4):
        if(random.randint(1,6)==6):
            return True
    return False
            


def lance24():
    c = 0
    for i in range(24):
        if(random.randint(1,6)==6):
            if(random.randint(1,6)==6):
                return True
    return False
 


def theorieChev4(nbTimes):
    c = 0
    for i in range(nbTimes):
        if(lance4()==True):
            c = c+1;
    
    return c/nbTimes


def theorieChev24(nbTimes):
    c = 0
    for i in range(nbTimes):
        if(lance24()==True):
            c = c+1;
    
    return c/nbTimes


print("4 fois")
print(theorieChev4(10))
print(theorieChev4(100))
print(theorieChev4(1000))
print(theorieChev4(10000))
print(theorieChev4(100000))

print()
print("24 fois")
print(theorieChev24(10))
print(theorieChev24(100))
print(theorieChev24(1000))
print(theorieChev24(10000))
print(theorieChev24(100000))


