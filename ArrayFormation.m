%  Making the Array out of all the pixels

Yarray = zeros(50000000,3);
counter = 1;
for u = 1:size(jpegFiles)
    eval(['Img = ' 'ImageArrayconv' num2str(u) ';'])
    eval(['Msk = ' 'MaskArray' num2str(u) ';'])
    [X , Y , ~ ] = size(Img);
    temp = double(Msk);
    MaskCompare = temp(:,:,1) + temp(:,:,2) + temp(:,:,3);
    fprintf(1, 'Now forming Array from Image number : %d \n', u);
    for i = 1:X
        for j = 1:Y 
            if MaskCompare (i, j) < 765             
                Yarray(counter,1) = Img(i,j,1);
                Yarray(counter,2) = Img(i,j,2);
                Yarray(counter,3) = Img(i,j,3);
                counter = counter + 1;
            end
        end
    end

end
