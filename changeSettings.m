function varargout = changeSettings(varargin)
% CHANGESETTINGS MATLAB code for changeSettings.fig
%      CHANGESETTINGS, by itself, creates a new CHANGESETTINGS or raises the existing
%      singleton*.
%
%      H = CHANGESETTINGS returns the handle to a new CHANGESETTINGS or the handle to
%      the existing singleton*.
%
%      CHANGESETTINGS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHANGESETTINGS.M with the given input arguments.
%
%      CHANGESETTINGS('Property','Value',...) creates a new CHANGESETTINGS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before changeSettings_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to changeSettings_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help changeSettings

% Last Modified by GUIDE v2.5 08-Aug-2017 14:56:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @changeSettings_OpeningFcn, ...
                   'gui_OutputFcn',  @changeSettings_OutputFcn, ...
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


% --- Executes just before changeSettings is made visible.
function changeSettings_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to changeSettings (see VARARGIN)

% Choose default command line output for changeSettings
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes changeSettings wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global appSettings
displayCurrentSettings(handles);


% --- Outputs from this function are returned to the command line.
function varargout = changeSettings_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function rhoEdit_Callback(hObject, eventdata, handles)
% hObject    handle to rhoEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rhoEdit as text
%        str2double(get(hObject,'String')) returns contents of rhoEdit as a double


% --- Executes during object creation, after setting all properties.
function rhoEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rhoEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CpEdit_Callback(hObject, eventdata, handles)
% hObject    handle to CpEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CpEdit as text
%        str2double(get(hObject,'String')) returns contents of CpEdit as a double


% --- Executes during object creation, after setting all properties.
function CpEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CpEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kParmsEdit_Callback(hObject, eventdata, handles)
% hObject    handle to kParmsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kParmsEdit as text
%        str2double(get(hObject,'String')) returns contents of kParmsEdit as a double


% --- Executes during object creation, after setting all properties.
function kParmsEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kParmsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FbEdit_Callback(hObject, eventdata, handles)
% hObject    handle to FbEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FbEdit as text
%        str2double(get(hObject,'String')) returns contents of FbEdit as a double


% --- Executes during object creation, after setting all properties.
function FbEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FbEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freestreamVelocityEdit_Callback(hObject, eventdata, handles)
% hObject    handle to freestreamVelocityEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freestreamVelocityEdit as text
%        str2double(get(hObject,'String')) returns contents of freestreamVelocityEdit as a double


% --- Executes during object creation, after setting all properties.
function freestreamVelocityEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freestreamVelocityEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function redThreshEdit_Callback(hObject, eventdata, handles)
% hObject    handle to redThreshEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of redThreshEdit as text
%        str2double(get(hObject,'String')) returns contents of redThreshEdit as a double


% --- Executes during object creation, after setting all properties.
function redThreshEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to redThreshEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yellowThresh1Edit_Callback(hObject, eventdata, handles)
% hObject    handle to yellowThresh1Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yellowThresh1Edit as text
%        str2double(get(hObject,'String')) returns contents of yellowThresh1Edit as a double


% --- Executes during object creation, after setting all properties.
function yellowThresh1Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yellowThresh1Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yellowThresh2Edit_Callback(hObject, eventdata, handles)
% hObject    handle to yellowThresh2Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yellowThresh2Edit as text
%        str2double(get(hObject,'String')) returns contents of yellowThresh2Edit as a double


% --- Executes during object creation, after setting all properties.
function yellowThresh2Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yellowThresh2Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yellowThresh3Edit_Callback(hObject, eventdata, handles)
% hObject    handle to yellowThresh3Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yellowThresh3Edit as text
%        str2double(get(hObject,'String')) returns contents of yellowThresh3Edit as a double


% --- Executes during object creation, after setting all properties.
function yellowThresh3Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yellowThresh3Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function blueThreshEdit_Callback(hObject, eventdata, handles)
% hObject    handle to blueThreshEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blueThreshEdit as text
%        str2double(get(hObject,'String')) returns contents of blueThreshEdit as a double


% --- Executes during object creation, after setting all properties.
function blueThreshEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blueThreshEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function shapeBound1Edit_Callback(hObject, eventdata, handles)
% hObject    handle to shapeBound1Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of shapeBound1Edit as text
%        str2double(get(hObject,'String')) returns contents of shapeBound1Edit as a double


% --- Executes during object creation, after setting all properties.
function shapeBound1Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shapeBound1Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function shapeBound2Edit_Callback(hObject, eventdata, handles)
% hObject    handle to shapeBound2Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of shapeBound2Edit as text
%        str2double(get(hObject,'String')) returns contents of shapeBound2Edit as a double


% --- Executes during object creation, after setting all properties.
function shapeBound2Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shapeBound2Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function minAreaEdit_Callback(hObject, eventdata, handles)
% hObject    handle to minAreaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minAreaEdit as text
%        str2double(get(hObject,'String')) returns contents of minAreaEdit as a double


% --- Executes during object creation, after setting all properties.
function minAreaEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minAreaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dragScreenDiaEdit_Callback(hObject, eventdata, handles)
% hObject    handle to dragScreenDiaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dragScreenDiaEdit as text
%        str2double(get(hObject,'String')) returns contents of dragScreenDiaEdit as a double


% --- Executes during object creation, after setting all properties.
function dragScreenDiaEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dragScreenDiaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function markDistFromCoMEdit_Callback(hObject, eventdata, handles)
% hObject    handle to markDistFromCoMEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of markDistFromCoMEdit as text
%        str2double(get(hObject,'String')) returns contents of markDistFromCoMEdit as a double


% --- Executes during object creation, after setting all properties.
function markDistFromCoMEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to markDistFromCoMEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function distToRigOriginEdit_Callback(hObject, eventdata, handles)
% hObject    handle to distToRigOriginEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of distToRigOriginEdit as text
%        str2double(get(hObject,'String')) returns contents of distToRigOriginEdit as a double


% --- Executes during object creation, after setting all properties.
function distToRigOriginEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to distToRigOriginEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global appSettings;
programSettings = appSettings;
save(fullfile(cd, 'Settings','programSettings.mat'),'programSettings');




% --- Executes on button press in resetToDefaults.
function resetToDefaults_Callback(hObject, eventdata, handles)
% hObject    handle to resetToDefaults (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global appSettings;

resetOK = questdlg('Reseting to the defaults will reset all settings to the defaults, including the base locations to NaN. Do you really want to do this?','Confirm Reset');

if strcmpi(resetOK,'Yes')
    defaultSettings();
    load(fullfile(cd, 'Settings','programSettings.mat'));
    appSettings = programSettings;
    displayCurrentSettings(handles);
end
    


function displayCurrentSettings(handles)
% This function displays the current settings in the edit text boxes
global appSettings

distToRigOriginStr = string(appSettings.distToRigOrigin(1)) + ',' + string(appSettings.distToRigOrigin(2)) + ',' + string(appSettings.distToRigOrigin(3));
set(handles.distToRigOriginEdit,'String',distToRigOriginStr);

markDistFromCoMStr = string(appSettings.markDistFromCoM(1)) + ',' + string(appSettings.markDistFromCoM(2));
set(handles.markDistFromCoMEdit,'String',markDistFromCoMStr);

FoVStr = string(appSettings.FoV(1)) + ',' + string(appSettings.FoV(2));
set(handles.FoVEdit,'String',FoVStr);

kParmsStr = string(appSettings.kParms(1)) + ',' + string(appSettings.kParms(2)) + ',' + string(appSettings.kParms(3));
set(handles.kParmsEdit,'String',kParmsStr);

set(handles.CpEdit,'String',string(appSettings.Cp));
set(handles.rhoEdit,'String',string(appSettings.rho));
set(handles.FbEdit,'String',string(appSettings.Fb));
set(handles.dragScreenDiaEdit,'String',string(appSettings.dragScreenDia));
set(handles.freestreamVelocityEdit,'String',string(appSettings.freestreamVelocity));
set(handles.redThreshEdit,'String',string(appSettings.redThresh));
set(handles.yellowThresh1Edit,'String',string(appSettings.yellowThresh1));
set(handles.yellowThresh2Edit,'String',string(appSettings.yellowThresh2));
set(handles.yellowThresh3Edit,'String',string(appSettings.yellowThresh3));
set(handles.blueThreshEdit,'String',string(appSettings.blueThresh));
set(handles.shapeBound1Edit,'String',string(appSettings.shapeBound1));
set(handles.shapeBound2Edit,'String',string(appSettings.shapeBound2));
set(handles.minAreaEdit,'String',string(appSettings.minArea));

% --- Executes during object creation, after setting all properties.
function FoVEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FoVEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function FoVEdit_Callback(hObject, eventdata, handles)
% hObject    handle to FoVEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FoVEdit as text
%        str2double(get(hObject,'String')) returns contents of FoVEdit as a double
