
    q1 = zeros(9);
    
    [ BeginEnd, Mean, CovMat ] = DivideY(SortedArray, N);
    NInput = (BeginEnd(:,1) + BeginEnd(:,2) ) / 2;
    NOutput = [Mean,CovMat];
    net = NNPred(NInput,NOutput);
    pindex = 1;
    j = 1;
    for  pop = 0.1:0.1:0.9
       fprintf('p = %d \n', pop);
       ErrorMat;
       q1(j) = q;
       pindex = pindex+1;
       j = j+1;
    end
        
    

