function bw = segment_local_threshold(Img, ws,method)
%SEGMENT_LOCAL_THRESHOLD Summary of this function goes here
%   Detailed explanation goes here
    if mod(ws,2) == 0
        ws = ws +1;
    end
        
    Img = double(Img);
    Img = Img/sum(Img(:));
    wsdiv2 = floor(ws/2);
    sI = size(Img);
    th = Img+1;
    
    if( strcmp(method,'MidGrey') )
        se = strel('disk',ceil(ws/2));
        localMinImage = imerode(Img, true(ws).*se.Neighborhood);
        localMaxImage = imdilate(Img, true(ws).*se.Neighborhood);
        th = (localMinImage+localMaxImage)/2;
    elseif( strcmp(method,'Phansalkar')  )
        k = 0.; r = 0.5; p = 2; q = 10;
        Img = (Img-min(Img(:)))/(max(Img(:))-min(Img(:)));
        
        Img_pad  = padarray(Img, [(ws+1)/2 (ws+1)/2], 0, 'pre');
        Img_pad = padarray(Img_pad, [(ws-1)/2 (ws-1)/2], 0, 'post');
        t = cumsum(cumsum(Img_pad),2);
        imageI = t(1+ws:size(Img,1)+ws, 1+ws:size(Img,2)+ws) + t(1:size(Img,1), 1:size(Img,2))...
            - t(1+ws:size(Img,1)+ws, 1:size(Img,2)) - t(1:size(Img,1), 1+ws:size(Img,2)+ws);
        % contains cumulated sum -> division by the size of the number of pixels for the average 
        meanImage = imageI/(ws*ws);
        
        %same thing with img^2 for the standard deviation
        Img_pad  = padarray(Img.^2, [(ws+1)/2 (ws+1)/2], 0, 'pre');
        Img_pad = padarray(Img_pad, [(ws-1)/2 (ws-1)/2], 0, 'post');
        t = cumsum(cumsum(Img_pad),2);
        imageI = t(1+ws:size(Img,1)+ws, 1+ws:size(Img,2)+ws) + t(1:size(Img,1), 1:size(Img,2))...
            - t(1+ws:size(Img,1)+ws, 1:size(Img,2)) - t(1:size(Img,1), 1+ws:size(Img,2)+ws);
        
        deviation = (imageI/(ws*ws) - meanImage.^2).^0.5;
        
        th =meanImage.*(1+p*exp(-q*meanImage)+k*(deviation/r-1));
        
        th(1:wsdiv2,:) = Img(1:wsdiv2,:)+1;
        th(sI(1)-wsdiv2+1:sI(1),:) = Img(sI(1)-wsdiv2+1:sI(1),:)+1;
        th(:,sI(2)-wsdiv2+1:sI(2)) = Img(:,sI(2)-wsdiv2+1:sI(2))+1;
        th(:,1:wsdiv2) = Img(:,1:wsdiv2)+1;
    end

    bw = (Img > th);
    
end
