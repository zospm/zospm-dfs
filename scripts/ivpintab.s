IVPINTAB INTAB                                                       
*                                                                    
* LOGON REQUIRES BOTH THE INTERPRET TABLE AND THE USS TABLE.         
*                                                                    
* THE FIRST PASS THROUGH THE INTERPRET TABLE DOES NOT FIND A MATCH.  
*                                                                    
* THE PASS THROUGH THE USS TABLE FINDS A MATCH AND GENERATES A LOGON 
* COMMAND TO A BOGUS APPLID.                                         
*                                                                    
* THE SECOND PASS THROUGH THE INTERPRET TABLE RESULTS IN A MATCH ON  
* THE BOGUS APPLID AND CHANGES THE APPLID TO A LEGITIMATE VALUE.     
*                                                                    
         LOGCHAR APPLID=(APPLICID,IVPAPLL1),SEQNCE='Z1ZIVP' DBT      
         ENDINTAB                                                    
         END IVPINTAB                                                
