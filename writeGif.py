def writeGif(filenameG, filenames, supplemental=False):
    '''
    Save figure files as gif file and delete figures used to create gif 

    INPUTS:
    filenameG: filename for .gif file 
    filenames: filenames of individual figures to be saved together as gif
    supplemental: put in supplemental or not, boolean

    OUTPUTS:
    .gif file of files in filenmae 
    '''
    import imageio 
    import os 
    import datetime
    import matplotlib

    # current working directory 
    cwd = os.getcwd(); 

    # Does figures folder exist? 
    if os.path.exists(cwd+'/figures') == False: 
        # it doesn't exist
        # create a new figures folder 
        os.mkdir(cwd+'/figures')

    # Make figures folder the current working directory 
    os.chdir(cwd+'/figures')

    # Does current date sub folder exist 
    today = datetime.datetime.now()
    cur_day = today.strftime("%m_%d_%Y")

    # Does current date folder exist? 
    if os.path.exists(cwd+'/figures'+'/'+cur_day) == False:
        # it doesn't exist 
        # create a new date folder 
        os.mkdir(cwd+'/figures'+'/'+cur_day)

    # Make date subfolder the current working directory 
    os.chdir(cwd+'/figures'+'/'+cur_day)

    # Save in supplemental folder ?
    if supplemental:
        if os.path.exists(cwd+'/figures'+'/'+cur_day+'/'+'Supplemental') == False:
            os.mkdir(cwd+'/figures'+'/'+cur_day+'/'+'Supplemental')
        os.chdir(cwd+'/figures'+'/'+cur_day+'/'+'Supplemental')

    with imageio.get_writer(filenameG+'.gif', mode='I') as writer:
        for filename in filenames:
            image = imageio.imread(filename)
            writer.append_data(image) # add to gif 
            os.remove(filename) # delete individual 
    
    # Get back to original folder 
    os.chdir(cwd)