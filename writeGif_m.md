---
layout: page
title: MATLAB
---

# [writeGif](https://github.com/tulimid1/savingFiles/blob/main/writeGif.m)
---

Create a .gif file animation. See [Using_SaveFiles.mlx](https://github.com/tulimid1/savingFiles/blob/main/Using_SaveFiles.mlx) for a notebook of examples. 

## Syntax
---

[writeGif(filename, iter)](#a)

[writeGif(filename, iter, Name=Value)](#b)

## Description
---
### A
writeGif([filename](#filename), [iter](#iter)) saves a .gif file labeled [filename](#filename). [example](#simple-example)

### B 
writeGif([filename](#filename), [iter](#iter), [Name=Value](#name-value-arguments)) saves a .gif file with additional options specified by one or more name-value pair arguments. For example, you can save to a supplemental folder. [example](#slower-animation)

## Examples 
---
### Simple example
Sine wave gif. 

    x = linspace(0, 2*pi, 100); % to evaluate

    x_end = linspace(2*pi, 4*pi, 100); % make look bigger 

    % sin 
    % initialize
    figure()
    plot(x, sin(x), 'linewidth', 2);
    ax = gca(); 

    for i = 1:length(x_end)
        set(ax.Children(1), 'xdata', linspace(0, x_end(i)));
        set(ax.Children(1), 'ydata', sin(linspace(0, x_end(i))));
        writeGif('testGif1.gif', i)
    end

![FIG1](/assets/testGif1m.gif)

### Slower animation
Cosine wave gif

    x = linspace(0, 2*pi, 100); % to evaluate

    x_end = linspace(2*pi, 4*pi, 100); % make look bigger 

    % cos
    % initialize
    figure()
    plot(x, sin(x), 'linewidth', 2);
    ax = gca(); 

    for i = 1:length(x_end)
        set(ax.Children(1), 'xdata', linspace(0, x_end(i)));
        set(ax.Children(1), 'ydata', sin(linspace(0, x_end(i))));
        writeGif('testGif2.gif', i, 'delayTime',0.5)
    end
    
![FIG2](/assets/testGif2m.gif)

## Input Arguments
---
### ```filename```
Filename for .gif file.

Desired name of gif file. Final gif file = `filename + .gif`

Data Types: (char)

### ```iter```
Current iteration for gif

The iteration the loop is currently on. 

Data Types: (double, scalar)

### Name-Value Arguments

Specified optional pairs of ```Name=Value``` arguments. ```Name``` is the is the argument name and ```Value``` is the corresponding value. You can specify several name and value pair arguments in any order as ```Name1=Value1,...,NameN=ValueN```. 

**Example**: ```sup=false``` specifies a gif file to be saved in regular figure location (code_folder/figures/DD_MMM_YYYY). 

### ```delayTime```
Time between frames for .gif file (default=0.1)

How long to delay between frames. 

Data Types: (boolean)

## More About 
---

This function uses methodology [best_save](https://tulimid1.github.io/savingFiles/best_save_m/) extensively. 

## Tips 
---

## See also 
---
[best_save](https://tulimid1.github.io/savingFiles/best_save_m/)
