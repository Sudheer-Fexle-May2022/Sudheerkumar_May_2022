/**
* Description   - This class is created to perform different custom exceptions
* Created by    - Sudheer Kumar Shakya
* Created Date  - 23/07/2022
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date -23/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date -23/07/2022
**/
public with sharing class ExceptionHandling{
    public virtual class BaseException extends Exception {}
    public class OtherException extends BaseException {}
    public static void testExtendedException() {
        try {
            Integer i=0;
            // Your code here
            if (i < 5) throw new OtherException('This is bad');
        } catch (BaseException e) {  
            // This catches the OtherException
            System.debug(e.getMessage());
        }  
    }
     
    /**   Description :   To perform Position Exception
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 23/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 23/07/2022
    **/  
    public class PositionException extends Exception {}
    public class PositionUtility {
        public void mainProcessing() {
            try {
                insertPositionMethod();
            } 
            catch(PositionException pe) {
                System.debug('Message: ' + pe.getMessage());    
                System.debug('Cause: ' + pe.getCause());    
                System.debug('Line number: ' + pe.getLineNumber());    
                System.debug('Stack trace: ' + pe.getStackTraceString());    
            }
        }
        public void insertPositionMethod() {
            try {
                System.debug('Position insert');
            } catch(DmlException pe) {
                throw new PositionException('position exceception:', pe);
            }
        }
    }

    /**   Description :   To perform Collection Exception
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 23/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 23/07/2022
    **/  
    public class CollectionNotConstructedException extends Exception { }
    public void setException(){
        try
        {
            Set<Id> collection;
            Boolean value = collection.contains(UserInfo.getUserId());
        }
        catch (CollectionNotConstructedException e)
        {
            System.debug('CollectionNotConstructedException :'+e);
        }
    }   
}