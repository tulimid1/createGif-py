---
layout: page
title: MATLAB
---

# [best_save](https://github.com/tulimid1/savingFiles/blob/main/best_save.m)
---

Save figures systematically to keep clean organization. See [Using_SaveFiles.mlx](https://github.com/tulimid1/savingFiles/blob/main/Using_SaveFiles.mlx) for a notebook with examples. 

## Syntax
---

[best_save(fig_name)](#a)

[best_save(fig_name, Name=Value)](#b)

## Description
---
### A
best_save([fig_name](#fig_name)) saves the current figure as `fig_name` in a folder labeled with the current date. [example](#basic-save)

### B 
best_save([fig_name](#fig_name), [Name=Value](#name-value-arguments)) saves current figure in folder of current date with additional options specified by one or more name-value pair arguments. For example, you can save to supplemental folder inside the current folder or not close the figure after it's saved. [example](#save-to-supplemental)

## Examples 
---
### Basic save
Create figure
    
    x = linspace(0, 2*pi, 100); % to evaluate

    % visualize
    figure()
    plot(x, sin(x), 'linewidth', 2);

![FIG1](/assets/testFig1m.png)

Save figure 

    best_save('testFig1') % normal folder 

### Save to supplemental
Save figure to supplemental folder inside of current date's folder.

Create figure
    
    x = linspace(0, 2*pi, 100); % to evaluate
    
    figure()
    plot(x, cos(x), 'linewidth', 2);

![FIG2](/assets/testFig2m.png)

Save figure 

    best_save('testFig2', 'sup',true) % put in supplemental folder  

### Don't close after saving 
Don't close the figure object after it is saved.

Create figure
    
    x = linspace(0, 2*pi, 100); % to evaluate
    
    figure()
    plot(x, cos(x), 'linewidth', 2);

Save figure 

    best_save('testFig2', 'close_yn',false) % don't close  

## Input Arguments
---
### ```fig_name```
Name of file figure should be named. 

File name for figure. Extension will default as .png. 

Data Types: (str)

### Name-Value Arguments

Specified optional pairs of ```Name=Value``` arguments. ```Name``` is the is the argument name and ```Value``` is the corresponding value. You can specify several name and value pair arguments in any order as ```Name1=Value1,...,NameN=ValueN```. 

**Example**: ```close=True, supplemental=True``` specifies function to save figure in a subfolder called Supplemental and to close the figure after it is saved. 

### ```close_yn```
Close figure after saved. (default=true)

Whether or not to close figure after it has been saved in appropriate location. 

Data Types: (boolean)

### `fig_handle`
Figure handle to be saved. (default=gcf())

Which figure handle to save. Useful if multiple figures are being created in odd orders. 

### ```sup```
Save to supplemental subfolder (default=false)

Whether or not to save figure to subfolder called supplemental. 

Data Types: (boolean)

### `paper`
Save to paper folder (default=false)

Whether or not to save figure to subfolder called paper. Useful for creating manuscripts so you can just link to these files and not worry about the date subfolder. 

Data Types: (boolean)

### `extension`
File extension (defualt='.png')

What extension to give figure file. 

Data Types: (char)

## More About 
---

When the function is called for the first time in a new directory, it will create a **figures** folder (code_folder/figures). When the function is called for the first time in a day in a directory where it has already been called previously, it will create a folder labeled with the current date below the **figures** folder (code_folder/figures/DD_MMM_YYYY). When the function is called with the `supplemental` argument defined as true, it will create a subfolder labeled **supplemental** and save the figure there (code_folder/figures/DD_MMM_YYYY/Supplemental). 

One can find a clear example [here](https://github.com/tulimid1/savingFiles/tree/main/figures). 

## Tips 
---

If you get an error or pause execution while this function is working, it is good practice to make sure you reset your directory. 

## See also
---

[writeGif](https://tulimid1.github.io/savingFiles/writeGif_m/)

## Issues and Discussion 
---

[Issues](https://github.com/tulimid1/savingFiles/issues) and [Discussion](https://github.com/tulimid1/savingFiles/discussions).

If you don't know how to use github (or don't want to), just send me an [email](mailto:tulimid@udel.edu). 
