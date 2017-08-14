function OCTResults = checkHeight(appSettings,imagePath)
%% Assign structures values to local variables
% image processing constants
distToRigOrigin = appSettings.distToRigOrigin; %vector to rig origin in cam cordinates (cm)
FoV = appSettings.FoV; %degrees
markDistFromCoM = appSettings.markDistFromCoM;
basesRig = appSettings.baseLocationsRig; %cordinates of bases in rig coridinate system (cm)
basesCam = zeros(9,3); %cordinates of bases in cam coridinate system (cm)

% % power related constants
% rho = appSettings.rho; %kg/m^3
% Fb = appSettings.Fb; %N
% Cp = appSettings.Cp;
% 
% k1 = appSettings.kParms(1);
% 
% k0_bar = appSettings.kParms(2);
% k2_bar = appSettings.kParms(3); 
% 
% dia = appSettings.dragScreenDia; %m
% freestreamVelocity = appSettings.freestreamVelocity; %m/sec

%image proc constants
redThresh = appSettings.redThresh;
yellowThresh1 = appSettings.yellowThresh1;
yellowThresh2 = appSettings.yellowThresh2;
yellowThresh3 = appSettings.yellowThresh3;
blueThresh = appSettings.blueThresh;
shapeBound1 = appSettings.shapeBound1;
shapeBound2 = appSettings.shapeBound2;
minArea = appSettings.minArea;

for i=1:9
    basesCam(i,:) = basesRig(i,:) + distToRigOrigin;
end

yCam = basesCam(:,2); % cm

%% Image preperation
%Import image
I = imread(imagePath);
imageDim = [length(I(1,:,1)) length(I(:,1,1))];
%axes(handles.PRW),imshow(I);
imshow(I);

%Filtering
h = fspecial('average', [3 3]);
I2 = imfilter(I,h);
% imshow(I2);

%% Marker recognition
%Isolate into three colors
%redness
Ithresh{1}= (I2(:,:,1) - max(I2(:,:,2), I2(:,:,3))) > redThresh;
Ithresh{1} = imfill(Ithresh{1},'holes');
% figure();
% imshow(Ithresh{1});

%yellowness
Ithresh{2} = ((I2(:,:,1) > yellowThresh1) & (I2(:,:,2) > yellowThresh2) & (I2(:,:,3) < yellowThresh3));
Ithresh{2} = imfill(Ithresh{2},'holes');
% figure();
% imshow(Ithresh{2});

%blueness
Ithresh{3} = (I2(:,:,3) - max(I2(:,:,1), I2(:,:,2))) > blueThresh;
Ithresh{3} = imfill(Ithresh{3},'holes');
% figure();
% imshow(Ithresh{3});

%Get region props for each level
labels{1} = bwlabel(Ithresh{1});
props{1} = regionprops(labels{1});

labels{2} = bwlabel(Ithresh{2});
props{2} = regionprops(labels{2});

labels{3} = bwlabel(Ithresh{3});
props{3} = regionprops(labels{3});

%% Marker location in image frame
% create array to hold mark locations
marksIm = int16.empty;
marksCam = int16.empty;
for i=1:9
    for j=1:2
        marksIm{i,j} = [0 0];
    end
end
for i=1:9
    for j=1:3
        marksCam{i,j} = [0 0];
    end
end

cEx = 0;
sEx = 0;
tEx = 0;

k = 1;
for j=1:3
    for i=1:length(props{j})
        propsArea = props{j}(i).Area;
        boundArea = props{j}(i).BoundingBox(3)*props{j}(i).BoundingBox(4);
        AR = max(props{j}(i).BoundingBox(3),props{j}(i).BoundingBox(4))/min(props{j}(i).BoundingBox(3),props{j}(i).BoundingBox(4));
        if AR > 3 || propsArea < minArea
            %shapes(j,i) = '.';
        elseif propsArea <= shapeBound1*boundArea % it's a cross

            if marksIm{k,1}(1) == 0
                marksIm{k,1}(1) = props{j}(i).Centroid(1);
                marksIm{k,2}(1) = props{j}(i).Centroid(2);
            elseif marksIm{k,1}(2) == 0
                marksIm{k,1}(2) = props{j}(i).Centroid(1);
                marksIm{k,2}(2) = props{j}(i).Centroid(2);
            else
                sEx = sEx+1;
                fprintf('%0.0f . %0.0f More square dots found than possible in %0.0f threshold. Excess dots ignored\n',j,sEx,j);
                %msgbox(msg);
            end
        elseif propsArea > shapeBound2*boundArea  % it's a circle
            if marksIm{k+1,1}(1) == 0
                marksIm{k+1,1}(1) = props{j}(i).Centroid(1);
                marksIm{k+1,2}(1) = props{j}(i).Centroid(2);
            elseif marksIm{k+1,1}(2) == 0
                marksIm{k+1,1}(2) = props{j}(i).Centroid(1);
                marksIm{k+1,2}(2) = props{j}(i).Centroid(2);
            else
                cEx =cEx+1;
                sprintf('%0.0f . %0.0f More circular dots found than possible in %0.0f threshold. Excess dots ignored\n',j,cEx,j);
                %msgbox(msg);
            end
        elseif propsArea > shapeBound1*boundArea && propsArea <=shapeBound2*boundArea % it's a triangle
            if marksIm{k+2,1}(1) == 0
                marksIm{k+2,1}(1) = props{j}(i).Centroid(1);
                marksIm{k+2,2}(1) = props{j}(i).Centroid(2);
            elseif marksIm{k+2,1}(2) == 0
                marksIm{k+2,1}(2) = props{j}(i).Centroid(1);
                marksIm{k+2,2}(2) = props{j}(i).Centroid(2);
            else
                tEx = tEx+1;
                sprintf('%0.0f . %0.0f More triangular dots found than possible in %0.0f threshold. Excess dots ignored\n',j,tEx,j);
                %msgbox(msg);
            end
            %         else
            %             shapes(j,i) = '_';
        end
    end
    k = k + 3;
end

% convert to water channel numbering
marksCode = marksIm;
marksIm{1,1}(:) = marksCode{2,1}(:);
marksIm{2,1}(:) = marksCode{5,1}(:);
marksIm{3,1}(:) = marksCode{8,1}(:);
marksIm{4,1}(:) = marksCode{1,1}(:);
marksIm{5,1}(:) = marksCode{4,1}(:);
marksIm{6,1}(:) = marksCode{7,1}(:);
marksIm{7,1}(:) = marksCode{3,1}(:);
marksIm{8,1}(:) = marksCode{6,1}(:);
marksIm{9,1}(:) = marksCode{9,1}(:);

marksIm{1,2}(:) = marksCode{2,2}(:);
marksIm{2,2}(:) = marksCode{5,2}(:);
marksIm{3,2}(:) = marksCode{8,2}(:);
marksIm{4,2}(:) = marksCode{1,2}(:);
marksIm{5,2}(:) = marksCode{4,2}(:);
marksIm{6,2}(:) = marksCode{7,2}(:);
marksIm{7,2}(:) = marksCode{3,2}(:);
marksIm{8,2}(:) = marksCode{6,2}(:);
marksIm{9,2}(:) = marksCode{9,2}(:);

% plotAllMarks(marksIm);

hold on;
for j=1:9
    tempString1 =  string(j) +' fore' + '\rightarrow';
    markPlot(j,1) = plot(marksIm{j,1}(1),marksIm{j,2}(1),'o','Color','White');
    markText(j,1) = text(marksIm{j,1}(1),marksIm{j,2}(1),char(tempString1),'Color','White','HorizontalAlignment','Right');
    
    tempString2 = '\leftarrow' + string(j) +' aft';
    markPlot(j,2) = plot(marksIm{j,1}(2),marksIm{j,2}(2),'o','Color','White');
    markText(j,2) = text(marksIm{j,1}(2),marksIm{j,2}(2),char(tempString2),'Color','White','HorizontalAlignment','Left');
end


marksOK = questdlg('Are the marks OK?','Check marks','Yes','Edit Marks','Yes');
while strcmp(marksOK,'Edit Marks')
    marksIm = editMarks(I2,marksIm);
    delete(markPlot);
    delete(markText);
    
    for j=1:9
        tempString1 =  string(j) +' fore' + '\rightarrow';
        markPlot(j,1) = plot(marksIm{j,1}(1),marksIm{j,2}(1),'o','Color','White');
        markText(j,1) = text(marksIm{j,1}(1),marksIm{j,2}(1),char(tempString1),'Color','White','HorizontalAlignment','Right');
        
        tempString2 = '\leftarrow' + string(j) +' aft';
        markPlot(j,2) = plot(marksIm{j,1}(2),marksIm{j,2}(2),'o','Color','White');
        markText(j,2) = text(marksIm{j,1}(2),marksIm{j,2}(2),char(tempString2),'Color','White','HorizontalAlignment','Left');
    end
    
    marksOK = questdlg('Are the marks OK?','Check marks','Yes','Edit Marks','Yes');
end


%% get absolute posistions

% get absolute positions
CoMIm = zeros(9,2);
CoMCam = zeros(9,3);

for i=1:9
    tempA = [0;0;0];
    tempA = getMarkLocation(marksIm{i,1}(1), marksIm{i,2}(1),yCam(i),imageDim,FoV);
    marksCam{i,1}(1) = tempA(1);
    marksCam{i,2}(1) = tempA(2);
    marksCam{i,3}(1) = tempA(3);
    
    tempB = [0;0;0];
    tempB = getMarkLocation(marksIm{i,1}(2), marksIm{i,2}(2),yCam(i),imageDim,FoV);
    marksCam{i,1}(2) = tempB(1);
    marksCam{i,2}(2) = tempB(2);
    marksCam{i,3}(2) = tempB(3);
    
    tempC = getTurbineCoM([marksCam{i,1}(1) marksCam{i,3}(1)],[marksCam{i,1}(2) marksCam{i,3}(2)],[marksIm{i,1}(1) marksIm{i,2}(1)],[marksIm{i,1}(2) marksIm{i,2}(2)]);
    
    CoMCam(i,1)= tempC(1);
    CoMCam(i,3) = tempC(2);
    CoMCam(i,2) = yCam(i);
end

% ask user for position of hidden turbines
% axes(handles.PRW);

for i=1:9
    if marksIm{i,1}(1) == 0 && marksIm{i,1}(2) == 0
        %plot all turbines with labels
        hold on;
        for j=1:9
            if not(isnan(marksCam{j,1}(1)))
                tempString =  string(j) + '\rightarrow';
                
                plot(marksIm{j,1}(1),marksIm{j,2}(1),'o','Color','White');
                text(marksIm{j,1}(1),marksIm{j,2}(1),char(tempString),'Color','White','HorizontalAlignment','Right');
            end
        end
        
        % ask user to identify which number is the culprit
        tempString = 'Which turbine is hiding turbine number ' + string(i) + '?';
        culpritTurbine = str2double(inputdlg(tempString));
        
        while isnan(culpritTurbine) == 1 || culpritTurbine < 1 || culpritTurbine > 9 || culpritTurbine == i
            tempString = 'Let''s be serious, only numbers 1 through 9 are valid (and you can''t choose the hidden turbine!). Which turbine is hiding turbine number ' + string(i) + '?';
            culpritTurbine = str2double(inputdlg(tempString));
        end
        
        
        %set hidden turbine's location to the culprit's location
        CoMCam(i,1) = CoMCam(culpritTurbine,1);
        CoMCam(i,3) = CoMCam(culpritTurbine,3);
        
    end
end

%% zenith angles and tether lengths
for i=1:9
    basesCam(i,:) = basesRig(i,:) + distToRigOrigin;
    zenith(i,1) = atand(abs(CoMCam(i,1)-basesCam(i,1))/abs(CoMCam(i,3)-basesCam(i,3)));
    heights(i,1) = basesCam(i,3)-CoMCam(i,3);
end

struc OCTResults;
OCTResults.heights = heights;

%% define functions
function markCam = getMarkLocation(xIm,zIm,yCam,imageDim,FoV)
%this function takes the image x and z cordinates, the distnace from the
%camera to the mark, the pixel diminsions of the image, and the half the
%angle field of view and outputs the location of the mark in fixed camera
%cordinates (in cm).
if xIm ~= 0 && zIm ~= 0
xFactor = -0.0015*yCam + 1.3244;
zFactor = -0.0019*yCam + 1.1534;

markCam(1) = xFactor*(xIm - (imageDim(1))/2)*(2*yCam*tand(FoV(1)/2))/imageDim(1);
markCam(3) = -zFactor*(zIm - (imageDim(2))/2)*(2*yCam*tand(FoV(2)/2))/imageDim(2);

markCam(2) = yCam;

%--------Temp Method for charterization------------%%
%     px2cm = 0.01285347; %cm/px
%     markCam(1) = (xIm - (imageDim(1))/2)*px2cm;
%     markCam(3) = -(zIm - (imageDim(2))/2)*px2cm;

%----------older methods--------------%
%     N = 1.33^2; % ratio (n2/n1)^2 simplified for water and air (1.33/1)^2
%     Kx = imageDim(1)^2/(2*tand(FoV(1)/2)*(xIm-imageDim(1)/2))^2 + (N-1)/N;
%     if xIm > imageDim(1)/2
%         markCam(1) = 1/0.987*sqrt(yCam^2/(N*Kx));
%     else
%         markCam(1) = -1/0.987*sqrt(yCam^2/(N*Kx));
%     end
%
%     Kz = imageDim(2)^2/(2*tand(FoV(2)/2)*(zIm-imageDim(2)/2))^2 + (N-1)/N;
%     if zIm > imageDim(2)/2
%         markCam(3) = -1/1.086*sqrt(yCam^2/(N*Kz));
%     else
%         markCam(3) = 1/1.086*sqrt(yCam^2/(N*Kz));
%     end

%     markCam(1) = (xIm - (imageDim(1))/2)*(2*yCam*tand(FoV(1)/2))/imageDim(1);
%     markCam(3) = -(zIm - (imageDim(2))/2)*(2*yCam*tand(FoV(2)/2))/imageDim(2);

% distToGlass =32.25*2.545;
% n1 = 1.00029;
% n2 = 1.33;
%
% markCam(1) = ((yCam-distToGlass)*(n1/n2)+distToGlass)*(xIm - imageDim(1)/2)*(2*tand(FoV(1)/2))/imageDim(1);
% markCam(3) = -((yCam-distToGlass)*(n1/n2)+distToGlass)*(zIm - imageDim(2)/2)*(2*tand(FoV(2)/2))/imageDim(2);


%     FoV = FoV*pi/180; %convert degrees to radians
%     FoV = FoV/2;
%
%     psiZ = (xIm - imageDim(1)/2)/(imageDim(1)/2)*FoV(1); %the rotation about xCam
%     psiX = (zIm - imageDim(2)/2)/(imageDim(2)/2)*FoV(2); %the rotation about zCam
%
%     Rx = [1 0 0; 0 cos(psiX) -sin(psiX); 0 sin(psiX) cos(psiX)]; %rotation matrix about xCam by psiX
%     Rz = [cos(psiZ) -sin(psiZ) 0; sin(psiZ) cos(psiZ) 0; 0 0 1]; %rotation matrix about zCam by psiZ
%
%     u0 = [0;1;0]; %initial unit vector in yCam direction
%
%     u1 = Rx*Rz*u0; %new unit vector after applying rotations psiX and psiZ
%
%     F = yCam/u1(2); %scale factor to find xCam and zCam where F*u1 = [xCam;yCam;zCam]
%
%     markCam = F.*u1; %vector from camera origin to mark location
 else
     markCam = [0;0;0];
 end
end

    function CoM = getTurbineCoM(foreCam,aftCam,foreIm,aftIm)
        %this function takes the cordinates of two dots (in any cord system) and
        %find the center of mass. Note that user interaction for the no dots case
        %is not handled but is left for the master script.
        
        CoM = [0 0];
        fore2CoM = markDistFromCoM(1); % horizontal distance from fore mark to CoM (cm)
        aft2CoM = markDistFromCoM(1); % horizontal distance from aft mark to CoM (cm)
        
        if foreCam(1) ~= 0 && aftCam(1) ~= 0
            if foreCam(1) < aftCam(1) %check to make sure fore and aft are correctly assigned
                % calculate CoM position using both markes
                CoM(1) = mean([foreCam(1) + fore2CoM, aftCam(1) - aft2CoM]);
                CoM(2) = mean([foreCam(2), aftCam(2)]);
            else
                fprintf('Fore and aft markes are mixed up. fore(1) = %0.00f\n',foreCam(1));
            end
        elseif foreCam(1) ~= 0 || aftCam(1) ~= 0
            % reassign varables
            if foreCam(1) ~= 0
                unknownMarkCam = foreCam;
                unknownMarkIm = foreIm;
            else
                unknownMarkCam = aftCam;
                unknownMarkIm = aftIm;
            end
            
            % ask user if given mark is fore or aft
            %     axes(handles.PRW);
            hold on;
            tempPlot = plot(unknownMarkIm(1),unknownMarkIm(2),'o','Color','Red','LineWidth',2);
            
            markerLocation = inputdlg('Is this mark fore or aft? (F or A):');
            while strcmpi(markerLocation,'F') == 0 & strcmpi(markerLocation, 'A') == 0
                markerLocation = inputdlg('Is this mark fore or aft? Enter only "F" or "A":');
            end
            
            set(tempPlot, 'Visible', 'off');
            clear tempPlot;
            hold off;
            
            % calculate position based on user choice
            if strcmpi(markerLocation,'F') == 1
                CoM(1) = unknownMarkCam(1) + fore2CoM;
                CoM(2) = unknownMarkCam(2);
            elseif strcmpi(markerLocation,'A') == 1
                CoM(1) = unknownMarkCam(1) - aft2CoM;
                CoM(2) = unknownMarkCam(2);
            end
        else
            % turbine is completly hidden, ask user where it is
            CoM(1) = NaN;
            CoM(2) = NaN;
        end
    end

    function plotAllMarks(marks)
        hold on;
        for i=1:9
            for j=1:2
                plot(marks{i,1}(j),marks{i,2}(j),'o','Color','White');
            end
        end
        hold off;
    end
end
