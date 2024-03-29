/**
* Description   - Created a handler class To add prefix and to send mail
* Created by    - Sudheer Kumar Shakya
* Created Date  - 27/07/2022
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - 27/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - 27/07/2022 
**/
public with sharing class TriggerHandler {

    /**   Description :   Method for adding and updating Prefix According to its Type or changes 
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   List(trigger.new)
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - 27/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - 27/07/2022 
    **/
    public static void prefixforAccount(List<Account> newAccount, Map<Id,Account> oldAccountMap){
       
        for(Account account: newAccount){
           
            //Generating a Random Account Number
            if(account.AccountNumber==null){
                Integer accnum=Integer.valueOf(100000000*Math.random());
                account.AccountNumber=String.valueOf(accnum);     
            }

            //Adding Prefix to account Number accordingly:
            if(oldAccountMap == null || account.Type != oldAccountMap.get(account.Id).Type ){
                if(account.Type=='Saving Account'){
                    if(account.AccountNumber.contains('FD-')){
                        account.AccountNumber=account.AccountNumber.remove('FD-') ;   
                    }  
                    account.AccountNumber='SA-'+account.AccountNumber;
                }

                else if(account.Type=='Fixed Deposit'){
                    if(account.AccountNumber.contains('SA-')){
                        account.AccountNumber=account.AccountNumber.remove('SA-') ;   
                    }  
                    account.AccountNumber='FD-'+account.AccountNumber;
                }    
            
                else{
                    if(account.AccountNumber.contains('SA-')){
                        account.AccountNumber=account.AccountNumber.remove('SA-') ;   
                    } 
                    if(account.AccountNumber.contains('FD-')){
                        account.AccountNumber=account.AccountNumber.remove('FD-') ;   
                    } 
                }    
            }
        }
    }

    /**   Description :   Method for sending Email via entered mail 
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   List(trigger.new)
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - 27/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - 27/07/2022 
    **/
    public static void sendEmailNotification(List<Account> newAccount) {
        List<Messaging.SingleEmailMessage> emailList=new List<Messaging.SingleEmailMessage>();
        for(Account acc:newAccount){
            if(emailList!=null){
                Messaging.SingleEmailMessage emailMessage=new Messaging.SingleEmailMessage();
                String[] toAddresses=new List<String> {acc.Email__c};  //setting address to which mail is sent                
                if(!toAddresses.isEmpty()){
                    emailMessage.setToAddresses(toAddresses);
                    emailMessage.setSubject('Welcome To HDFC Banking Services:'+acc.Name); //Setting Mail's Subject 
                    //Setting HTML Body 
                    String Body='Hi :'+acc.Name+',<br>'+'Congreatulations Your Account is Created Successfuly'+',<br>'
                    +'Your Account Details are:'+',<br>'
                    +' Account Type='+acc.Type+',<br>'+'Account Number is:'+acc.AccountNumber+',<br>'
                    +'Registered Mail='+acc.Email__c+',<br>';
                    emailMessage.setHtmlBody(Body);
                }    
                emailList.add(emailMessage);
            }    
        }
        Messaging.sendemail(emailList);
    }

    /**   Description :   Method for updating the phone Description and addError
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   (trigger.new,Trigger.oldMap)
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - 28/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - 28/07/2022 Modified updatePhoneDescription method
    **/
    public static void updatePhoneDescription(List<Account> newAccount,Map<Id,Account> oldAccountMap){
        for(Account acc:newAccount){
            if(oldAccountMap!=null && acc.Phone!=oldAccountMap.get(acc.Id).Phone&&acc.Phone==null)            
            acc.addError('Phone can not be blank');//adding error if phone is blank
            else
            acc.Description='Succesfuly Phone is Modified on account--> '+acc.Phone;            
        }    
    }
}
