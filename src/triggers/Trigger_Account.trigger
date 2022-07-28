/**
* Description   - This trigger will use for type check and send email
* Created by    - Sudheer Kumar Shakya
* Created Date  - 27/07/2022
* Revision log  -  V_1.0 - Created  - Sudheer Kumar - 27/07/2022
*                  V_1.1 - Modified - Sudheer Kumar - 27/07/2022
**/
trigger Trigger_Account on Account (Before insert,Before update,After insert) {
    
    //Here Calling Method which is used to add prefix as per entered type
    if(Trigger.isBefore&&Trigger.isInsert){
        TriggerHandler.prefixforAccount(Trigger.new,Trigger.oldMap); 
        system.debug('Check Insert List ::: Trigger.New ' + Trigger.New);
        system.debug('Check Insert List ::: Trigger.old ' + Trigger.old);          
    } 

    //Calling method which is used to send Email
    if(Trigger.isAfter&&Trigger.isInsert){                
        TriggerHandler.sendEmailNotification(Trigger.new); 
        System.debug('Check Insert List ::: Trigger.New ' + Trigger.New);     
    } 
 
    //Calling method which is used to update Phone description
    if(Trigger.isBefore && Trigger.isUpdate){
        TriggerHandler.updatePhoneDescription(Trigger.New,Trigger.oldMap);
        TriggerHandler.prefixforAccount(Trigger.new,Trigger.oldMap); 
    }

}