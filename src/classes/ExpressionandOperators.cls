/**
* Description   - This class is being created to implement the different types of expressions and operators
*
* Created by    - Sudheer Kumar Shakya
*
* Created Date  - 04/07/2022
*
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date-04/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date-04/07/2022
*
**/
public with sharing class ExpressionandOperators {

    /**   Description :   This method is used to iterate the expressions and operators
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   Integer,boolean
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya -Date-04/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya -Date-04/07/2022
    * 
    **/
    public static void diffExpressions(integer a, integer b,integer m,integer n, integer c, boolean d, boolean e){
        //implementing some Unary Expressions -
        system.debug('Unary Expression are as:'); 
        system.debug(~m);           //(minus of total positive value which starts from 0)  
        system.debug(~n);
        system.debug(~c);           // (positive of total minus, positive starts from 0)  
        system.debug(!d);           // (opposite of boolean value)  
        system.debug(!e);           //(opposite of boolean value)

        //Implementing some Arithmetic Expressions -
        system.debug('Arithmetic Expression are like:');
        system.debug(a+m);  
        system.debug(a-m); 
        system.debug(m*n); 
        system.debug(c/n); 

        //implementing Left Shift Expression -
        system.debug('Left Shift Expression'); 
        system.debug(m<<n);   // for ex - 10*2^2=10*4=40   

        //implementing Right Shift Expression -
        system.debug('Right Shift Expression');
        system.debug(m>>n);   //for ex - 10/2^2=10/4=2  

        //implementing AND Expression -
        system.debug('AND Expression'); 
        system.debug(a<m&&a<n);
        system.debug(a<m&a<n);

        //implementing OR Expressiono -
        system.debug('OR Expression'); 
        system.debug(a>b||a++<c);
        system.debug(a>b|a++<c);

        //implementing Ternary Expression
        system.debug('Ternary Expression');
        integer min=(a<b)?a:b;  
        system.debug(min); 

        //implementing Assigment Expreesion -
        system.debug('Assigment Expression');
        system.debug(a += b);
        system.debug(b -= c);
        system.debug(c *= a);
        system.debug(m /= n);
        system.debug(n *= a*b);
        system.debug(b += a-c );

        //Relation Expreession -
        system.debug('Relation Expression'); 
        system.debug(m == n);
        system.debug(c != b);  
        system.debug(c > a);  
        system.debug(b < a);  
        system.debug(a >= c);  
        system.debug(b <= c);
		
        //Tppe Casting:-
        
        System.debug('Type casting/Rule of conversion: ');
		//casting: integer to double
        double mywide1 = m; 
        decimal mywide2 = n;

        system.debug(mywide1);
        system.debug(mywide2); 

        // Narrowing(Manual) casting: double to integer
        double mynarrow1 = 7.98d;
        integer mynarrow2 = (integer) mynarrow1; 
        long mynarrow3 = (long) mynarrow1;

        system.debug(mynarrow2);
        system.debug(mynarrow3);

        decimal mywide3 = mynarrow2;

        system.debug(mywide3);        
    }

    /**   Description :   This method is used to perform navigation
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   Integer,boolean
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya -Date-04/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya -Date-04/07/2022
    * 
    **/
    public static void safeOperator(){
        String a=NULL;
        String b='abc';
        System.debug(a==null? b:a);
        Account acc =new Account();
        acc.Name='test';
        insert acc;
        System.debug([SELECT ID , Name FROM Account where ID=:acc.ID]?.NAME);  
    }
    
    /**   Description :   This method is used to perform navigation
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   none
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya -Date-04/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya -Date-04/07/2022
    * 
    **/
    public static void safeOperator2(){
        List<String> filteredAccountSites = new List<String>();

        List<Account> collectedAccounts = [SELECT Id, Name, Site FROM Account LIMIT 5];
        
        Map<Id, Account> accountsMap = new Map<Id, Account>([SELECT Id, Name, Site FROM Account]);
        
        //initiallizing a loop
        for(Account a : collectedAccounts){	
            Account localAccount = accountsMap.get(a.Id);
            if(localAccount != null){
                if(localAccount.site != null){
                    filteredAccountSites.add(localAccount.Site.substring(8));
                }
            }
        
        }
        
        System.debug('  ' +filteredAccountSites);
    }
    
    /**   Description :   This method is used to perform navigation
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   none
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya -Date-04/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya -Date-04/07/2022
    * 
    **/
    public static void safeOperator3(){
   		List<String> filteredAccountSites = new List<String>();

        List<Account> collectedAccounts = [SELECT Id, Name, Site FROM Account LIMIT 5];
        
        Map<Id, Account> accountsMap = new Map<Id, Account>([SELECT Id, Name, Site FROM Account]);
        
        for(Account a : collectedAccounts){
        
            filteredAccountSites.add(accountsMap.get(a.Id)?.Site?.Substring(8));
        
        }
        
        System.debug('  ' +filteredAccountSites);       
    }      
}