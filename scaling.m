function [ reduced_factor] = scaling( faceMat,lowvec,upvec )  
 
look_up=1;  
look_down=-1;  
[x,y]=size(faceMat);  
reduced_factor=zeros(x,y);  
for i=1:x  
    reduced_factor(i,:)=look_down+(faceMat(i,:)-lowvec)./(upvec-lowvec)*(look_up-look_down);  
    
end  
end