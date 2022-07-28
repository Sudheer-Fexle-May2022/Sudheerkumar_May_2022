/**
* Description   - This trigger will use for type check and send email
* Created by    - Sudheer Kumar Shakya
* Created Date  - 27/07/2022
* Revision log  -  V_1.0 - Created  - Sudheer Kumar - 27/07/2022
*                  V_1.1 - Modified - Sudheer Kumar - 27/07/2022
**/
trigger Trigger_Account on Account (Before insert,Before update,After insert) {

    //Performing Different Before Event
    if(Trigger.isBefore){

        if(Trigger.isInsert||Trigger.isUpdate){

            //Here Calling Method which is used to add prefix as per entered type
            TriggerHandler.prefixforAccount(Trigger.new,Trigger.oldMap); 
            system.debug('Check Insert List ::: Trigger.New ' + Trigger.New);
            System.debug('Check Insert List ::: Trigger.oldMap ' + Trigger.oldMap);   
        }  
        
        if(Trigger.isUpdate){
            //Here Calling the method which is used to update the Phone Description
            TriggerHandler.updatePhoneDescription(Trigger.New,Trigger.oldMap);
            system.debug('Check Insert List for UPD::: Trigger.New ' + Trigger.New);
            System.debug('Check Insert List for UPD::: Trigger.oldMap ' + Trigger.oldMap);
        }
    } 

    //Performing After event
    if(Trigger.isAfter){ 
        if(Trigger.isInsert){  
            //Here we are Calling the method which is used to send Email             
            TriggerHandler.sendEmailNotification(Trigger.new); 
            System.debug('Check Insert List ::: Trigger.New ' + Trigger.New); 
        }
    } 
}