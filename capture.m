function capture(is_captured,  directory, obj )
%check the count
persistent count

%check if its empty
if isempty (count)
   count = 1 ;
%end the if
end
%check if the image is captured
if  is_captured
    date_value = datestr (date , 29 ) ;
    %create the file name
    filename = [date_value, '-', num2str(count)];
    %get the f_value
    f_value=getsnapshot(obj);
    %convert from ycbrc to rgb
    f_value  =  ycbcr2rgb(f_value);
    %write into file
    imwrite (f_value, [directory, filename, '.jpg']);
    %read from file
    X=imread ( [directory, filename, '.jpg']);
    
     imwrite (X, [directory, filename, '.pgm']);
  
    count = count+ 1 ;
    %otherwise delete object
else
    %delete object
    clear  count;
    delete (obj);
    
end
end