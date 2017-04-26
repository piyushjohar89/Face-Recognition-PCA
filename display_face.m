function display_face( B )  

global row_num;  
global col_num;  
figure  
img=zeros(row_num,col_num);  
for i=1:20  
    img(:)=B(:,i);  
    subplot(4,5,i);  
    imshow(img,[])  
end  
end