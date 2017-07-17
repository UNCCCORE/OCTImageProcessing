function defaultSettings
%This function recreates the settings.mat file with the default settings in
%this script

baseLocationsRig = zeros(9,2); %base locations
rigOrigin = [60 10 50]; %vector to rig origin in camera (cam) cordinates (cm)
markDistFromCoM = [1.25 1.25]; %dist from fore and aft marks (respectivly) from center of mass of turbine (cm)
FoV = [54.4 37.8]; %full horizontal and vertical angular FoV (degrees)
Cp = 0.5; %Cp of system
kParms = ones(1,5); %constants for paramterization of Cl and Cd [k0 k1 k0_bar k1_bar k2_bar]
rho = 1000; %density of working fluid (kg/m^3)
Fb = 0.0997; %net bouyant force (N)
dragScreenDia = 6; %diameter of drag screen (cm)

programSettings = struct('baseLocationsRig',baseLocationsRig,...
    'distToRigOrigin',rigOrigin,...
    'markDistFromCoM',markDistFromCoM,...
    'FoV',FoV,...
    'Cp',Cp,...
    'kParms',kParms,...
    'rho',rho,...
    'Fb',Fb,...
    'dragScreenDia', dragScreenDia);

save(fullfile(cd, 'Settings','programSettings.mat'),'programSettings');

end

