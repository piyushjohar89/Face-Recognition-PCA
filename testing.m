function testing ( A, X, sample) 

% declare global variables
global row_num; ...
global col_num;  
%%

[ filename, ...
    pathname] = uigetfile ...
    ...file path and image type
    ( { '*.jpg; *.tif; *.png; *.gif; *.pgm', 'All Image Files';...
          '*.*', ...
          'All Files'  }) ;
      
%path initialise
path = strcat ...
    ( pathname , filename) ;

%show
disp('Selected photos being read ...')  
path=strcat('F:\Pattern Project\project\traindata\s',num2str(select_person_num),'\',num2str(image_num),'.pgm');
image=imread(path);
image = imresize(image,[112 92]);
matrix=zeros(1,row_num*col_num);
matrix(1,:)=image(:)';
matrix=(matrix-A)*X;
%%
%normalised
disp('Selected photos being normalized...')  
%scaling and normalisation
matrix   =   scaling (  matrix , min(matrix) , max(matrix)) ;

%%
%prediction
disp( 'Seleceted photos being predicted...')  
 [ select_predict_label,...
     accuracy , decision_values ] = svmpredict ( 2 ,matrix , sample );
 
%%

disp ( 'Showing selected photos...')  

%display figure
figure(2) ;

%plot the figure
subplot (1, 2, 2) ;

%show the figure
imshow (imread (strcat ('F:\Pattern Project\project\traindata\s', num2str( select_predict_label ) , '\' , num2str(1) , '.pgm') )) ;

%give the heading
 title ('SYSTEM RECOGNISED Photo');
%plot the figure
subplot ( 1 , 2 ,1);
%show the figure
imshow(image);
%give the heading
title('SELECTED Photo');
