function [mat_f,class_value]=extract_face(number_of_faces,flag)

global row_num;   
global col_num;    
row_num=112;col_num=92;
class_value=zeros(number_of_faces*5,1);
mat_f=zeros(number_of_faces*5,row_num*col_num);
for counter=1:number_of_faces
    image_path=strcat('F:\Pattern Project\project\traindata\s',num2str(counter),'\');  
    cPath=image_path;
    for number_of_images=1:5
        image_path=cPath;
        if flag==0
            image_path=strcat(image_path,num2str(number_of_images));
        else
            image_path=strcat(image_path,num2str(number_of_images+5));
        end
        class_value((counter-1)*5+number_of_images)=counter;
        image_path=strcat(image_path,'.pgm');
        img=imread(image_path);
        mat_f((counter-1)*5+number_of_images,:)=img(:)';
    end
end
end