function [ marksImUpdated ] = editMarks( I,marksIm )
%EIDTMARKS this function allows the user to manually edit or assign the
%location of each turbine mark.

%open new figure and show image
tempFigure = figure();
imagePlot = imshow(I);

hg = hggroup();

for i=1:9
    imDots(i,1) = impoint(hg,marksIm{i,1}(1),marksIm{i,2}(1));
    setString(imDots(i,1),string(i) + 'f');
    imDots(i,2) = impoint(hg,marksIm{i,1}(2),marksIm{i,2}(2));
    setString(imDots(i,2),string(i) + 'a');
end

% text('Press any key to finish editing');
response = waitforbuttonpress();
while response ~= 1
    response = waitforbuttonpress();
end

for i=1:9
    tempA = [0;0];
    tempA = getPosition(imDots(i,1));
    marksImUpdated{i,1}(1) = tempA(1);
    marksImUpdated{i,2}(1) = tempA(2);
    
    tempB = [0;0];
    tempB = getPosition(imDots(i,2));
    marksImUpdated{i,1}(2) = tempB(1);
    marksImUpdated{i,2}(2) = tempB(2);
end
close;

end

