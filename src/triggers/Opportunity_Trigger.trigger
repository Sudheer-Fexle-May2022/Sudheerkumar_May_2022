trigger Opportunity_Trigger on Opportunity (After insert,After update) {
    if(Trigger.isAfter){
        if(Trigger.isInsert||Trigger.isUpdate){
            OpportunityTriggerHandler.maintainAutomobileRecords(Trigger.new,Trigger.oldMap);  
        }
    }
}