/**
* Description   - This class is being created to implement the concept of wrapper class
*
* Created by    - Sudheer Kumar Shakya
*
* Created Date  - 08/07/2022
*
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date-08/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date-08/07/2022
*
**/
public class WrapperClassExample{
    //Collection of the class/wrapper objects wrapAccount 
    public List<wrapAccount> wrapAccountList {get; set;}
    public List<Account> selectedAccounts{get;set;}
    
    /**   Description :   Creating a Constructor
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date-08/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya- Date -08/07/2022
    * 
    **/ 
    public WrapperClassExample(){
        if(wrapAccountList == null) {
            wrapAccountList = new List<wrapAccount>();
            for(Account a: [select Id, Name,BillingState, Website, Phone from Account limit 10]) {
                // As each Account is processed we create a new wrapAccount objct
                wrapAccountList.add(new wrapAccount(a));
            }
        }
    }
    /**   Description :   Creating a method
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date-08/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya- Date -08/07/2022
    * 
    **/
    public void processSelected() {
    selectedAccounts = new List<Account>();
 
        for(wrapAccount wrapAccountObj : wrapAccountList) {
            if(wrapAccountObj.selected == true) {
                selectedAccounts.add(wrapAccountObj.acc);
            }
        }
    }
 
 
    /**
    * Description   - creating a wrapper class
    *
    * Created by    - Sudheer Kumar Shakya
    *
    * Created Date  - 08/07/2022
    *
    * Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date-08/07/2022
    *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date-08/07/2022
    *
    **/ 
    public class wrapAccount {
        public Account acc {get; set;}
        public Boolean selected {get; set;}
 
        //This is the contructor method.
        public wrapAccount(Account a) {
            acc = a;
            selected = false;
        }
    }
}