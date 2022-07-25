/**
* Description   - This class is created to perform dml operations and other 
* Created by    - Sudheer Kumar Shakya
* Created Date  - 22/07/2022
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date -22/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date -22/07/2022
**/
public with sharing class ValidationsObjectandperformDML{
    
    /**   Description :   Method to perform insert 
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 22/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 22/07/2022
    **/
    public static void insertRecords(){
        List<Account> insertAccounts=new List<Account>();
        for(integer i=0;i<=5;i++){
            Account a=new Account(Name='insertAccount'+i);
            insertAccounts.add(a);
        }
        //inserting records
        insert insertAccounts;
        System.debug('inserted accounts successfully:'+insertAccounts);
    }

    /**   Description :   Method to perform update 
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 22/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 22/07/2022
    **/
    public static void updateRecords(){
        List<Account> accountList=[SELECT Name,AccountNumber,Rating,Phone FROM Account WHERE Name Like : 'My AccountafterUpdatedNow'];
        for(Account a:accountList){
            a.Name=a.Name+'Now';
            a.AccountNumber='1234567890';
            a.Rating='Hot';
            a.Phone='9876543';
        }
        //updating record
        update accountList;
        System.debug('Updated records are:'+accountList);
    }

    /**   Description :   Method to perform upsert 
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 22/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 22/07/2022
    **/
    public static void upsertRecord(){
        List<Account> upsertRecord=new List<Account>();
        for(integer i=0;i<2;i++){
            Account a=new Account(Name='upserted Record Number'+i);
            upsertRecord.add(a);   
        }
        upsert upsertRecord;
        System.debug('Upserted records are :-->'+upsertRecord);
    }

    /**   Description :   Method to perform delete an undelete
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 22/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 22/07/2022
    **/
    public static void deleteandundeleteRecords(){
        List<Account> deleteList=[SELECT Name,AccountNumber FROM ACCOUNT WHERE Name Like : 'My AccountafterUpdated'];
        delete deleteList;
        List<Account> undeleteList=[SELECT Name,AccountNumber FROM ACCOUNT WHERE Name Like : 'My AccountafterUpdated'];
        undelete undeleteList;  
        System.debug('Deleted List:-->'+deleteList);
        System.debug('unDeleted List:-->'+undeleteList); 
    }

    /**   Description :   Here we shall perform merge method
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 22/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 22/07/2022
    **/
    public static void mergeRecord(){

        List<Account> mergeAccount=[SELECT Name From Account WHERE Name LIKE : 'Merg%' LIMIT 3];
        
        Account a=mergeAccount[0];
        Account b=mergeAccount[1];
        Account c=mergeAccount[2];

        List<Account> mergeList=new List<Account>();
       
        mergeList.add(mergeAccount[1]);
        mergeList.add(mergeAccount[2]);

        merge a mergeList;
    }

    /**   Description :   record insertion
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 22/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 22/07/2022
    **/
    public static void parentchildRelationship(){

        Opportunity newOpportunity = new Opportunity(Name = 'Learners Community', 
                                     StageName = 'Qualification',Amount=1000000, 
                                     Type='New Customer', LeadSource='Web',
                                     CloseDate = Date.today().addDays(12) );

        List<Account> listAccount = [SELECT id, Name from Account WHERE 
                                     Name = 'My AccountafterUpdatedNow' ];

        newOpportunity.AccountId =  listAccount[0].id;
        Database.SaveResult results = Database.insert(newOpportunity);
    }

    /**   Description :   Parent to Child Relation Query
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 22/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 22/07/2022
    **/
    public static void parenttochildQuery(){

        List<Account> accountList=[SELECT Name,NumberOfEmployees,AccountNumber,
                                    (SELECT lastName,Phone FROM Contacts) 
                                    FROM Account];
        if(!accountList.isEmpty()){
            for(Account account : accountList ){
                System.debug('Account Name -->'+ account.Name );
            }
        }                            
    }

    /**   Description :   Child to Parent relation query
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 22/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 22/07/2022
    **/    
    public static void childtoparentQuery(){

        List<Contact> conList=[SELECT firstName,lastName,Account.Name,Account.NumberOfEmployees FROM Contact];
        if(!conList.isEmpty()){
            for(Contact contact : conList){

                System.debug('Account Name-->' + contact.Account.Name);          
                System.debug('Employees==' + contact.Account.NumberOfEmployees);
            }    
        }         
    }

    /**   Description :   Both the relations in a single query
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 23/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 23/07/2022
    **/    
    public static void bothRelationquery(){
        Contact con = new Contact(lastName='TheBlogReaders'); 
        con.Email = 'info@theblogreaders.com';
        Account accReference = new Account(AccountRef__c='123456789');
        con.Account = accReference;  
        Account acc = new Account(Name='Hallie', AccountRef__c='123456789');  
        Database.SaveResult[] results = Database.insert(new SObject[] {acc, con}); 
        for (Integer i = 0; i < results.size(); i++) { 
            if (results[i].isSuccess()) {
                System.debug('Successfully Created ID: '+ results[i].getId()); 
            } 
            else{ 
                System.debug('Error: could not create sobject '+ 'for array element ' + i + '.'); 
                System.debug(' The error reported was: '+ results[i].getErrors()[0].getMessage() + '\n');
            } 
        } 
    }

    /**   Description :   To perform Convert Lead concept example
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 23/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 23/07/2022
    **/  
    public static void convertLead(){
        Lead myLead = new Lead(LastName = 'Services', Company='Fexle Services');
        insert myLead;

        Database.LeadConvert result1 = new database.LeadConvert();
        result1.setLeadId(myLead.id);

        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        result1.setConvertedStatus(convertStatus.MasterLabel);

        Database.LeadConvertResult result2 = Database.convertLead(result1);
        System.debug(result2);

    }
    /**   Description :   To perform Exception Handling
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 23/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 23/07/2022
    **/  
    public static void exceptionHandling(integer i){

        try{
            if(i==0){
                Integer a;
                Integer b=a*5;
            }
            else{
                Account acc=new Account();
                insert acc; 
            }
        }
        catch(NullPointerException npe){
            System.debug('Null Pointer Exception');
        }
        catch(DMLException d){
            System.debug('DML Exception');
        }
        catch(Exception e){
            System.debug('Any other Exception');
        }
        finally{
            System.debug('No matter Whetehr error is or not');
        }
    }
}