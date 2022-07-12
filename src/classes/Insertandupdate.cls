/**
* Description   -   
* Created by    - Sudheer Kumar Shakya
* Created Date  - 09/07/2022
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date - 09/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
**/
public with sharing class Insertandupdate{


    /**   Description :   this method is being used to insert records
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   none
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 09/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
    **/
    public static void insertRecord(){

       Account a=new Account(Name='My new Account',Numberofemployees=100);
       insert a; 

       //Associated Contacts
       Contact c=new Contact(firstName='Max',lastName='Brown',accountid=a.Id); 
       Contact c1=new Contact(firstName='Jeff',lastName='Brown',accountid=a.Id);

       List<Contact> conList=new List<Contact>();

       conList.add(c);
       conList.add(c1);
       
       insert conList;

       //Associated Opportunity
       Date d=Date.today()+40;
       Opportunity o=new Opportunity(Name='Sell Types',StageName='Prospecting',CloseDate=d,accountid=a.Id);
       Opportunity o1=new Opportunity(Name='Sell Papers',StageName='Prospecting',CloseDate=d,accountid=a.Id);
       
       List<Opportunity> oppList=new List<Opportunity>();

       oppList.add(o);
       oppList.add(o1);

       insert oppList;
    }
    
    /**   Description :   this method is being used to update records
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   none
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 09/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
    **/
    public static void updateRecord(){
        List<Opportunity> oppList=[Select Name,closeDate from Opportunity where CreatedDate=LAST_90_Days ];    
        Date d=System.today()+90;
        for(Opportunity o:oppList){
            o.closeDate=d;
        }
        update oppList;
    }

    //Convert type
    List<Contact> c = new List<Contact>();
    List<Lead> l = new List<Lead>();
    List<Account> a = new List<Account>();
 
    /**   Description :   this method is being used to convert type
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   string
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 09/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
    **/
    public void convertType(String contactNumber) {

        List<List<SObject>> res = [FIND :contactNumber  IN Phone FIELDS RETURNING Contact(Id, Phone, FirstName, LastName), Lead(Id, Phone, FirstName, LastName), Account(Id, Phone, Name)];

        List<SObject> records = new List<SObject>();
        records.addAll(res[0]); //add Contact results to our results super-set
        records.addAll(res[1]); //add Lead results
        records.addAll(res[2]); //add Account results
 
        if (!records.isEmpty()) { 
            for (Integer i = 0; i < records.size(); i++) { 
                SObject record = records[i];

                if (record.getSObjectType() == Contact.sObjectType) { 
                    c.add((Contact) record);
                } 

                else if (record.getSObjectType() == Lead.sObjectType){ 
                    l.add((Lead) record);
                } 

                else if (record.getSObjectType() == Account.sObjectType) { 
                    a.add((Account) record); 
                }
            }
        }
    }
}