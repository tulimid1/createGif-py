function writeGif(filename, iter, varargin)
%  WRITEGIF Write plots in loop as a .gif
% 
% First call must be with iter == 1
% 
% Created April 26, 2021
% 
% <https://www.mathworks.com/matlabcentral/answers/94495-how-can-i-create-animated-gif-images-in-matlab 
% https://www.mathworks.com/matlabcentral/answers/94495-how-can-i-create-animated-gif-images-in-matlab>
% INPUTS:
% filename: filename for .gif file 
% iter: current iteration 
% varargin: 
%   delayTime: delay time for .gif

% parse inputs 
p = inputParser();
addRequired(p, 'filename', @mustBeText);
addRequired(p, 'iter', @(x) x > 0 && isreal(x) && isnumeric(x));
addParameter(p, 'delayTime', 0.1, @mustBeNumeric);
parse(p, filename, iter, varargin{:}); 

% Work folder is current folder in 
work_folder = pwd; 
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
frame = getframe(gcf); 
im = frame2im(frame); 
[imind,cm] = rgb2ind(im,256); 
if iter == 1
    imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'delaytime', p.Results.delayTime);
else
    imwrite(imind,cm,filename,'gif','WriteMode','append', 'delaytime', p.Results.delayTime); 
end
% Go back to work folder 
cd(work_folder)
end