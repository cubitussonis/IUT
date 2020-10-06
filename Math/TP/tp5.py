#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
TP 4
Marius Longeanie 
Groupe : A1

"""


import numpy as np

mat = np.array([[3/4,1/5],
                [1/4,4/5]])

s = np.array([[7500],[12500]])

p = np.array([[1],[0]])


def nbJournaux(mat,s,n):
    for i in range(n):
        s = mat.dot(s)
    print(s)

#nbJournaux(mat,s,10)
#nbJournaux(mat,s,20)
#nbJournaux(mat,s,47)
#nbJournaux(mat,s,100)
    
nbJournaux(mat,p,7)