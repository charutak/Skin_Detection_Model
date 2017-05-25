
function [ output ] = convert( input , type )
% converts an image to the desired color space
    R = input( :, :, 1);
    G = input( :, :, 2);
    B = input( :, :, 3);
    converted = 0; 
    
    if ( strcmp(type,'YUV') )
       Y = 0.2990 * R + 0.587 * G + 0.11140 * B;
       U = -0.2990 * R - 0.587 * G + 0.886 * B; 
       V = 0.701 * R - 0.587 * G - 0.114 * B;
       output = cat(3,Y,U,V);
       converted = 1;
    end
    
    if ( strcmp(type,'YCbCr') )
       Y = 0.2990 * R + 0.587 * G + 0.11140 * B;
       Cb = -0.1687 * R - 0.3313 * G + 0.5 * B + 128; 
       Cr = 0.5 * R - 0.4187 * G - 0.0813 * B + 128;
       output = cat(3,Y,Cb,Cr);
       converted = 1;
    end
    
    
    if ( strcmp(type,'YIQ') )
       Y = 0.2990 * R + 0.587 * G + 0.11140 * B;
       I = 0.595879 * R - 0.274133 * G + 0.321746 * B; 
       Q = 0.211205 * R - 0.523083 * G - 0.311878 * B;
       output = cat(3,Y,I,Q);
       converted = 1;
    end
    
    if ( converted == 0 ) 
        errorMessage = sprintf('Error: File Format %s not supported:\n', type);
        uiwait(warndlg(errorMessage));
        return;
    end
    
end

