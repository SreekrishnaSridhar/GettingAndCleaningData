# Codebook
This lists the changes and modifications we have done in getting and making the data into a tidy dataset.

From the link : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones , 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The variables have been renamed based on certain patterns as follows :

* rename_feature_names <- featureName[reqd_feature_ids]
* rename_feature_names <- gsub("^f(.*)$","\\1-frequency",rename_feature_names)
* rename_feature_names <- gsub("^t(.*)$","\\1-time",rename_feature_names)
* rename_feature_names <- gsub("Mag","\\1-magnitude",rename_feature_names)
* rename_feature_names <- gsub("Acc","\\1-acceleration",rename_feature_names)
* rename_feature_names <- gsub("BodyBody","Body",rename_feature_names)
* rename_feature_names <- tolower(rename_feature_names)
* rename_feature_names <- append(rename_feature_names , c("subject","activity"))
* names(meanStdData) <- rename_feature_names

Finally, the variable names are as follows : 

 [1] "body-acceleration-mean()-x-time"                 
 [2] "body-acceleration-mean()-y-time"                 
 [3] "body-acceleration-mean()-z-time"                 
 [4] "body-acceleration-std()-x-time"                  
 [5] "body-acceleration-std()-y-time"                  
 [6] "body-acceleration-std()-z-time"                  
 [7] "gravity-acceleration-mean()-x-time"              
 [8] "gravity-acceleration-mean()-y-time"              
 [9] "gravity-acceleration-mean()-z-time"              
[10] "gravity-acceleration-std()-x-time"               
[11] "gravity-acceleration-std()-y-time"               
[12] "gravity-acceleration-std()-z-time"               
[13] "body-accelerationjerk-mean()-x-time"             
[14] "body-accelerationjerk-mean()-y-time"             
[15] "body-accelerationjerk-mean()-z-time"             
[16] "body-accelerationjerk-std()-x-time"              
[17] "body-accelerationjerk-std()-y-time"              
[18] "body-accelerationjerk-std()-z-time"              
[19] "bodygyro-mean()-x-time"                          
[20] "bodygyro-mean()-y-time"                          
[21] "bodygyro-mean()-z-time"                          
[22] "bodygyro-std()-x-time"                           
[23] "bodygyro-std()-y-time"                           
[24] "bodygyro-std()-z-time"                           
[25] "bodygyrojerk-mean()-x-time"                      
[26] "bodygyrojerk-mean()-y-time"                      
[27] "bodygyrojerk-mean()-z-time"                      
[28] "bodygyrojerk-std()-x-time"                       
[29] "bodygyrojerk-std()-y-time"                       
[30] "bodygyrojerk-std()-z-time"                       
[31] "body-acceleration-magnitude-mean()-time"         
[32] "body-acceleration-magnitude-std()-time"          
[33] "gravity-acceleration-magnitude-mean()-time"      
[34] "gravity-acceleration-magnitude-std()-time"       
[35] "body-accelerationjerk-magnitude-mean()-time"     
[36] "body-accelerationjerk-magnitude-std()-time"      
[37] "bodygyro-magnitude-mean()-time"                  
[38] "bodygyro-magnitude-std()-time"                   
[39] "bodygyrojerk-magnitude-mean()-time"              
[40] "bodygyrojerk-magnitude-std()-time"               
[41] "body-acceleration-mean()-x-frequency"            
[42] "body-acceleration-mean()-y-frequency"            
[43] "body-acceleration-mean()-z-frequency"            
[44] "body-acceleration-std()-x-frequency"             
[45] "body-acceleration-std()-y-frequency"             
[46] "body-acceleration-std()-z-frequency"             
[47] "body-accelerationjerk-mean()-x-frequency"        
[48] "body-accelerationjerk-mean()-y-frequency"        
[49] "body-accelerationjerk-mean()-z-frequency"        
[50] "body-accelerationjerk-std()-x-frequency"         
[51] "body-accelerationjerk-std()-y-frequency"         
[52] "body-accelerationjerk-std()-z-frequency"         
[53] "bodygyro-mean()-x-frequency"                     
[54] "bodygyro-mean()-y-frequency"                     
[55] "bodygyro-mean()-z-frequency"                     
[56] "bodygyro-std()-x-frequency"                      
[57] "bodygyro-std()-y-frequency"                      
[58] "bodygyro-std()-z-frequency"                      
[59] "body-acceleration-magnitude-mean()-frequency"    
[60] "body-acceleration-magnitude-std()-frequency"     
[61] "body-accelerationjerk-magnitude-mean()-frequency"
[62] "body-accelerationjerk-magnitude-std()-frequency" 
[63] "bodygyro-magnitude-mean()-frequency"             
[64] "bodygyro-magnitude-std()-frequency"              
[65] "bodygyrojerk-magnitude-mean()-frequency"         
[66] "bodygyrojerk-magnitude-std()-frequency"          
[67] "subject"                                         
[68] "activity" 

The last two variable names were added to match the original dataset. The dataset that we want to use extracts the mean and standard deviation of the many variables and parameters.

Finally the tidy dataset has the following variables :

Variable 1 : subject
This variable has values from 1 to 30. It represent the users involved in the study.

Variable 2: activity
This variable has 6 set of values representing different activities. They are :
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Variable 3 : measurement
The original features are now represented as rows in the column measurement. The values are :

 [1] "body-acceleration-mean()-x-time"                 
 [2] "body-acceleration-mean()-y-time"                 
 [3] "body-acceleration-mean()-z-time"                 
 [4] "body-acceleration-std()-x-time"                  
 [5] "body-acceleration-std()-y-time"                  
 [6] "body-acceleration-std()-z-time"                  
 [7] "gravity-acceleration-mean()-x-time"              
 [8] "gravity-acceleration-mean()-y-time"              
 [9] "gravity-acceleration-mean()-z-time"              
[10] "gravity-acceleration-std()-x-time"               
[11] "gravity-acceleration-std()-y-time"               
[12] "gravity-acceleration-std()-z-time"               
[13] "body-accelerationjerk-mean()-x-time"             
[14] "body-accelerationjerk-mean()-y-time"             
[15] "body-accelerationjerk-mean()-z-time"             
[16] "body-accelerationjerk-std()-x-time"              
[17] "body-accelerationjerk-std()-y-time"              
[18] "body-accelerationjerk-std()-z-time"              
[19] "bodygyro-mean()-x-time"                          
[20] "bodygyro-mean()-y-time"                          
[21] "bodygyro-mean()-z-time"                          
[22] "bodygyro-std()-x-time"                           
[23] "bodygyro-std()-y-time"                           
[24] "bodygyro-std()-z-time"                           
[25] "bodygyrojerk-mean()-x-time"                      
[26] "bodygyrojerk-mean()-y-time"                      
[27] "bodygyrojerk-mean()-z-time"                      
[28] "bodygyrojerk-std()-x-time"                       
[29] "bodygyrojerk-std()-y-time"                       
[30] "bodygyrojerk-std()-z-time"                       
[31] "body-acceleration-magnitude-mean()-time"         
[32] "body-acceleration-magnitude-std()-time"          
[33] "gravity-acceleration-magnitude-mean()-time"      
[34] "gravity-acceleration-magnitude-std()-time"       
[35] "body-accelerationjerk-magnitude-mean()-time"     
[36] "body-accelerationjerk-magnitude-std()-time"      
[37] "bodygyro-magnitude-mean()-time"                  
[38] "bodygyro-magnitude-std()-time"                   
[39] "bodygyrojerk-magnitude-mean()-time"              
[40] "bodygyrojerk-magnitude-std()-time"               
[41] "body-acceleration-mean()-x-frequency"            
[42] "body-acceleration-mean()-y-frequency"            
[43] "body-acceleration-mean()-z-frequency"            
[44] "body-acceleration-std()-x-frequency"             
[45] "body-acceleration-std()-y-frequency"             
[46] "body-acceleration-std()-z-frequency"             
[47] "body-accelerationjerk-mean()-x-frequency"        
[48] "body-accelerationjerk-mean()-y-frequency"        
[49] "body-accelerationjerk-mean()-z-frequency"        
[50] "body-accelerationjerk-std()-x-frequency"         
[51] "body-accelerationjerk-std()-y-frequency"         
[52] "body-accelerationjerk-std()-z-frequency"         
[53] "bodygyro-mean()-x-frequency"                     
[54] "bodygyro-mean()-y-frequency"                     
[55] "bodygyro-mean()-z-frequency"                     
[56] "bodygyro-std()-x-frequency"                      
[57] "bodygyro-std()-y-frequency"                      
[58] "bodygyro-std()-z-frequency"                      
[59] "body-acceleration-magnitude-mean()-frequency"    
[60] "body-acceleration-magnitude-std()-frequency"     
[61] "body-accelerationjerk-magnitude-mean()-frequency"
[62] "body-accelerationjerk-magnitude-std()-frequency" 
[63] "bodygyro-magnitude-mean()-frequency"             
[64] "bodygyro-magnitude-std()-frequency"              
[65] "bodygyrojerk-magnitude-mean()-frequency"         
[66] "bodygyrojerk-magnitude-std()-frequency"          
[67] "subject"                                         
[68] "activity"

Variable 4 : mean
The mean across each measurement was calculated.
