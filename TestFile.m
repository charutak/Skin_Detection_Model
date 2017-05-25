function [ maskIm ] = TestFile( Image , net, pop, format)

% Develops the map for the image

    [tx, ty, ~] = size(Image);
    maskIm  = 255*ones(size(Image));
    pp = zeros(tx,ty);
    
    
    C = convert(Image, format);
    ConvertedTemp = double(C);
    
    for i = 1:tx
        for j = 1:ty
            %fprintf('i = %d, j = %d\n',i,j);
            prob = Gaussian(ConvertedTemp(i,j,1),ConvertedTemp(i,j,2),ConvertedTemp(i,j,3),net);
            pp(i,j) = prob;
            if ((  prob > pop ) && ( ConvertedTemp(i,j,1) > 15 ))
                maskIm(i,j,1) = Image(i,j,1);
                maskIm(i,j,2) = Image(i,j,2);
                maskIm(i,j,3) = Image(i,j,3);     
            end
        end
    end


end

