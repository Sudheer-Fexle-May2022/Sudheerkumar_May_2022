/**
* Description   - This class is being created to implement utility class concept
*
* Created by    - Sudheer Kumar Shakya
*
* Created Date  - 05/07/2022
*
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date-05/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date-05/07/2022
*
**/
public class UtilityclassExample {
    
    /**   Description :   Creating a method
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date-04/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya- Date -04/07/2022
    * 
    **/
    public static void createTestRecords(Integer numAccts, Integer numContactsPerAcct) {
        List<Account> accts = new List<Account>();
        
        //initializing a loop
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
    	}
        insert accts;
        List<Contact> cons = new List<Contact>();
        
        //initializing loop
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            
            // For each account just inserted, add contacts
            for (Integer k=numContactsPerAcct*j;k<numContactsPerAcct*(j+1);k++) {
                cons.add(new Contact(firstname='Test'+k,
                lastname='Test'+k,
                AccountId=acct.Id));
  			}
    	}
    // Insert all contacts for all accounts
    insert cons;
    }
}