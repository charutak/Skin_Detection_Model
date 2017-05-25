function [ PixelProbability ] = Gaussian( Y,Cb,Cr,net)

    %ypred = NNfunction(Y);
    %ypred = net(Y);
    ypred = net(:,Y+1);
    
    m = [ypred(1);ypred(2)];
    
    C =  [ypred(3),ypred(4);
         ypred(5),ypred(6)];
 
    x = [Cb;Cr];

    Cinv = inv(C);

    Diff = x-m;

    PixelProbability = exp(-0.5*Diff'*Cinv*Diff);

end

