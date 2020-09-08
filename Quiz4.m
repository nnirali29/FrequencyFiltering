function Quiz4(filename, kind,type,D0,n)

 f = imread(filename); 
    f=im2double(f); 
    figure;
    subplot(2,2,1);
    imshow(f);
    title('Original Image');

    PQ = paddedsize(size(f)); 
    F = fft2(f,PQ(1),PQ(2)); 
    Fs = fftshift(F); 
    Fs_log=log(1+abs(Fs)); 
    subplot(2,2,2);
    imshow(Fs_log, []);
    title('Power Spectrum');
    
    
    if kind == "low"
        H = lpfilter(type,PQ(1),PQ(2),D0,n); 
    else
        H = hpfilter(type,PQ(1),PQ(2),D0,n);
    end
    
    G = H.*F;
    Gs = fftshift(G); 
    Gs_log=log(1+abs(Gs));
    subplot(2,2,3);
    imshow(Gs_log, []);
    title('Filtered Power Spectrum');
    
    g = real(ifft2(G)); 
    g = g(1:size(f,1), 1:size(f,2)); 
    subplot(2,2,4);
    imshow(g);
    title('Filtered Image');
    
    
end

