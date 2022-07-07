/**
* Description   - This class is being created to implement the different types of loops
*
* Created by    - Sudheer Kumar Shakya
*
* Created Date  - 04/07/2022
*
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date-04/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date-04/07/2022
*
**/
public with sharing class DifferentTypesLoop {

    /**   Description :   implementing For loop
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
    public static void forLoop() {
        
        //using for loop
        for(integer i=0;i<=10;i++){
            system.debug('this is number: '+i);
        }
    }  
    
    /**   Description :   implementing for each loop
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
    public static void foreachLoop(){
        List<Contact> listOfContacts=new List<Contact>();
        listOfContacts=[SELECT Name FROM Contact WHERE CurrentCompany__c=''LIMIT 10];
        Integer count=0;

        for(Contact c : listOfContacts){
            count++;
            c.CurrentCompany__c='Fexle';
            System.debug('Loop Number: '+count+' ,updated CurrentCompany with '+c.CurrentCompany__c);
        }

    }

    /**   Description :   implementing While loop
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date-04/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya- Date -04/07/2022
    * */
    Public static void whileLoop(){
        Integer count=0;
        System.debug('Initial value of count is: '+count);

        //implementing loop
        while(count<5){
            System.debug('Loop number: '+count);
            count++;
        }
        System.debug('Final value of count is: '+count);
    }

    /**   Description :   implementing Do While loop
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date-04/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya- Date -04/07/2022
    **/
    public static void doWhile(){
        Integer count=0;
        System.debug('Initial value of count is: '+count);

        //implementing loop
        do{
            System.debug('Loop number: '+count);
            count++;
        }
        while(count<5);
        System.debug('Final value of count is: '+count);
    }

    /**   Description :   implementing Control flow statements 
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date-04/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya- Date -04/07/2022
    **/
    public static void controlFlow(){
        String customerName = 'Glenmarkone'; //premium customer
        Decimal discountRate = 0;
        Boolean premiumSupport = false;
        if (customerName == 'Glenmarkone') {
        discountRate = 0.1; //when condition is met this block will be executed
        premiumSupport = true;
        System.debug('Special Discount given as Customer is Premium');
        } 
        
        else if (customerName == 'Joe') {
        discountRate = 0.5; //when condition is met this block will be executed
        premiumSupport = false;
        System.debug('Special Discount not given as Customer is not Premium');
        }
        
        else {
        discountRate = 0.05; //when condition is not met and customer is normal
        premiumSupport = false;
        System.debug('Special Discount not given as Customer is not Premium');
        }
    }

    /**   Description :   implementing nested elseif loop 
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date-04/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya- Date -04/07/2022
    **/
    public static void nestedLoop(){
        String pinCode = '243637';
        String customerType = 'Premium';
        if (pinCode == '243637') {
        System.debug('Condition met and Pin Code is'+pinCode);
        if(customerType == 'Premium') {
            System.debug('This is a Premium customer living in pinCode 243637');
        }else if(customerType == 'Normal') {
            System.debug('This is a Normal customer living in pinCode 243637');
        }
        }else {
        //this can go on as per the requirement
        System.debug('Pincode not found');
        }
    }

    /**   Description :   We will perform Method overloading here
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date-04/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya- Date -04/07/2022
    **/
    public static void methodOverloading(){
        system.debug('No data type here');
    } 

    //passing An argument
    public static void methodOverloading(Integer speed){
        system.debug('int method speed: '+speed);
    } 

    //passing string argument
    public static void methodOverloading(string Name){
        system.debug('Method name is: '+name);
    } 

    //passing both arguments togather
    public static void methodOverloading(string name,integer speed){
        system.debug('After passing int and str method:   '+name +speed);
    } 

}