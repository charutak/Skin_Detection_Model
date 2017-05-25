 function [ net ] = NNPred( x,t)
    net = feedforwardnet(5,'trainbr');
    [net,~] = train(net,x',t');    
    i = 0:255;    
    net = net(i);    
end
