%main function
if exist (...
        'image',...
        'dir')~= 7
    %make directory
    mkdir([cd,...
        '/image']) % create images in this directory
end
directory=[cd,'/image/']; % create images in this directory

%Creates a new figure window using below property values
fig = figure('Units', 'Normalized', 'NumberTitle', 'off', 'Name', 'CAMERA WINDOW', 'Menubar', 'None');
%Create axes graphics object
axis_of_figure = axes('Parent', fig, 'Units', 'Normalized', 'Position', [0.04 0.18, 0.90, 0.75]);
axis off

%Create user interface control object in the camera window
user_control_1 = uicontrol ( ... 
    'Parent',  fig, 'Units',  ...
    'Normalized',  'Position',   [0.15 0.02 0.20 0.1], ...
    'String', 'View Image', 'Callback',   ['imaqhwinfo;'...
    'obj = videoinput(''macvideo'',1);'...
    'set(obj, ''FramesPerTrigger'', 1);'...
    'set(obj, ''TriggerRepeat'', Inf);'...
    'resolution = get(obj, ''VideoResolution'');' ...
    'number_of_bands = get(obj, ''NumberOfBands'');' ...
    'user_image = image(zeros(resolution(2), resolution(1), number_of_bands));' ...
    'preview(obj, user_image);']);


close_camera_btn   =   uicontrol( ...user control
    'Parent',   fig, ...parent
    'Units',  'Normalized', ...units
    'Position',   [0.75 0.02 0.20 0.1], ...position
    'String',  'Close Camera', ...
    'Callback',  'capture(0,directory,obj);');

capture_image_btn   =   uicontrol( ...user control
    'Parent',   fig,  ...parent
    'Units',  'Normalized',  ...units
    'Position',   [0.40 0.02 0.20 0.1], ...position
    'String',  'Capture Image',  ...
    'Callback',   'capture(1,directory,obj ) ;');




