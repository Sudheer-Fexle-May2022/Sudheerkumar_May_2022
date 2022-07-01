/**
* Description   - Creating this class to print the star patterns
*
* Created by    - Sudheer Kumar Shakya
*
* Created Date  - 25-06-2022
*
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya Date-25-06-2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date -25-06-2022 Modifie dsome simple,and hierachical relations
*
**/
public class Patternoneloop {
    
    /**   Description :   Making Logics to print right sided triangle using one loops
    *     Created By  :   Sudheer Kumar Shakya
	*     Arguments   :              
	*     Return      :   Void       
	*     Revision log:   V_1.0 - Created  - Your name - Sudheer Kumar Shakya, Date- 25-06-2022            
	**/    
    public static void leftTriangle(integer m){
        integer x=1;
        integer j=1;
        string a=' ';
        string b=' ';
        for(integer i=1;x<=m;){
            if(!(j<=i)){
                j=1;
                i++;
            }
            else{
                a=a+'*';
                x++;
                j++;
                system.debug(a);
            }
        }
    }
    
    /**   Description :   Left triangle Using One Loop (giving the space)
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
    public static String preserveWhitespace(String a){
        if(a!= null)
            a = a.replace(' ',String.fromCharArray( new Integer[] { 160 }));
        
        return a;
        
    }
    
}