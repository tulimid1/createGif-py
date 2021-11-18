function best_save(fig_name, varargin)
%  BEST_SAVE Save figure to figures folder with optinal inputs about figure handle and 
% subfolder (supplemental)
% 
% Adaptation from previously made just_save. 
% 
% Created June 25, 2021
% INPUT:
% fig_name: figure name (class: string)
% close_yn: close figure after saved, true?
% varargin: 
% fig_handle: figure handle
% sup: save in supplemental folder
% paper: save in paper sub folder, 
% extension: extension to save file 
% OUTPUT:
% save figure in pwd/figures/{current_date} in respective
% folder 
% Parse inputs 
p = inputParser;
addRequired(p,fig_name, @mustBeText); % required input
addParameter(p, 'close_yn', true, @islogical); % optional name-value input 
addParameter(p, 'fig_handle', gcf); % optional name-value input 
addParameter(p, 'sup', false, @islogical); % optional name-value input
addParameter(p, 'paper', false, @islogical); % optional name-value input 
addParameter(p, 'extension', '.png', @mustBeText)
parse(p, fig_name, varargin{:}); % parse 
% Work folder is current folder in 
work_folder = pwd; 
% Create figure name to be saved as .jpg
x = fig_name;
z = p.Results.extension; 
z = append(x, z);
% Search for, and cd into, pre-existing fig/figures folder.
% If no such folder exists, create one and cd into it.
if isfolder('figs')
    cd ./figs
elseif isfolder('figures')
    cd ./figures
elseif ~isfolder('figs') && ~isfolder('figures')
    mkdir('figures')
    cd ./figures
end
% Search for, and cd into, pre-existing daily folder.
% If no such folder exists, create one and cd into it. 
c = date;
if exist(sprintf('%s',c), 'dir')
    cd(c)
else
    mkdir(sprintf('%s',c))
    cd(c)
end
% Search for, and cd into, pre-existing supplemental folder. 
% If no such folder exists, create on and cd into it. 
% If not to be saved into supplemental figure folder,
% keep going.
if p.Results.sup
    if exist('Supplemental', 'dir')
        cd('Supplemental')
    else
        mkdir('Supplemental')
        cd('Supplemental')
    end
elseif p.Results.paper
    if exist('Paper', 'dir')
        cd('Paper')
    else
        mkdir('Paper')
        cd('Paper')
    end
end
% Save to folder (exportgraphics saves subplots better) 
if ~strcmpi(p.Results.extension, '.fig')
    exportgraphics(p.Results.fig_handle,z); 
else
    savefig(p.Results.fig_handle, z);
end
% Go back to work folder 
cd(work_folder)
if strcmp(p.Results.close_yn, 'y')
    close(p.Results.fig_handle)
end
end