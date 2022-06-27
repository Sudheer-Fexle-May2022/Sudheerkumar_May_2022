/**
* Description   - Creating this class to printthe different different star patterns
*
* Created by    - Sudheer Kumar Shakya
*
* Created Date  - 25-06-2022
*
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya Date-25-06-2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date -25-06-2022 Modifie dsome simple,and hierachical relations
*
**/
public with sharing class Patternsofstar {
    
    /**   Description :   Making Logics to print left sided triangle using two loops
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 25-06-2022            
    **/
    public static void LeftSidePattern(integer N) 
    {
        for(integer i=1;i<=N;i++)
        {
            string a=' ';
            string b='  ';
            for(integer j=N;j>=1;j--)
            {
                if(i>=j )
                {
                    a = a + '*';
                }
                else
                {
                    a = a + preserveWhitespace(b);
                }
            }
            system.debug(a);
            
        }
    }
    
    /**   Description :   For giving the space
    *
    *     Created By  :   sudheer kumar shakya
    *
    *     Arguments   :    
    *
    *     Return      :   return String 
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Sudheer Kumar Shakya
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public static String preserveWhitespace(String s){
        if(s!= null)
            s = s.replace(' ',String.fromCharArray( new Integer[] { 160 }));
        
        return s;
    } 
    
    /**   Description :   Making Logics to print right sided triangle using two loops
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 25-06-2022            
    **/
    
    public static void rightPAttern(integer N){
        for(integer i=1;i<=N;i++){
            string a=' ';
            string b='  ';
            for(integer j=1;j<=i;j++){
                a=a+'*';
            }
            system.debug(a);
        }
    }  
    
    /**   Description :   Making Logics to print downward leftsided triangle using two loops
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 25-06-2022            
    **/
    public static void leftDownwardPattern(integer N){
        for(integer i=1;i<=N;i++){
            string a=' ';
            string b='  ';
            for(integer j=N;j>=i;j--){
                a=a+'*';
            }
            system.debug(a);
        }
    } 
    
    /**   Description :   Making Logics to print downward rightsided triangle using two loops
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 25-06-2022            
    **/
    public static void rightDownwardPattern(integer N) 
    {
        for(integer i=N;i>=1;i--)
        {
            string a=' ';
            string b='  ';
            for(integer j=N;j>=1;j--)
            {
                if(i>=j )
                {
                    a = a + '*';
                }
                else
                {
                    a = a + preserveWhitespace(b);
                }
            }
            system.debug(a);
            
        }
    } 
    
    /**   Description :   Making Logics to print upward Pyramid using two loops
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 26-06-2022            
    **/
    public static void upwardPyramid(integer N){
        integer px=N;  //left print control
        integer py=N;  //right print control
        for(integer i=1;i<=N;i++){
            string a=' ';
            string b='  ';
            for(integer j=1;j<=N*2;j++){
                if(j>=px&&j<=py){
                    //printing *
                    a=a+'*';
                }
                else{
                    //printing spaces
                    a=a+preserveWhitespace(b);
                }
            }
            px--;
            py++;
            system.debug(a);
        }
    }  
    
    
    /**   Description :   Making Logics to print downward Pyramid using two loops
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 26-06-2022            
    **/
    public static void downwardPyramid(integer N){
        integer px=1;  //left print control
        integer py=N*2-1;  //right print control
        for(integer i=1;i<=N;i++){
            string a=' ';
            string b='  ';
            for(integer j=1;j<N*2;j++){
                if(j>=px&&j<=py){
                    //printing *
                    a=a+'*';
                }
                else{
                    //printing spaces
                    a=a+preserveWhitespace(b);
                }
            }
            px++;
            py--;
            system.debug(a);
        }
    }  
    
    /**   Description :   Making Logics to print left sided Pyramid 
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 26-06-2022            
    **/
    public static void leftsidePyramid(integer N){
        for(integer i=N;i>=-N;i--){
            string a=' ';
            string b='  ';
            for(integer j=1;j<=Math.abs(i);j++){
                a=a+preserveWhitespace(b);
            }
            for(integer k=N;k>=Math.abs(i);k--){
                a=a+'*';
            }
            system.debug(a);
        }
    }  
    
    /**   Description :   Making Logics to print right sided Pyramid 
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 26-06-2022            	
    **/
    public static void rightsidePyramid(integer N){
        for(integer i=N;i>=-N;i--){
            string a=' ';
            string b='  ';
            for(integer j=N;j>=Math.abs(i);j--){
                a=a+'*';
            }
            system.debug(a);
        }
    }  
    
    /**   Description :   Making Logics to print hollow leftsided triangle using two loops
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 26-06-2022            
    **/
    public static void leftHollowTriangle(integer N) 
    {
        for(integer i=1;i<=N;i++)
        {
            string a=' ';
            string b='  ';
            for(integer j=1;j<=N;j++)
            {
                if(j==N-i+1||j==N||i==N)
                {
                    a = a + '*';
                }
                else
                {
                    a = a + preserveWhitespace(b);
                }
            }
            system.debug(a);           
        }
    } 
    
    /**   Description :   Making Logics to print hollow leftsided downward triangle using two loops
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 26-06-2022            
    **/
    public static void leftdownwardHollowTriangle(integer N) 
    {
        for(integer i=1;i<=N;i++)
        {
            string a=' ';
            string b='  ';
            for(integer j=1;j<=N;j++)
            {
                if(j==i||j==N||i==1)
                {
                    a = a + '*';
                }
                else
                {
                    a = a + preserveWhitespace(b);
                }
            }
            system.debug(a);           
        }
    } 
    
    /**   Description :   Making Logics to print hollow right sided triangle using two loops
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 26-06-2022            
    **/
    public static void rightHollowTriangle(integer N) 
    {
        for(integer i=1;i<=N;i++)
        {
            string a=' ';
            string b='  ';
            for(integer j=1;j<=N;j++)
            {
                if(j==1||i==j||i==N)
                {
                    a = a + '*';
                }
                else
                {
                    a = a + preserveWhitespace(b);
                }
            }
            system.debug(a);           
        }
    } 
    
    /**   Description :   Making Logics to print hollow right sided downward triangle using two loops
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 26-06-2022            	
    **/
    public static void rightdownwardHollowTriangle(integer N) 
    {
        for(integer i=1;i<=N;i++)
        {
            string a=' ';
            string b='  ';
            for(integer j=1;j<=N-i+1;j++)
            {
                if(j==1||j==N-i+1||i==1)
                {
                    a = a + '*';
                }
                else
                {
                    a = a + preserveWhitespace(b);
                }
            }
            system.debug(a);           
        }
    } 
    
    /**   Description :   Making Logics to print hollow Pyramid using two loops
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 26-06-2022            
    **/
    public static void hollowPyramid(integer N){
        integer px=N;  //left print control
        integer py=N;  //right print control
        for(integer i=1;i<=N;i++){
            string a=' ';
            string b='  ';
            for(integer j=1;j<N*2;j++){
                if(j==px||j==py||i==N){
                    //printing *
                    a=a+'*';
                }
                else{
                    //printing spaces
                    a=a+preserveWhitespace(b);
                }
            }
            px--;
            py++;
            system.debug(a);
        }
    }
    
    /**   Description :   Making Logics to print  hollow downward Pyramid using two loops
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 26-06-2022            
    **/
    public static void downwardhollowPyramid(integer N){
        integer px=1;  //left print control
        integer py=N*2-1;  //right print control
        for(integer i=1;i<=N;i++){
            string a=' ';
            string b='  ';
            for(integer j=1;j<N*2;j++){
                if(j==px||j==py||i==1){
                    //printing *
                    a=a+'*';
                }
                else{
                    //printing spaces
                    a=a+preserveWhitespace(b);
                }
            }
            px++;
            py--;
            system.debug(a);
        }
    } 
    
    /**   Description :   Making Logics to print  hollow left sided Pyramid using two loops
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       	
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 26-06-2022            	
    **/
    public static void hollowleftPyramid(integer N){
        integer x=N/2+1;  
        for(integer i=1;i<=N;i++){
            string a=' ';
            string b='  ';
            for(integer j=1;j<=N/2+1;j++){
                if(j==x||j==N/2+1){
                    //printing *
                    a=a+'*';
                }
                else{
                    //printing spaces
                    a=a+preserveWhitespace(b);
                }
            }
            if(i<=N/2)
            {
                x--;
            }
            else{
                x++;
            }
            system.debug(a);
        }
    }  
    
    /**   Description :   Making Logics to print  hollow right sided Pyramid using two loops
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 26-06-2022            
    **/
    public static void hollowrightPyramid(integer N){
        integer x=1;  
        for(integer i=1;i<=N;i++){
            string a=' ';
            string b='  ';
            for(integer j=1;j<=x;j++){
                if(j==1||j==x){
                    //printing *
                    a=a+'*';
                }
                else{
                    //printing spaces
                    a=a+preserveWhitespace(b);
                }
            }
            if(i<=N/2)
            {
                x++;
            }
            else{
                x--;
            }
            system.debug(a);
        }
    }  
    
    /**   Description :   Making Logics to print  upward butterfly 
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 26-06-2022            
    **/
    public static void upwardButterfly(integer N){
        integer x=1;  
        for(integer i=1;i<=N;i++){
            string a=' ';
            string b='  ';
            for(integer j=1;j<=N;j++){
                if((j>=x)!=false&&j<=N-x+1){
                    
                    //printing *
                    a=a+'*';
                }
                else{
                    //printing spaces
                    a=a+preserveWhitespace(b);
                }
            }
            if(i<=N/2)
            {
                x++;
            }
            else{
                x--;
            }
            system.debug(a);
        }
    }  
    
    /**   Description :   Making Logics to print  down ward butterfly
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :              
    *     Return      :   Void       
    *     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 26-06-2022            
    **/
    public static void downwardButterfly(integer N){
        integer x=1;  
        for(integer i=1;i<=N;i++){
            string a=' ';
            string b='  ';
            for(integer j=1;j<=N;j++){
                if((j<=x)!=false||j>=N-x+1){                  
                    //printing *
                    a=a+'*';
                }
                else{
                    //printing spaces
                    a=a+preserveWhitespace(b);
                }
            }
            if(i<=N/2)
            {
                x++;
            }
            else{
                x--;
            }
            system.debug(a);
        }
    }  
}