%%  
clc,clear    
no_of_dataset=41;
global row_num;    
global col_num;    
row_num=112;    
col_num=92;    
%%   
disp('Training data read')    
[f_matrix,train_label]=extract_face(no_of_dataset,0);   
nfaces=size(f_matrix,1);   
disp('*************************************************')    
%%  
%
disp('Training data & extract PCA feature')    

mA = mean ( f_matrix ) ;
%Reduce dimensions   
k = 20 ; 
[training_data , V ] = PCA_algo ( f_matrix, k, mA);

disp( '*************************************************' )

  

%%  

disp ( 'Display faces after PCA' )
% eigen face display
display_face( V )

disp ( '*************************************************' )    
    

%%  


disp ( 'Train images normalised' )    

disp ( '*************************************************' )

down_value = min ( training_data);   

up_value=max(training_data);    
training_reduced_data = scaling( training_data,down_value,up_value);    
   
%%  


disp ( 'Training in progress  .')
%model the sample 
disp ( '***********************************************' )    
%svm training
 model  =  svmtrain ...
     ( train_label , training_reduced_data , '-t 0') ;
 
   
 %%  

%extract features
 disp ( 'Testing  dataset  read...' )
 %display
disp ( '*************************************************' )
%extract features
[ test_facedata , test_facelabel ] = extract_face (no_of_dataset,1);    

    
%%   
%remodel
disp('Testing dimensions reduced...')    
%data display
disp ( '*************************************************' )
%remodel
m = size ( test_facedata , 1 );    
%for loop for each image
for  i = 1:m
    %check against face data
    test_facedata (i , :) = test_facedata ( i , : ) -mA;    
    %end of loop
end 
%result
test_pcatestface = test_facedata * V ;

    
%%  
%normaliaed
disp (' Testin dataset normaliaed ') 
%
disp ( '*************************************************')    

scaled_testface = scaling...
    ( test_pcatestface,down_value,up_value);    
    
%%  
%classification
disp ( ' SVM Classify ')    
%display
disp ( '*************************************************' )
%prediction
[predict_label , accuracy , ...
    decision_values ]...
    = svmpredict ( test_facelabel ,...
    scaled_testface , model) ;

  
%%
%recognition
disp ( ' Recognising in process' )
%display
disp ( '*************************************************' )

testing (mA , V, model) ;  