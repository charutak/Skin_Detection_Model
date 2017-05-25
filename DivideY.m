function [ BeginEnd, Mean, CovMat] = DivideY( SortedArray , N )

    Min = min(SortedArray);
    Ymin = Min(1);
    Max = max(SortedArray);
    Ymax = Max(1);
    
    
    A = zeros(Ymax - Ymin + 1);
    currentp = 1;
    A(1) = SortedArray(1,1);
    for i = 1:size(SortedArray,1)
        if ( SortedArray(i,1) ~= A(currentp) )
            currentp = currentp + 1;
            A(currentp) = SortedArray(i,1);
        end
    
    end
    A = A(1:currentp);
    Size = currentp;
    
    if ( Size < N ) 
        fprintf('Value of n too large, proceeding with N = %d', Size);
        N = Size;
    end
    
    
    num = floor ( Size / N);
    rem = mod ( Size, N );
    
    Mean = zeros(N,2);
    BeginEnd = zeros(N,2);
    CovMat = zeros(N,4);
    cY = 1;
    t = 0;
    
    for i = 1:N
        startp = cY; 
        t = t + num;
        if i <= rem 
            t = t + 1;
        end
        while  (( cY < size(SortedArray,1)) && (SortedArray(cY) <= A(t) ))
            cY = cY + 1;
        end
        endp = cY-1;
        fprintf( 'i =  : %d  startp =  : %d  endp =  : %d t =  : %d\n', i,startp,endp,t);
        BeginEnd(i,1) = SortedArray(startp,1);
        BeginEnd(i,2) = SortedArray(endp,1);
        Mean(i,1) = mean(SortedArray(startp:endp,2));        
        Mean(i,2) = mean(SortedArray(startp:endp,3));
        
        t1 = cov(SortedArray(startp:endp,2),SortedArray(startp:endp,3));        
        t1 = t1(:)';
        CovMat(i,:) = t1;
    
    end
    
end

