function [q]   = Error (Image,l)
    
    o = double(Image);
    l1 = l(:,:,1) + l(:,:,2) + l(:,:,3);
    o1 = o(:,:,1) + o(:,:,2) + o(:,:,3);
    
    binaryMask = l1 == 765;
    binaryOMask = o1 == 765;
    
    compare = binaryMask == binaryOMask;
    
    
    [u,v] = size(l1);
    q = 100 * ( sum ( sum (compare ) ))  / (u*v);
    q = 100 - q;
    
end