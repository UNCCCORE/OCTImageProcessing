function varargout = OCT_Power(varargin)
% OCT_POWER MATLAB code for OCT_Power.fig
%      OCT_POWER, by itself, creates a new OCT_POWER or raises the existing
%      singleton*.
%
%      H = OCT_POWER returns the handle to a new OCT_POWER or the handle to
%      the existing singleton*.
%
%      OCT_POWER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OCT_POWER.M with the given input arguments.
%
%      OCT_POWER('Property','Value',...) creates a new OCT_POWER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OCT_Power_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OCT_Power_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OCT_Power

% Last Modified by GUIDE v2.5 14-Jul-2017 17:01:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OCT_Power_OpeningFcn, ...
                   'gui_OutputFcn',  @OCT_Power_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before OCT_Power is made visible.
function OCT_Power_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OCT_Power (see VARARGIN)

global appSettings
global OCTResults
global image

addpath(genpath(pwd));

for i = 1:9
    OCTResults(i).x = [];
    OCTResults(i).y = [];
    OCTResults(i).z = [];
    OCTResults(i).zenith = [];
end

%Check if Settings.mat exists, if not create and load the defualt
if exist(fullfile(cd, 'Settings','programSettings.mat'), 'file') == 2
   load(fullfile(cd, 'Settings','programSettings.mat'));
else
    defaultSettings();
    load(fullfile(cd, 'Settings','programSettings.mat'));
end

appSettings = programSettings;

% Choose default command line output for OCT_Power
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OCT_Power wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = OCT_Power_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in prwvid.
function prwvid_Callback(hObject, eventdata, handles)
% hObject    handle to prwvid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid
vid = videoinput('winvideo',1);
start(vid);
axes(handles.PRW);
vidRes = vid.VideoResolution;
nBands = vid.NumberOfBands;
hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
preview(vid, hImage);

% --- Executes on button press in checkheight.
function checkheight_Callback(hObject, eventdata, handles)
% hObject    handle to checkheight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global appSettings;
global OCTResults;
global image;
image=getimage(handles);
% OCTResults = checkHeight(appSettings,image);
% matrix = NathansFunction(inputs);
OCTResults = checkHeight(appSettings,image);

%set heights to static boxes
set(handles.oct9h, 'String', num2str(OCTResults.heights(9)));
set(handles.oct8h, 'String', num2str(OCTResults.heights(8)));
set(handles.oct7h, 'String', num2str(OCTResults.heights(7)));
set(handles.oct6h, 'String', num2str(OCTResults.heights(6)));
set(handles.oct5h, 'String', num2str(OCTResults.heights(5)));
set(handles.oct4h, 'String', num2str(OCTResults.heights(4)));
set(handles.oct3h, 'String', num2str(OCTResults.heights(3)));
set(handles.oct2h, 'String', num2str(OCTResults.heights(2)));
set(handles.oct1h, 'String', num2str(OCTResults.heights(1)));


% --- Executes on button press in zenithpower.
function zenithpower_Callback(hObject, eventdata, handles)
% hObject    handle to zenithpower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global appSettings;
global OCTResults;
global image;
image=getimage(handles);
% OCTResults = checkHeight(appSettings,image);
% matrix = NathansFunction(inputs);
OCTResults = checkPower(appSettings,image);

%set heights
set(handles.oct9h, 'String', num2str(OCTResults.heights(9)));
set(handles.oct8h, 'String', num2str(OCTResults.heights(8)));
set(handles.oct7h, 'String', num2str(OCTResults.heights(7)));
set(handles.oct6h, 'String', num2str(OCTResults.heights(6)));
set(handles.oct5h, 'String', num2str(OCTResults.heights(5)));
set(handles.oct4h, 'String', num2str(OCTResults.heights(4)));
set(handles.oct3h, 'String', num2str(OCTResults.heights(3)));
set(handles.oct2h, 'String', num2str(OCTResults.heights(2)));
set(handles.oct1h, 'String', num2str(OCTResults.heights(1)));

%set zenith angles
set(handles.oct9z, 'String', num2str(OCTResults.zenith(9)));
set(handles.oct8z, 'String', num2str(OCTResults.zenith(8)));
set(handles.oct7z, 'String', num2str(OCTResults.zenith(7)));
set(handles.oct6z, 'String', num2str(OCTResults.zenith(6)));
set(handles.oct5z, 'String', num2str(OCTResults.zenith(5)));
set(handles.oct4z, 'String', num2str(OCTResults.zenith(4)));
set(handles.oct3z, 'String', num2str(OCTResults.zenith(3)));
set(handles.oct2z, 'String', num2str(OCTResults.zenith(2)));
set(handles.oct1z, 'String', num2str(OCTResults.zenith(1)));

hold on;
text(100,200,sprintf('Total power output: %0.000f W',OCTResults.totalPower),'Color','White','FontSize',20,'FontWeight','Bold');

% --- Executes on button press in snapshot.
function snapshot_Callback(hObject, eventdata, handles)
% hObject    handle to snapshot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

m=getappdata(0,'num_1');
n=getappdata(0,'num_2');
oct9h=m+n;
oct9h=num2str(oct9h);
set(handles.oct9h, 'String', oct9h)


function oct9x_Callback(hObject, eventdata, handles)
% hObject    handle to oct9x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct9x as text
%        str2double(get(hObject,'String')) returns contents of oct9x as a double
global appSettings
a=str2num(get(handles.oct9x,'String'));
%appSettings.kParms(3) = a;
setappdata(0,'num_1',a);

% --- Executes during object creation, after setting all properties.
function oct9x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct9x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct9y_Callback(hObject, eventdata, handles)
% hObject    handle to oct9y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct9y as text
%        str2double(get(hObject,'String')) returns contents of oct9y as a double
b=str2num(get(handles.oct9y,'String'));
setappdata(0,'num_2',b);

% --- Executes during object creation, after setting all properties.
function oct9y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct9y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct8x_Callback(hObject, eventdata, handles)
% hObject    handle to oct8x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct8x as text
%        str2double(get(hObject,'String')) returns contents of oct8x as a double


% --- Executes during object creation, after setting all properties.
function oct8x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct8x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct8y_Callback(hObject, eventdata, handles)
% hObject    handle to oct8y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct8y as text
%        str2double(get(hObject,'String')) returns contents of oct8y as a double


% --- Executes during object creation, after setting all properties.
function oct8y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct8y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct7x_Callback(hObject, eventdata, handles)
% hObject    handle to oct7x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct7x as text
%        str2double(get(hObject,'String')) returns contents of oct7x as a double


% --- Executes during object creation, after setting all properties.
function oct7x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct7x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct7y_Callback(hObject, eventdata, handles)
% hObject    handle to oct7y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct7y as text
%        str2double(get(hObject,'String')) returns contents of oct7y as a double


% --- Executes during object creation, after setting all properties.
function oct7y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct7y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct6x_Callback(hObject, eventdata, handles)
% hObject    handle to oct6x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct6x as text
%        str2double(get(hObject,'String')) returns contents of oct6x as a double


% --- Executes during object creation, after setting all properties.
function oct6x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct6x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct6y_Callback(hObject, eventdata, handles)
% hObject    handle to oct6y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct6y as text
%        str2double(get(hObject,'String')) returns contents of oct6y as a double


% --- Executes during object creation, after setting all properties.
function oct6y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct6y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct5x_Callback(hObject, eventdata, handles)
% hObject    handle to oct5x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct5x as text
%        str2double(get(hObject,'String')) returns contents of oct5x as a double


% --- Executes during object creation, after setting all properties.
function oct5x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct5x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct5y_Callback(hObject, eventdata, handles)
% hObject    handle to oct5y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct5y as text
%        str2double(get(hObject,'String')) returns contents of oct5y as a double


% --- Executes during object creation, after setting all properties.
function oct5y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct5y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct4x_Callback(hObject, eventdata, handles)
% hObject    handle to oct4x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct4x as text
%        str2double(get(hObject,'String')) returns contents of oct4x as a double


% --- Executes during object creation, after setting all properties.
function oct4x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct4x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct4y_Callback(hObject, eventdata, handles)
% hObject    handle to oct4y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct4y as text
%        str2double(get(hObject,'String')) returns contents of oct4y as a double


% --- Executes during object creation, after setting all properties.
function oct4y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct4y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct3x_Callback(hObject, eventdata, handles)
% hObject    handle to oct3x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct3x as text
%        str2double(get(hObject,'String')) returns contents of oct3x as a double


% --- Executes during object creation, after setting all properties.
function oct3x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct3x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct3y_Callback(hObject, eventdata, handles)
% hObject    handle to oct3y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct3y as text
%        str2double(get(hObject,'String')) returns contents of oct3y as a double


% --- Executes during object creation, after setting all properties.
function oct3y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct3y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct2x_Callback(hObject, eventdata, handles)
% hObject    handle to oct2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct2x as text
%        str2double(get(hObject,'String')) returns contents of oct2x as a double


% --- Executes during object creation, after setting all properties.
function oct2x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct2y_Callback(hObject, eventdata, handles)
% hObject    handle to oct2y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct2y as text
%        str2double(get(hObject,'String')) returns contents of oct2y as a double


% --- Executes during object creation, after setting all properties.
function oct2y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct2y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct1x_Callback(hObject, eventdata, handles)
% hObject    handle to oct1x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct1x as text
%        str2double(get(hObject,'String')) returns contents of oct1x as a double


% --- Executes during object creation, after setting all properties.
function oct1x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct1x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oct1y_Callback(hObject, eventdata, handles)
% hObject    handle to oct1y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oct1y as text
%        str2double(get(hObject,'String')) returns contents of oct1y as a double


% --- Executes during object creation, after setting all properties.
function oct1y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oct1y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function image=getimage(handles)
image =[];
if get(handles.current,'Value')
    global CAM;
    if(CAM==1)
        CAM=0;
        image=getsnapshot(handles.VidObj);
        closepreview
        %     clear VidObj
        %     delete  VidObj
        imshow(image,'parent',handles.PRW);
        imwrite(image,'tempheightcheck.jpg');
    else
        msgbox('Plz! Start Cam First by PUSHBUTTON')
    end
else get(handles.browse,'Value')
    [filename pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
    image = strcat(pathname, filename);
    [pathstr, name, ext] = fileparts(filename);
%     fileinfo=imfinfo(image);
%     FileSize1=fileinfo.FileSize(1,1);
%     sizew=fileinfo.Width(1,1);
%     sizeh=fileinfo.Height(1,1);
    axes(handles.PRW);
    imshow(image)
end

sprintf('');
