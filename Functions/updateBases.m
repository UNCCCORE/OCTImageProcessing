function updateBases(handles)
%This function updates the settings variable with the base locations
%provided by the user

global appSettings
baseLocationsStr = strings(9,2);

baseLocationsStr(1,1) = get(handles.oct1x, 'String');
baseLocationsStr(1,2) = get(handles.oct1y, 'String');

baseLocationsStr(2,1) = get(handles.oct2x, 'String');
baseLocationsStr(2,2) = get(handles.oct2y, 'String');
   
baseLocationsStr(3,1) = get(handles.oct3x, 'String');
baseLocationsStr(3,2) = get(handles.oct3y, 'String');

baseLocationsStr(4,1) = get(handles.oct4x, 'String');
baseLocationsStr(4,2) = get(handles.oct4y, 'String');

baseLocationsStr(5,1) = get(handles.oct5x, 'String');
baseLocationsStr(5,2) = get(handles.oct5y, 'String');

baseLocationsStr(6,1) = get(handles.oct6x, 'String');
baseLocationsStr(6,2) = get(handles.oct6y, 'String');

baseLocationsStr(7,1) = get(handles.oct7x, 'String');
baseLocationsStr(7,2) = get(handles.oct7y, 'String');

baseLocationsStr(8,1) = get(handles.oct8x, 'String');
baseLocationsStr(8,2) = get(handles.oct8y, 'String');

baseLocationsStr(9,1) = get(handles.oct9x, 'String');
baseLocationsStr(9,2) = get(handles.oct9y, 'String');

for i=1:9
    for j=1:2
        appSettings.baseLocationsRig(i,j) = str2double(baseLocationsStr(i,j));
    end
end

programSettings = appSettings;
save(fullfile(cd, 'Settings','programSettings.mat'),'programSettings');


end

