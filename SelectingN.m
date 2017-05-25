
    q1 = zeros(size(1:50:255));
    pop = 0.3;
    j = 1;
    for i = 1:50:255

        [ BeginEnd, Mean, CovMat ] = DivideY(SortedArray, i);
        NInput = (BeginEnd(:,1) + BeginEnd(:,2) ) / 2;
        NOutput = [Mean,CovMat];
    
        net = NNPred(NInput,NOutput);
        ErrorMat;
        q1(j) = q;
        j = j + 1;
    
    end


