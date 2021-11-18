---
layout: page
title: Python
---

# [best_save()](https://github.com/tulimid1/savingFiles/blob/main/best_save.py)
---

Save figures systematically to keep clean organization. See [Using_SaveFiles.ipynb](https://github.com/tulimid1/savingFiles/blob/main/Using_SaveFiles.ipynb) for a notebook with examples. 

## Syntax
---

[best_save(fig_obj, fig_name)](#a)

[best_save(fig_obj, fig_name, Name=Value)](#b)

## Description
---
### A
best_save([fig_obj](#fig_obj), [fig_name](#fig_name)) saves the figure object as `fig_name` in a folder labeled with the current date. [example](#basic-save)

### B 
best_save([fig_obj](#fig_obj), [fig_name](#fig_name), [Name=Value](#name-value-arguments)) saves figure in folder of current date with additional options specified by one or more name-value pair arguments. For example, you can save to supplemental folder inside the current folder or not close the figure after it's saved. [example](#save-to-supplemental)

## Examples 
---
### Basic save
Import libraries 

    import numpy as np 
    import matplotlib.pyplot as plt
    
Create figure
    
    # create some figure 
    x = np.linspace(0, 2*np.pi, 100)

    fig1 = plt.figure()
    plt.plot(x, np.sin(x), lw=3)
    plt.show()

![FIG1](/assets/testFig1py.png)

Save figure 

    best_save(fig1, 'testFig1') # normal folder 

### Save to supplemental
Save figure to supplemental folder inside of current date's folder.

Import libraries 

    import numpy as np 
    import matplotlib.pyplot as plt
    
Create figure
    
    # create some figure 
    x = np.linspace(0, 2*np.pi, 100)

    fig2 = plt.figure()
    plt.plot(x, np.cos(x), lw=3)
    plt.show()

![FIG2](/assets/testFig2py.png)

Save figure 

    best_save(fig2, 'testFig2', supplemental=True) # put in supplemental folder  

### Don't close after saving 
Don't close the figure object after it is saved.

Import libraries 

    import numpy as np 
    import matplotlib.pyplot as plt
    
Create figure
    
    # create some figure 
    x = np.linspace(0, 2*np.pi, 100)

    fig1 = plt.figure()
    plt.plot(x, np.sin(x), lw=3)
    plt.show()

Save figure 

    best_save(fig1, 'testfig1', close=False)

## Input Arguments
---
### ```fig_obj```
Figure object to be saved. 

Object of figure to be saved via best_save() function. Preferably matplotlib.pyplot.figure(). 

    fig = matplotlib.pyplot.figure()

Data Types: (figure object)

### ```fig_name```
Name of file figure should be named. 

File name for figure. Extension will default as .png. 

Data Types: (str)

### Name-Value Arguments

Specified optional pairs of ```Name=Value``` arguments. ```Name``` is the is the argument name and ```Value``` is the corresponding value. You can specify several name and value pair arguments in any order as ```Name1=Value1,...,NameN=ValueN```. 

**Example**: ```close=True, supplemental=True``` specifies function to save figure in a subfolder called Supplemental and to close the figure after it is saved. 

### ```close```
Close figure after saved. (default=True)

Whether or not to close figure after it has been saved in appropriate location. 

Data Types: (boolean)

### ```supplemental```
Save to supplemental subfolder (default=False)

Whether or not to save figure to subfolder called supplemental folder. 

Data Types: (boolean)

## More About 
---

When the function is called for the first time in a new directory, it will create a **figures** folder (code_folder/figures).  When the function is called for the first time in a day in a directory where it has already been called previously, it will create a folder labeled with the current date below the **figures** folder (code_folder/figures/MM_DD_YYY). When the function is called with the `supplemental` argument defined as True, it will create a subfolder labeled **supplemental** and save the figure there (code_folder/figures/MM_DD_YYYY/Supplemental). 

One can find a clear example [here](https://github.com/tulimid1/savingFiles/tree/main/figures). 

## Tips 
---

If you get an error or pause execution while this function is working, it is good practice to make sure you reset your directory. 

## See also
---

[writeGif()](https://tulimid1.github.io/savingFiles/writeGif_py/)
