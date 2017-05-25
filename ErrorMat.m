
r = randi(555,5,1);


for i = 1:5

    fprintf('Image number : %d \n', r(i));
    eval(['Img = ' 'ImageArray' num2str(r(i)) ';'])
    [l] = TestFile(Img,net,pop, format);
    eval(['Msk = ' 'MaskArray' num2str(r(i)) ';'])
    q(i) = Error(Msk,l);
    
end

q = mean(q);

