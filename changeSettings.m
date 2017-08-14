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

% Last Modified by GUIDE v2.5 09-Aug-2017 14:27:28

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
resetBackgroundColor(handles);

dataInvalid = 0;

%get values stored in edit boxes
distToRigOriginStr = get(handles.distToRigOriginEdit,'String');
[distToRigOriginStrSpl, distToRigOriginStrMatches]  = strsplit(distToRigOriginStr,'\s*,\s*','DelimiterType','RegularExpression');
distToRigOrigin = str2double(distToRigOriginStrSpl);

if length(distToRigOriginStrMatches) ~= 2 || max(isnan(distToRigOrigin)) ~= 0
    dataInvalid = 1;
    set(handles.distToRigOriginEdit, 'BackgroundColor','Red');
end

markDistFromCoMStr = get(handles.markDistFromCoMEdit,'String');
[markDistFromCoMStrSpl, markDistFromCoMStrMatches]  = strsplit(markDistFromCoMStr,'\s*,\s*','DelimiterType','RegularExpression');
markDistFromCoM = str2double(markDistFromCoMStrSpl);

if length(markDistFromCoMStrMatches) ~= 1 || max(isnan(markDistFromCoM)) ~= 0
    dataInvalid = 1;
    set(handles.markDistFromCoMEdit,'BackgroundColor','Red');
end

FoVStr = get(handles.FoVEdit,'String');
[FoVStrSpl, FoVStrMatches]  = strsplit(FoVStr,'\s*,\s*','DelimiterType','RegularExpression');
FoV = str2double(FoVStrSpl);

if length(FoVStrMatches) ~= 1 || max(isnan(FoV)) ~= 0
    dataInvalid = 1;
    set(handles.FoVEdit,'BackgroundColor','Red');
end

kParmsStr = get(handles.kParmsEdit,'String');
[kParmsStrSpl kParmsStrMatches] = strsplit(kParmsStr,'\s*,\s*','DelimiterType','RegularExpression');
kParms = str2double(kParmsStrSpl);

if length(kParmsStrMatches) ~= 2 || max(isnan(kParms)) ~= 0
    dataInvalid = 1;
    set(handles.kParmsEdit,'BackgroundColor','Red');
end

Cp = str2double(get(handles.CpEdit,'String'));
if isnan(Cp) == 1
    dataInvalid = 1;
    set(handles.CpEdit,'BackgroundColor','Red');
end

rho = str2double(get(handles.rhoEdit,'String'));
if isnan(rho) == 1
    dataInvalid = 1;
    set(handles.rhoEdit, 'BackgroundColor', 'Red');
end

Fb = str2double(get(handles.FbEdit,'String'));
if isnan(Fb) == 1
    dataInvalid = 1;
    set(handles.FbEdit, 'BackgroundColor','Red');
end

dragScreenDia = str2double(get(handles.dragScreenDiaEdit,'String'));
if isnan(Fb) == 1
    dataInvalid = 1;
    set(handles.dragScreenDiaEdit,'BackgroundColor','Red');
end

freestreamVelocity = str2double(get(handles.freestreamVelocityEdit,'String'));
if isnan(freestreamVelocity) == 1
    dataInvalid = 1;
    set(handles.freestreamVelocityEdit,'BackgroundColor','Red');
end

redThresh = str2double(get(handles.redThreshEdit,'String'));
if isnan(redThresh) == 1
    dataInvalid = 1;
    set(handles.redThreshEdit,'BackgroundColor','Red');
end

yellowThresh1 = str2double(get(handles.yellowThresh1Edit,'String'));
if isnan(yellowThresh1) == 1
    dataInvalid = 1;
    set(handles.yellowThresh1Edit,'BackgroundColor','Red');
end

yellowThresh2 = str2double(get(handles.yellowThresh2Edit,'String'));
if isnan(yellowThresh2) == 1
    dataInvalid = 1;
    set(handles.yellowThresh2Edit,'BackgroundColor','Red');
end

yellowThresh3 = str2double(get(handles.yellowThresh3Edit,'String'));
if isnan(yellowThresh3) == 1
    dataInvalid = 1;
    set(handles.yellowThresh3Edit,'BackgroundColor','Red');
end

blueThresh = str2double(get(handles.blueThreshEdit,'String'));
if isnan(blueThresh) == 1
    dataInvalid = 1;
    set(handles.blueThreshEdit,'BackgroundColor','Red');
end

shapeBound1= str2double(get(handles.shapeBound1Edit,'String'));
if isnan(shapeBound1) == 1
    dataInvalid = 1;
    set(handles.shapeBound1Edit,'BackgroundColor','Red');
end

shapeBound2 = str2double(get(handles.shapeBound2Edit,'String'));
if isnan(shapeBound2) == 1
    dataInvalid = 1;
    set(handles.shapeBound2Edit,'BackgroundColor','Red');
end

minArea = str2double(get(handles.minAreaEdit,'String'));
if isnan(minArea) == 1
    dataInvalid = 1;
    set(handles.minAreaEdit,'BackgroundColor','Red');
end

OCTZ1 = str2double(get(handles.OCT1Edit,'String'));
if isnan(OCTZ1) == 1
    dataInvalid = 1;
    set(handles.OCT1Edit,'BackgroundColor','Red');
end

OCTZ2 = str2double(get(handles.OCT2Edit,'String'));
if isnan(OCTZ2) == 1
    dataInvalid = 1;
    set(handles.OCT2Edit,'BackgroundColor','Red');
end

OCTZ3 = str2double(get(handles.OCT3Edit,'String'));
if isnan(OCTZ3) == 1
    dataInvalid = 1;
    set(handles.OCT3Edit,'BackgroundColor','Red');
end

OCTZ4 = str2double(get(handles.OCT4Edit,'String'));
if isnan(OCTZ4) == 1
    dataInvalid = 1;
    set(handles.OCT4Edit,'BackgroundColor','Red');
end

OCTZ5 = str2double(get(handles.OCT5Edit,'String'));
if isnan(OCTZ5) == 1
    dataInvalid = 1;
    set(handles.OCT5Edit,'BackgroundColor','Red');
end

OCTZ6 = str2double(get(handles.OCT6Edit,'String'));
if isnan(OCTZ6) == 1
    dataInvalid = 1;
    set(handles.OCT6Edit,'BackgroundColor','Red');
end

OCTZ7 = str2double(get(handles.OCT7Edit,'String'));
if isnan(OCTZ7) == 1
    dataInvalid = 1;
    set(handles.OCT7Edit,'BackgroundColor','Red');
end

OCTZ8 = str2double(get(handles.OCT8Edit,'String'));
if isnan(OCTZ8) == 1
    dataInvalid = 1;
    set(handles.OCT8Edit,'BackgroundColor','Red');
end

OCTZ9 = str2double(get(handles.OCT9Edit,'String'));
if isnan(OCTZ9) == 1
    dataInvalid = 1;
    set(handles.OCT9Edit,'BackgroundColor','Red');
end

if dataInvalid == 1
    msgbox('Data was not formated correctly. Settings were not saved.', 'Settings Not Saved');
else
    appSettings.distToRigOrigin = distToRigOrigin;
    appSettings.markDistFromCoM = markDistFromCoM;
    appSettings.FoV = FoV;
    appSettings.Cp = Cp;
    appSettings.kParms = kParms;
    appSettings.rho = rho;
    appSettings.Fb = Fb;
    appSettings.dragScreenDia = dragScreenDia;
    appSettings.freestreamVelocity = freestreamVelocity;
    appSettings.redThresh = redThresh;
    appSettings.yellowThresh1 = yellowThresh1;
    appSettings.yellowThresh2 = yellowThresh2;
    appSettings.yellowThresh3 = yellowThresh3;
    appSettings.blueThresh = blueThresh;
    appSettings.shapeBound1 = shapeBound1;
    appSettings.shapeBound2 = shapeBound2;
    appSettings.minArea = minArea;
    appSettings.baseLocationsRig(1,3) = OCTZ1;
    appSettings.baseLocationsRig(2,3) = OCTZ2;
    appSettings.baseLocationsRig(3,3) = OCTZ3;
    appSettings.baseLocationsRig(4,3) = OCTZ4;
    appSettings.baseLocationsRig(5,3) = OCTZ5;
    appSettings.baseLocationsRig(6,3) = OCTZ6;
    appSettings.baseLocationsRig(7,3) = OCTZ7;
    appSettings.baseLocationsRig(8,3) = OCTZ8;
    appSettings.baseLocationsRig(9,3) = OCTZ9;

    programSettings = appSettings;
    save(fullfile(cd, 'Settings','programSettings.mat'),'programSettings');
    
    msgbox('Settings saved locally and to file.','Settings Saved!');
end

% --- Executes on button press in resetToDefaults.
function resetToDefaults_Callback(hObject, eventdata, handles)
% hObject    handle to resetToDefaults (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global appSettings;

resetOK = questdlg('Reseting to the defaults will reset all settings to the defaults, including the base locations to NaN. Do you really want to do this?','Confirm Reset');

if strcmpi(resetOK,'Yes')
    resetBackgroundColor(handles);
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

set(handles.OCT1Edit,'String',string(appSettings.baseLocationsRig(1,3)));
set(handles.OCT2Edit,'String',string(appSettings.baseLocationsRig(2,3)));
set(handles.OCT3Edit,'String',string(appSettings.baseLocationsRig(3,3)));
set(handles.OCT4Edit,'String',string(appSettings.baseLocationsRig(4,3)));
set(handles.OCT5Edit,'String',string(appSettings.baseLocationsRig(5,3)));
set(handles.OCT6Edit,'String',string(appSettings.baseLocationsRig(6,3)));
set(handles.OCT7Edit,'String',string(appSettings.baseLocationsRig(7,3)));
set(handles.OCT8Edit,'String',string(appSettings.baseLocationsRig(8,3)));
set(handles.OCT9Edit,'String',string(appSettings.baseLocationsRig(9,3)));



function resetBackgroundColor(handles)
%this function resets the background color of all edit boxes
set(handles.distToRigOriginEdit,'BackgroundColor','White');
set(handles.markDistFromCoMEdit,'BackgroundColor','White');
set(handles.FoVEdit,'BackgroundColor','White');
set(handles.kParmsEdit,'BackgroundColor','White');
set(handles.CpEdit,'BackgroundColor','White');
set(handles.rhoEdit,'BackgroundColor','White');
set(handles.FbEdit,'BackgroundColor','White');
set(handles.dragScreenDiaEdit,'BackgroundColor','White');
set(handles.freestreamVelocityEdit,'BackgroundColor','White');
set(handles.redThreshEdit,'BackgroundColor','White');
set(handles.yellowThresh1Edit,'BackgroundColor','White');
set(handles.yellowThresh2Edit,'BackgroundColor','White');
set(handles.yellowThresh3Edit,'BackgroundColor','White');
set(handles.blueThreshEdit,'BackgroundColor','White');
set(handles.shapeBound1Edit,'BackgroundColor','White');
set(handles.shapeBound2Edit,'BackgroundColor','White');
set(handles.minAreaEdit,'BackgroundColor','White');
set(handles.OCT1Edit,'BackgroundColor','White');
set(handles.OCT2Edit,'BackgroundColor','White');
set(handles.OCT3Edit,'BackgroundColor','White');
set(handles.OCT4Edit,'BackgroundColor','White');
set(handles.OCT5Edit,'BackgroundColor','White');
set(handles.OCT6Edit,'BackgroundColor','White');
set(handles.OCT7Edit,'BackgroundColor','White');
set(handles.OCT8Edit,'BackgroundColor','White');
set(handles.OCT9Edit,'BackgroundColor','White');

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



function OCT1Edit_Callback(hObject, eventdata, handles)
% hObject    handle to OCT1Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OCT1Edit as text
%        str2double(get(hObject,'String')) returns contents of OCT1Edit as a double


% --- Executes during object creation, after setting all properties.
function OCT1Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OCT1Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OCT2Edit_Callback(hObject, eventdata, handles)
% hObject    handle to OCT2Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OCT2Edit as text
%        str2double(get(hObject,'String')) returns contents of OCT2Edit as a double


% --- Executes during object creation, after setting all properties.
function OCT2Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OCT2Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OCT3Edit_Callback(hObject, eventdata, handles)
% hObject    handle to OCT3Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OCT3Edit as text
%        str2double(get(hObject,'String')) returns contents of OCT3Edit as a double


% --- Executes during object creation, after setting all properties.
function OCT3Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OCT3Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OCT4Edit_Callback(hObject, eventdata, handles)
% hObject    handle to OCT4Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OCT4Edit as text
%        str2double(get(hObject,'String')) returns contents of OCT4Edit as a double


% --- Executes during object creation, after setting all properties.
function OCT4Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OCT4Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OCT5Edit_Callback(hObject, eventdata, handles)
% hObject    handle to OCT5Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OCT5Edit as text
%        str2double(get(hObject,'String')) returns contents of OCT5Edit as a double


% --- Executes during object creation, after setting all properties.
function OCT5Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OCT5Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OCT6Edit_Callback(hObject, eventdata, handles)
% hObject    handle to OCT6Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OCT6Edit as text
%        str2double(get(hObject,'String')) returns contents of OCT6Edit as a double


% --- Executes during object creation, after setting all properties.
function OCT6Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OCT6Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OCT7Edit_Callback(hObject, eventdata, handles)
% hObject    handle to OCT7Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OCT7Edit as text
%        str2double(get(hObject,'String')) returns contents of OCT7Edit as a double


% --- Executes during object creation, after setting all properties.
function OCT7Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OCT7Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OCT8Edit_Callback(hObject, eventdata, handles)
% hObject    handle to OCT8Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OCT8Edit as text
%        str2double(get(hObject,'String')) returns contents of OCT8Edit as a double


% --- Executes during object creation, after setting all properties.
function OCT8Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OCT8Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OCT9Edit_Callback(hObject, eventdata, handles)
% hObject    handle to OCT9Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OCT9Edit as text
%        str2double(get(hObject,'String')) returns contents of OCT9Edit as a double


% --- Executes during object creation, after setting all properties.
function OCT9Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OCT9Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
