#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Nov  5 22:06:26 2017

@author: abrantesasf
"""

#%% Imports
import nltk
from nltk import word_tokenize
from bs4 import BeautifulSoup
import urllib.request
from collections import defaultdict, Counter
import os
import re
from nltk.stem import RegexpStemmer

#%%
def readURL(url):
    print(url)
    try:
        with urllib.request.urlopen(url) as response:
            html = response.read()
    except urllib.error.URLError as e:
        print('Message on readURL error: ', e.reason)
        return None

    return html

def faculty():

    html = readURL("https://www.eecs.mit.edu/people/faculty-advisors")
    soup = BeautifulSoup(html, 'html.parser')
    names = defaultdict(list)
    divs = soup.find_all(class_="field-content card-title")
    for div in divs:
        try:
            dept = div.find('a')['href']
            if dept.lower().find('csail') > 0 : dept = 'CSAIL'
            elif dept.lower().find('lids') > 0 : dept = 'LIDS'
            elif dept.lower().find('mtl') > 0 : dept = 'MTL'
            elif dept.lower().find('rle') > 0 : dept = 'RLE'
            else: dept = 'UNK'
        except:
            dept = 'UNK' # These records had no No HREF
            pass
        try:
            names[div.get_text()] = dept
        except:
            continue
    return names

names = faculty()
html = readURL("https://www.eecs.mit.edu/people/faculty-advisors")
print(html)

soup = BeautifulSoup(html, 'html.parser')
print(soup)

divs = soup.find_all(class_="field-content card-title")
print(divs)