
%Converts the given set of images to the desired color space

for i = 1:size(jpegFiles)
    eval(['temp = ' 'ImageArray' num2str(i) ';'])
    output = convert(temp, format);
    fprintf(1, 'Now converting Image number : %d to %s from RGB Color Space\n', i, format);
    eval(['ImageArrayconv' num2str(i) '= output;'])
end
