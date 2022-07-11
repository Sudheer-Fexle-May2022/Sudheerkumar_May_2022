/**
* Description   - Performing the concept of this keyword
* Created by    - Sudheer Kumar Shakya
* Created Date  - 08/07/2022
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date - 08/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 08/07/2022
**/
public with sharing class Thiskeyword {
    public String Collegename;  
    public String name;  
    public String Branch;
    public Integer Year;

    /**   Description :   Ctreating a Constructor
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   integer,String ,String ,String
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 08/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 08/07/2022
    **/
    public Thiskeyword(String Collegename,String name,String Branch,Integer Year){  
        this.Collegename=Collegename;  
        this.name=name;  
        this.Branch=Branch; 
        this.Year=Year;
    }
    /**   Description :   Now using a method to print the values
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 08/07/2022
    *                     V_1.0 - Created  - Sudheer Kumar Shakya - Date - 08/07/2022
    **/    
    public void show(){
        System.debug('Values are printed as:');
        System.debug(Collegename);
        System.debug(name);
        System.debug(Branch);
        System.debug(Year);
        
    }  
}