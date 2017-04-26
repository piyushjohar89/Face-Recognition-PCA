function varargout = face_recognition(varargin)
% SYSTEM MATLAB code for face_recognition.fig
nominal_value = 1;
current_value = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  nominal_value, ...
                   'gui_OpeningFcn', @face_recognition_open, ...
                   'gui_OutputFcn',  @face_recognition_output, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
               
% takes variable-length input argument list                
if nargin && ischar(varargin{1})
    current_value.gui_Callback = ...
        str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = ...
        gui_mainfcn(current_value, varargin{:}) ;
else
    gui_mainfcn(current_value, varargin{:}) ;
end


function face_recognition_open(samples, e_value, controller, varargin)
controller.output = samples;

guidata(samples, controller);

function varargout = face_recognition_output(samples, e_value, controller) 
varargout{1} = controller.output;


% button press button 1.
function pushbutton1_Callback(samples, e_value, controller)
training;


% button press button2.
function pushbutton2_Callback(samples, e_value, controller)
main;
