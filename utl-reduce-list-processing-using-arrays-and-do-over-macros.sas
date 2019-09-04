Reduce list processing using array and do over macros                                                           
                                                                                                                
Problem:                                                                                                        
                                                                                                                
I would like to avoid typing the 'A10' , 'A11' , 'A12' , 'A13' , 'A14'....                                      
                                                                                                                
data new;                                                                                                       
                                                                                                                
  set old;                                                                                                      
                                                                                                                
   if myvariable in ('A10' , 'A11' , 'A12' , 'A13' , 'A14' ) then myvariable = 0;                               
   else if myvariable in ('A16' , 'A17' , 'A18' , 'A19' , 'A20' ) then myvariable = 1;                          
                                                                                                                
run;                                                                                                            
                                                                                                                
github                                                                                                          
https://tinyurl.com/yxldswy6                                                                                    
https://github.com/rogerjdeangelis/utl-reduce-list-processing-using-arrays-and-do-over-macros                   
                                                                                                                
SAS Forum                                                                                                       
https://tinyurl.com/y44kt3pg                                                                                    
https://communities.sas.com/t5/SAS-Programming/Make-macro-variable-for-values-of-a-variable/m-p/585208          
                                                                                                                
macros                                                                                                          
https://tinyurl.com/y9nfugth                                                                                    
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories                      
uthors:   Ted Clay, M.S.   tclay@ashlandhome.net  (541) 482-6435                                                
          David Katz, M.S. www.davidkatzconsulting.com                                                          
                                                                                                                
                                                                                                                
*_                   _                                                                                          
(_)_ __  _ __  _   _| |_                                                                                        
| | '_ \| '_ \| | | | __|                                                                                       
| | | | | |_) | |_| | |_                                                                                        
|_|_| |_| .__/ \__,_|\__|                                                                                       
        |_|                                                                                                     
;                                                                                                               
                                                                                                                
data have;                                                                                                      
 do idx=7 to 23;                                                                                                
   var="A"!!put(idx,z2.);                                                                                       
   output;                                                                                                      
 end;                                                                                                           
 drop idx;                                                                                                      
run;quit;                                                                                                       
                                                                                                                
WORK.HAVE total obs=17                                                                                          
                                                                                                                
     VAR                                                                                                        
                                                                                                                
     A07                                                                                                        
     A08                                                                                                        
     A09                                                                                                        
     A10                                                                                                        
     A11                                                                                                        
     A12                                                                                                        
     A13                                                                                                        
     A14                                                                                                        
     A15                                                                                                        
     A16                                                                                                        
     A17                                                                                                        
     A18                                                                                                        
     A19                                                                                                        
     A20                                                                                                        
     A21                                                                                                        
     A22                                                                                                        
     A23                                                                                                        
                                                                                                                
*            _               _                                                                                  
  ___  _   _| |_ _ __  _   _| |_                                                                                
 / _ \| | | | __| '_ \| | | | __|                                                                               
| (_) | |_| | |_| |_) | |_| | |_                                                                                
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                               
                |_|                                                                                             
;                                                                                                               
                                                                                                                
                                                                                                                
 WORK.WANT total obs=17                                                                                         
                                                                                                                
   VAR    BIN                                                                                                   
                                                                                                                
   A07     .                                                                                                    
   A08     .                                                                                                    
   A09     .                                                                                                    
   A10     0                                                                                                    
   A11     0                                                                                                    
   A12     0                                                                                                    
   A13     0                                                                                                    
   A14     0                                                                                                    
   A15     .                                                                                                    
   A16     1                                                                                                    
   A17     1                                                                                                    
   A18     1                                                                                                    
   A19     1                                                                                                    
   A20     1                                                                                                    
   A21     .                                                                                                    
   A22     .                                                                                                    
   A23     .                                                                                                    
                                                                                                                
*                                                                                                               
 _ __  _ __ ___   ___ ___  ___ ___                                                                              
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                             
| |_) | | | (_) | (_|  __/\__ \__ \                                                                             
| .__/|_|  \___/ \___\___||___/___/                                                                             
|_|                                                                                                             
;                                                                                                               
                                                                                                                
%array(lsta,values=A10-A14);                                                                                    
%array(lstb,values=A16-A20);                                                                                    
                                                                                                                
data want;                                                                                                      
                                                                                                                
  set have;                                                                                                     
                                                                                                                
    if var in      ( %do_over(lsta,phrase="?",between=comma) ) then bin = 0;                                    
    else if var in ( %do_over(lstb,phrase="?",between=comma) ) then bin = 1;                                    
                                                                                                                
run;quit;                                                                                                       
                                                                                                                
                                                                                                                
