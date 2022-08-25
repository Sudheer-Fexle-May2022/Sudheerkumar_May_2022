/** 
* Description   :   This class is helper of opportunity trigger class.
*
* Created By    :   Sudheer Kumar Shakya
*
* Created Date  :   10/8/2022
*
* Division Log  :   V1.0 Created
*              
**/
public class OpportunityTriggerHandler {
    
    public static String AUTO_MOBILE_PRESENCE_SENSOR = 'AMPS';
    public static String AUTO_MOBILE_SENSOR = 'ABS';
    public static String AUTO_MOBILE_TAG = 'AMTAG';
    public static String AUTO_MOBILE_TDU = 'AMTDU';
    
    /* 
	*	Description     : This method is used to create automobile object record on insert and update oppourtunity.
	*
	*	Return Type		: void
	*
	*	@argument		: List, Map
	*
	*	Revision Logs   : V_1.0 - Created
	*/
    public static void maintainAutomobileRecords(List<Opportunity> newListOfOpportunity, Map<Id, Opportunity> oldMapOfOpportunity){
        
		try{
            //Map to hold opportunity automobile detail as list with opportunity id.
            Map<Id, List<String>> mapOfAutoMobileDetailByOppId = new Map<Id, List<String>>();
            
            //Map to hold opportunity child object by its id.
            Map<Id, Map<String, List<Sobject>>> mapOfchildObjecctOfOpportunity = new Map<Id, Map<String, List<Sobject>>>();
            
            //Map used to get id of child object in delete case.
            Map<Id, Map<String,Id>> mapOfIdOfChildObject = new Map<Id, Map<String, Id>>();
            
            //Map used to hold opportunity owner email id.
            Map<Id, Opportunity> mapOfOppOwner = new Map<Id, Opportunity>();
            
            //Map to insert sobject record.
            Map<Id, List<SObject>> mapToInsertSobjectRecord = new Map<Id, List<SObject>>();
            
            //Map to update sobject record.
            Map<Id, List<SObject>> mapToUpdateSobjectRecord = new Map<Id, List<SObject>>();
            
            //Map to Delete sobject record.
            Map<Id, List<SObject>> mapToDeleteSobjectRecord = new Map<Id, List<SObject>>();
            
            //Map to hold invalid data in automobile detail fields.
            Map<Id, List<String>> mapOfInvlidData = new Map<Id, List<String>>();
            
            //List to hold record of different type object instance.
            List<SObject> listOfSobjectToInsert = new List<SObject>();
            
            //Loop over newListOfOpportunity to fill mapOfAutoMobileDetailByOppId.
            for(Opportunity opp : newListOfOpportunity){
                
                //check stage of opp and detail fields vlaues.
                if(opp.AccountId != null && (opp.StageName.EqualsIgnoreCase('Shipped To Customer') || opp.StageName.EqualsIgnoreCase('Return to HQ') || opp.StageName.EqualsIgnoreCase('Return to Customer'))){
                   mapOfAutoMobileDetailByOppId.put(opp.Id, getListOfSeprateString(opp.Automobile_Tag_Details_1__c +'\n'+opp.Automobile_Tag_Details_2__c+'\n'+opp.Automobile_Tag_Details_3__c));
                }
            }
            
            //Query on opportunity to fill mapOfchildObjecctOfOpportunity.
            for(Opportunity opp : [SELECT Id, Name, StageName, AccountId, Shipment_Account__c, 
                (SELECT Id, Name, Account__c, Opportunity__c From Automobile_Presence_Sensors__r), 
                (SELECT Id, Name, Account__c, Opportunity__c From Automobile_Sensors__r),
                (SELECT Id, Name, Account__c, Opportunity__c From Automobile_Tags__r), 
                (SELECT Id, Name, Account__c, Opportunity__c From Automobile_TDUs__r)
                FROM Opportunity WHERE Id IN : mapOfAutoMobileDetailByOppId.KeySet()]){
                                       
                //fill mapOfOppOwner.
                mapOfOppOwner.put(opp.Id, opp);
                    
                //check opp id contains in mapOfchildObjecctOfOpportunity
                if(!mapOfchildObjecctOfOpportunity.containsKey(opp.Id))
                    mapOfchildObjecctOfOpportunity.put(opp.Id, new Map<String, List<Sobject>>());
                
                //fill mapOfIdOfChildObject
                if(!mapOfIdOfChildObject.containsKey(opp.Id))
                    mapOfIdOfChildObject.put(opp.Id, new Map<String, Id>());
                
                //Loop over Auto_Mobile_Presence_Sensor__r
                for(Automobile_Presence_Sensor__c amps : opp.Automobile_Presence_Sensors__r){
                    
                    if(!mapOfchildObjecctOfOpportunity.get(opp.Id).containsKey(AUTO_MOBILE_PRESENCE_SENSOR))
                        mapOfchildObjecctOfOpportunity.get(opp.Id).put(AUTO_MOBILE_PRESENCE_SENSOR, new List<Sobject>());
                    
                    mapOfchildObjecctOfOpportunity.get(opp.Id).get(AUTO_MOBILE_PRESENCE_SENSOR).add(amps);
                    mapOfIdOfChildObject.get(opp.Id).put(amps.Name, amps.Id);
                }
                
                //Loop over Auto_Mobile_Sensor__r
                for(Automobile_Sensor__c ams : opp.Automobile_Sensors__r){
                    
                    if(!mapOfchildObjecctOfOpportunity.get(opp.Id).containsKey(AUTO_MOBILE_SENSOR))
                        mapOfchildObjecctOfOpportunity.get(opp.Id).put(AUTO_MOBILE_SENSOR, new List<Sobject>());
                    
                    mapOfchildObjecctOfOpportunity.get(opp.Id).get(AUTO_MOBILE_SENSOR).add(ams);
                    mapOfIdOfChildObject.get(opp.Id).put(ams.Name, ams.Id);
                }
                
                //Loop over Auto_Mobile_TAG__r
                for(Automobile_Tag__c amtag : opp.Automobile_Tags__r){
                    
                    if(!mapOfchildObjecctOfOpportunity.get(opp.Id).containsKey(AUTO_MOBILE_TAG))
                        mapOfchildObjecctOfOpportunity.get(opp.Id).put(AUTO_MOBILE_TAG, new List<Sobject>());
                    
                    mapOfchildObjecctOfOpportunity.get(opp.Id).get(AUTO_MOBILE_TAG).add(amtag);
                    mapOfIdOfChildObject.get(opp.Id).put(amtag.Name, amtag.Id);
                }
                
                //Loop over Auto_Mobile_TAG__r
                for(Automobile_TDU__c amtdu : opp.Automobile_TDUs__r){
                    
                    if(!mapOfchildObjecctOfOpportunity.get(opp.Id).containsKey(AUTO_MOBILE_TDU))
                        mapOfchildObjecctOfOpportunity.get(opp.Id).put(AUTO_MOBILE_TDU, new List<Sobject>());
                    
                    mapOfchildObjecctOfOpportunity.get(opp.Id).get(AUTO_MOBILE_TDU).add(amtdu);
                    mapOfIdOfChildObject.get(opp.Id).put(amtdu.Name, amtdu.Id);
                }
            }
            
            //Loop over newlistOfOpportunity.
            for(Opportunity opp : newListOfOpportunity){
                
                //handle insert and update case.
                if(opp.AccountId != null && (oldMapOfOpportunity == null || (oldMapOfOpportunity != null &&( opp.Automobile_Tag_Details_1__c != oldMapOfOpportunity.get(opp.Id).Automobile_Tag_Details_1__c
                    || opp.Automobile_Tag_Details_2__c != oldMapOfOpportunity.get(opp.Id).Automobile_Tag_Details_2__c 
                    || opp.Automobile_Tag_Details_3__c != oldMapOfOpportunity.get(opp.Id).Automobile_Tag_Details_3__c
                    || opp.Return_to_HQ__c != oldMapOfOpportunity.get(opp.Id).Return_to_HQ__c
                    || opp.StageName !=  oldMapOfOpportunity.get(opp.Id).stageName)))){
                                                                                 
                    //Set to used prevent duplicate entry.
                    Set<String> setOfChildRecordName = new Set<String>();
                    
                    //contains key check on mapOfchildObjecctOfOpportunity
                    if(mapOfchildObjecctOfOpportunity.containsKey(opp.Id)){
                        
                        Map<String, List<SObject>> mapOfDetailData = mapOfchildObjecctOfOpportunity.get(opp.Id);
                        
                        //size check of map.
                        if(mapOfDetailData.size() > 0){
                            for(String mapKey : mapOfDetailData.keySet()){
                                
                                for(Sobject sobj : mapOfDetailData.get(mapKey))
                                    setOfChildRecordName.add(String.valueOf(sobj.get('Name')));
                            }
                        }
                    }
                                                                                 
                    //handle opportunity stage is shippment.
                    if(opp.StageName.EqualsIgnoreCase('Shipment')){
                    
                        //insert case in shipment stage.
                        if(oldMapOfOpportunity == null && mapOfAutoMobileDetailByOppId.containskey(opp.Id)){
                            
                            //loop over map values.
                            for(String autoMobileName : mapOfAutoMobileDetailByOppId.get(opp.Id)){
                                
                                //check autoMobileData is exits or not.
                                if(!setOfChildRecordName.contains(autoMobileName)){
                                    if(!mapToInsertSobjectRecord.containskey(opp.Id))
                                            mapToInsertSobjectRecord.put(opp.Id, new List<SObject>());
                                    
                                    if(isAutoMobileSensor(autoMobileName)){
                                        mapToInsertSobjectRecord.get(opp.Id).add(new Automobile_Sensor__c(Name = autoMobileName, Account__c = opp.AccountId, Opportunity__c = opp.id));
                                        setOfChildRecordName.add(autoMobileName);
                                    }
                                    
                                    else if(isAutoMobilePresenceSensor(autoMobileName)){
                                        mapToInsertSobjectRecord.get(opp.Id).add(new Automobile_Presence_Sensor__c(Name = autoMobileName, Account__c = opp.AccountId, Opportunity__c = opp.id));
                                        setOfChildRecordName.add(autoMobileName);
                                    }
                                    else if(isAutoMobileTDU(autoMobileName)){
                                        mapToInsertSobjectRecord.get(opp.Id).add(new Automobile_TDU__c(Name = autoMobileName, Account__c = opp.AccountId, Opportunity__c = opp.id));
                                        setOfChildRecordName.add(autoMobileName);
                                    }
                                    else if(isAutoMobileTAG(autoMobileName)){
                                        mapToInsertSobjectRecord.get(opp.Id).add(new Automobile_TAG__c(Name = autoMobileName, Account__c = opp.AccountId, Opportunity__c = opp.id));
                                        setOfChildRecordName.add(autoMobileName);
                                    }
                                    else{
                                        if(!mapOfInvlidData.containsKey(opp.Id))
                                            mapOfInvlidData.put(opp.Id, new List<String>());
                                        mapOfInvlidData.get(opp.Id).add(autoMobileName);
                                    }
                                } 
                            }
                        }
                        //Update case in shipment stage.
                        if(oldMapOfOpportunity != null && opp.AccountId!= null && (opp.Automobile_Tag_Details_1__c != oldMapOfOpportunity.get(opp.Id).Automobile_Tag_Details_1__c
                            || opp.Automobile_Tag_Details_2__c != oldMapOfOpportunity.get(opp.Id).Automobile_Tag_Details_2__c 
                            || opp.Automobile_Tag_Details_3__c != oldMapOfOpportunity.get(opp.Id).Automobile_Tag_Details_3__c
                            || opp.StageName !=  oldMapOfOpportunity.get(opp.Id).stageName)){
                            
                            //List to hold oldDetal value.
                            List<String> oldDetails = new List<String>();
                            
                            //List to hold newDetail value.
                            List<String> newDetails = new List<String>();
                            
                            List<String> listOfAutoMobileDetailold = new List<String>();
                            
                            newDetails = getListOfSeprateString(opp.Automobile_Tag_Details_1__c +'\n'+opp.Automobile_Tag_Details_2__c+'\n'+opp.Automobile_Tag_Details_3__c);
                            oldDetails =  getListOfSeprateString(oldMapOfOpportunity.get(opp.Id).Automobile_Tag_Details_1__c +'\n'+oldMapOfOpportunity.get(opp.Id).Automobile_Tag_Details_2__c+'\n'+oldMapOfOpportunity.get(opp.Id).Automobile_Tag_Details_3__c);
                            
                            //loop to add sobject to insert from newDetails.
                            for(String newDetail : newDetails){
                                
                                if(!oldDetails.contains(newDetail) && !setOfChildRecordName.contains(newDetail)){
                                    if(!mapToInsertSobjectRecord.containskey(opp.Id))
                                        mapToInsertSobjectRecord.put(opp.Id, new List<SObject>());
                                    
                                    if(isAutoMobileSensor(newDetail)){
                                        mapToInsertSobjectRecord.get(opp.Id).add(new Automobile_Sensor__c(Name = newDetail, Account__c = opp.AccountId, Opportunity__c = opp.id));
                                        setOfChildRecordName.add(newDetail);
                                    }
                                    
                                    else if(isAutoMobilePresenceSensor(newDetail)){
                                        mapToInsertSobjectRecord.get(opp.Id).add(new Automobile_Presence_Sensor__c(Name = newDetail, Account__c = opp.AccountId, Opportunity__c = opp.id));
                                        setOfChildRecordName.add(newDetail);
                                    }
                                    else if(isAutoMobileTDU(newDetail)){
                                        mapToInsertSobjectRecord.get(opp.Id).add(new Automobile_TDU__c(Name = newDetail, Account__c = opp.AccountId, Opportunity__c = opp.id));
                                        setOfChildRecordName.add(newDetail);
                                    }
                                    else if(isAutoMobileTAG(newDetail)){
                                        mapToInsertSobjectRecord.get(opp.Id).add(new Automobile_Tag__c(Name = newDetail, Account__c = opp.AccountId, Opportunity__c = opp.id));
                                        setOfChildRecordName.add(newDetail);
                                    }
                                    else{
                                        if(!mapOfInvlidData.containsKey(opp.Id))
                                            mapOfInvlidData.put(opp.Id, new List<String>());
                                        mapOfInvlidData.get(opp.Id).add(newDetail);
                                    }
                                }
                            }
                            
                            //Loop to add sobject record to delete.
                            for(String oldDetail : oldDetails){
                                if(!newDetails.contains(oldDetail) && mapOfIdOfChildObject.containsKey(opp.Id) && mapOfIdOfChildObject.get(opp.Id).keySet().contains(oldDetail)){
                                    if(!mapToDeleteSobjectRecord.containsKey(opp.Id))
                                        mapToDeleteSobjectRecord.put(opp.Id, new List<Sobject>());
                                    
                                    if(isAutoMobileSensor(oldDetail)){
                                        mapToDeleteSobjectRecord.get(opp.Id).add(new Automobile_Sensor__c(Id = mapOfIdOfChildObject.get(opp.Id).get(oldDetail)));
                                    }
                                    
                                    else if(isAutoMobilePresenceSensor(oldDetail)){
                                        mapToDeleteSobjectRecord.get(opp.Id).add(new Automobile_Presence_Sensor__c(Id = mapOfIdOfChildObject.get(opp.Id).get(oldDetail)));
                                    }
                                    else if(isAutoMobileTDU(oldDetail)){
                                        mapToDeleteSobjectRecord.get(opp.Id).add(new Automobile_TDU__c(Id = mapOfIdOfChildObject.get(opp.Id).get(oldDetail)));
                                    }
                                    else if(isAutoMobileTAG(oldDetail)){
                                        mapToDeleteSobjectRecord.get(opp.Id).add(new Automobile_TAG__c(Id = mapOfIdOfChildObject.get(opp.Id).get(oldDetail)));
                                    }
                                    else{
                                        if(!mapOfInvlidData.containsKey(opp.Id))
                                            mapOfInvlidData.put(opp.Id, new List<String>());
                                        mapOfInvlidData.get(opp.Id).add(oldDetail);
                                    }
                                }
                            }
                        }
                    }
                    
                    //handle opportuinity stage is Return to HQ.
                    if(opp.stageName.EqualsIgnoreCase('Return To HQ') && opp.Shipment_Account__c != null && String.isNotBlank(opp.Return_to_HQ__c)){
                        
                        //List to hold RTHQ data.
                        List<String> RTHQData = getListOfSeprateString(opp.Return_to_HQ__c);
                        
                        //List to hold automobile detail data.
                        List<String> autoMobileData = getListOfSeprateString(opp.Automobile_Tag_Details_1__c +'\n'+opp.Automobile_Tag_Details_2__c+'\n'+opp.Automobile_Tag_Details_3__c);
                        
                        //loop over RTHQ Data to update child object record.
                        for(String RTHQSingleData : RTHQData){
                            //check RTHQ data contain in automobile data.
                            if(autoMobileData.contains(RTHQSingleData) && mapOfIdOfChildObject.containsKey(opp.Id) && mapOfIdOfChildObject.get(opp.Id).KeySet().Contains(RTHQSingleData)){
                                if(!mapToUpdateSobjectRecord.containskey(opp.Id))
                                    mapToUpdateSobjectRecord.put(opp.Id, new List<SObject>());
                                
                                if(isAutoMobileSensor(RTHQSingleData))
                                    mapToUpdateSobjectRecord.get(opp.Id).add(new Automobile_Sensor__c(Id = mapOfIdOfChildObject.get(opp.Id).get(RTHQSingleData), Name = RTHQSingleData, Account__c = opp.Shipment_Account__c));
                                
                                else if(isAutoMobilePresenceSensor(RTHQSingleData))
                                    mapToUpdateSobjectRecord.get(opp.Id).add(new Automobile_Presence_Sensor__c(Id = mapOfIdOfChildObject.get(opp.Id).get(RTHQSingleData), Name = RTHQSingleData, Account__c = opp.Shipment_Account__c));
                                
                                else if(isAutoMobileTDU(RTHQSingleData))
                                    mapToUpdateSobjectRecord.get(opp.Id).add(new Automobile_TDU__c(Id = mapOfIdOfChildObject.get(opp.Id).get(RTHQSingleData), Name = RTHQSingleData, Account__c = opp.Shipment_Account__c));
                                
                                else if(isAutoMobileTAG(RTHQSingleData))
                                    mapToUpdateSobjectRecord.get(opp.Id).add(new Automobile_Tag__c(Id = mapOfIdOfChildObject.get(opp.Id).get(RTHQSingleData), Name = RTHQSingleData, Account__c = opp.Shipment_Account__c));
                                else{
                                    if(!mapOfInvlidData.containsKey(opp.Id))
                                            mapOfInvlidData.put(opp.Id, new List<String>());
                                        mapOfInvlidData.get(opp.Id).add(RTHQSingleData);
                                }
                            }
                        }
                    }
                    
                    //handle opportunity stage is Return to customer.
                    if(opp.stageName.EqualsIgnoreCase('Return To Customer') && opp.AccountId != null && String.isNotBlank(opp.Return_to_HQ__c)){
                        
                        //List to hold RTHQ data.
                        List<String> RTHQData = getListOfSeprateString(opp.Return_to_HQ__c);
                        
                        //loop over RTHQ Data to update child object record.
                        for(String RTHQSingleData : RTHQData){
                            //check RTHQ data contain in automobile data.
                            if( mapOfIdOfChildObject.containsKey(opp.Id) && mapOfIdOfChildObject.get(opp.Id).KeySet().Contains(RTHQSingleData)){
                                if(!mapToUpdateSobjectRecord.containskey(opp.Id))
                                    mapToUpdateSobjectRecord.put(opp.Id, new List<Sobject>());
                                
                                if(isAutoMobileSensor(RTHQSingleData)){
                                    mapToUpdateSobjectRecord.get(opp.Id).add(new Automobile_Sensor__c(Id = mapOfIdOfChildObject.get(opp.Id).get(RTHQSingleData), Name = RTHQSingleData, Account__c = opp.AccountId));
                                }
                                
                                else if(isAutoMobilePresenceSensor(RTHQSingleData)){
                                    mapToUpdateSobjectRecord.get(opp.Id).add(new Automobile_Presence_Sensor__c(Id = mapOfIdOfChildObject.get(opp.Id).get(RTHQSingleData), Name = RTHQSingleData, Account__c = opp.AccountId));
                                }
                                else if(isAutoMobileTDU(RTHQSingleData)){
                                    mapToUpdateSobjectRecord.get(opp.Id).add(new Automobile_TDU__c(Id = mapOfIdOfChildObject.get(opp.Id).get(RTHQSingleData), Name = RTHQSingleData, Account__c = opp.AccountId));
                                }
                                else if(isAutoMobileTAG(RTHQSingleData)){
                                    mapToUpdateSobjectRecord.get(opp.Id).add(new Automobile_Tag__c(Id = mapOfIdOfChildObject.get(opp.Id).get(RTHQSingleData),  Name = RTHQSingleData, Account__c = opp.AccountId));
                                }
                                else{
                                    if(!mapOfInvlidData.containsKey(opp.Id))
                                        mapOfInvlidData.put(opp.Id, new List<String>());
                                    mapOfInvlidData.get(opp.Id).add(RTHQSingleData);
                                }
                            }
                        }
                    }
                }
            }
            //Map of successfully insert record.
            Map<Id, List<Sobject>> mapOfSuccessfullyInsertRecord = new Map<Id, List<Sobject>>();
            Map<Id, List<String>> mapOfUnsuccessfullRecordToInsert = new Map<Id, List<String>>();
            
            if(mapToInsertSobjectRecord.size() > 0){
                //Set of successfully inserted record id.
                Set<Id> setOfSuccessRecord = new Set<Id>();
                
                //List to insert sobject record.
                List<SObject> listToInsert = new List<SObject>();
                
                //loop over map keyset.
                for(Id key : mapToInsertSobjectRecord.keySet())
                    listToInsert.addAll(mapToInsertSobjectRecord.get(key));
                
                //insert sobject.
                Database.SaveResult[] insertedRecordResult = Database.insert(listToInsert, false);
                
                for(Integer i=0; i< insertedRecordResult.size(); i++){
                    if(insertedRecordResult.get(i).isSuccess()){
                        setOfSuccessRecord.add(insertedRecordResult.get(i).getId());
                    }
                    
                    else{
                        String dataName = String.valueOf(listToInsert[i].get('Name'));
                        if(!mapOfUnsuccessfullRecordToInsert.containsKey(String.valueOf(listToInsert[i].get('Opportunity__c'))))
                            mapOfUnsuccessfullRecordToInsert.put(String.valueOf(listToInsert[i].get('Opportunity__c')), new List<String>());
						   
                        if(isAutoMobileSensor(dataName)){
                            mapOfUnsuccessfullRecordToInsert.get(String.valueOf(listToInsert[i].get('Opportunity__c'))).add('Automobile Sensor'+'##'+String.valueOf(listToInsert[i].get('Name')) +'##'+insertedRecordResult.get(i).getErrors());
                        }
                        
                        else if(isAutoMobilePresenceSensor(dataName)){
                            mapOfUnsuccessfullRecordToInsert.get(String.valueOf(listToInsert[i].get('Opportunity__c'))).add('Automobile Presence Sensor'+'##'+String.valueOf(listToInsert[i].get('Name')) +'##'+insertedRecordResult.get(i).getErrors());
                        }
                        else if(isAutoMobileTDU(dataName)){
                            mapOfUnsuccessfullRecordToInsert.get(String.valueOf(listToInsert[i].get('Opportunity__c'))).add('Automobile TDU'+'##'+String.valueOf(listToInsert[i].get('Name')) +'##'+insertedRecordResult.get(i).getErrors());
                        }
                        else if(isAutoMobileTAG(dataName)){
                            mapOfUnsuccessfullRecordToInsert.get(String.valueOf(listToInsert[i].get('Opportunity__c'))).add('Automobile Tag'+'##'+String.valueOf(listToInsert[i].get('Name')) +'##'+insertedRecordResult.get(i).getErrors());
                        }
                        
                    }
                }
                
                //Loop over mapToInsertSobjectRecord to fill mapOfSuccessfullyInsertRecord
                for(Id key : mapToInsertSobjectRecord.KeySet()){
                    for(Sobject obj : mapToInsertSobjectRecord.get(Key)){
                        if(obj.get('Id') != null && setOfSuccessRecord.contains(String.valueOf(obj.get('Id')))){
                            if(!mapOfSuccessfullyInsertRecord.containsKey(key))
                                mapOfSuccessfullyInsertRecord.put(Key, new List<Sobject>());
                            mapOfSuccessfullyInsertRecord.get(key).add(obj);
                        }
                    }
                }
            }
            //size check of delted record map.
            if(mapToDeleteSobjectRecord.size() > 0){
                List<Sobject> listToDelete = new List<Sobject>();
                for(Id Key : mapToDeleteSobjectRecord.Keyset())
                    listToDelete.addAll(mapToDeleteSobjectRecord.get(key));
                
                Delete listToDelete;
            }
            //size check of map.
            if(mapToUpdateSobjectRecord.size() > 0){
                List<Sobject> listToUpdate = new List<Sobject>();
                for(Id Key : mapToUpdateSobjectRecord.Keyset())
                    listToUpdate.addAll(mapToUpdateSobjectRecord.get(key));
                
                update listToUpdate;
            }
			// call send email method.
            sendEmailToOwner(mapOfOppOwner, mapOfSuccessfullyInsertRecord, mapToUpdateSobjectRecord, mapOfUnsuccessfullRecordToInsert, mapOfInvlidData);
            
        }catch(Exception e){
            system.assert(false, e.getMessage() + '---'+e.getLineNumber());
        }
    }
    
	/* 
	*	Description     : This method is used to send email.
	*
	*	Return Type		: void
	*
	*	@argument		: List<String>
	*
	*	Revision Logs   : V_1.0 - Created
	*/
    public Static void sendEmailToOwner(Map<Id, Opportunity> mapOfOppOwner, Map<Id, List<SObject>> mapOfInsertedSobjectRecord, Map<Id, List<Sobject>> mapOfUpdateSobjectRecord, Map<Id, List<String>> mapOfUnsuccessullInsertData, Map<Id, List<String>> mapOfInvalidData){
        //List of single mail instance.
        List<Messaging.SingleEmailMessage> listOfSingleMail = new List<Messaging.SingleEmailMessage>();
        
        //Set to hold updated record id which are in insert list.
        Set<Id> setOfUpatedRecordOppId = new Set<Id>();
        //Loop over mapOfInsertedSobjectRecord.
        for(Id key : mapOfInsertedSobjectRecord.KeySet()){
            
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            String[] toAddress = new String[] {mapOfOppOwner.get(Key).Owner.Email};
            email.setSubject(mapOfOppOwner.get(Key).Name + ' Shipment Details');
            email.setToAddresses(toAddress);
           
            String mailBody = 'Here is the detail of automobile parts </br>';
            mailBody += 'Successfully Inserted Record </br>';
            mailBody += '<table border="1">'+
                		'<tr>'+
                			'<th> AutoMobile Type </th>'+
                			'<th> AutoMobile Name </th>'+
                			'<th> Comments </th>'+
                		'</tr>';
                        
            for(Sobject obj : mapOfInsertedSobjectRecord.get(Key)){
                Id automobileId = String.valueOf(obj.get('Id'));
                String autoMobileType = automobileId.getSObjectType().getDescribe().getlabel();
                
               mailBody += '<tr>'+
                				'<td>'+ autoMobileType +'</td>'+
                				'<td>'+ String.valueOf(obj.get('Name')) +'</td>'+
                				'<td> Sensor inserted successfully under '+ mapOfOppOwner.get(key).Account.Name +'</td>'+
                			'</tr>';
            }
            
            //loop over updated record.
            if(mapOfUpdateSobjectRecord.containsKey(key)){
                setOfUpatedRecordOppId.add(key);
                for(Sobject obj : mapOfUpdateSobjectRecord.get(key)){
                    Id automobileId = String.valueOf(obj.get('Id'));
                    String autoMobileType = automobileId.getSObjectType().getDescribe().getlabel();
                    
                    mailBody += '<tr>'+
                        '<td>'+ autoMobileType +'</td>'+
                        '<td>'+ String.valueOf(obj.get('Name')) +'</td>';
                    	if(mapOfOppOwner.get(Key).StageName.EqualsIgnoreCase('Return To HQ'))
                        	mailBody += '<td> Sensor update successfully from '+ mapOfOppOwner.get(key).Account.Name +' to '+mapOfOppOwner.get(key).Shipment_Account__r.Name+'</td>';
                        if(mapOfOppOwner.get(Key).StageName.EqualsIgnoreCase('Return To Customer'))
                            mailBody += '<td> Sensor update successfully from '+ mapOfOppOwner.get(key).Shipment_Account__r.Name+' to '+mapOfOppOwner.get(key).Account.Name+'</td>';
                        mailBody += '</tr>';
                }   
            }
            
            if(mapOfUnsuccessullInsertData.containsKey(key)){
                for(String str : mapOfUnsuccessullInsertData.get(key)){
                    List<String> splitData = str.split('##');
                    mailBody += '<tr>'+
                        '<td>'+ splitData[0] +'</td>'+
                        '<td>'+ splitData[1] +'</td>'+
                        '<td>'+splitData[2]+'</td>'+
                        '</tr>';
                }
            }
            
            if(mapOfInvalidData.containskey(key)){
                for(String str : mapOfInvalidData.get(key)){
                    mailBody += '<tr>'+
                        '<td> None </td>'+
                        '<td>'+ str +'</td>'+
                        '<td>'+'This autobile part is not matched any type.'+'</td>'+
                        '</tr>';
                }
            }
            
            mailBody += '</table>';
            email.setHtmlBody(mailBody);
            listOfSingleMail.add(email);
        }
        
        //loop over updated record.
        for(Id key : mapOfUpdateSobjectRecord.keySet()){
            if(!setOfUpatedRecordOppId.contains(key)){
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                String[] toAddress = new String[] {mapOfOppOwner.get(Key).Owner.Email};
                    email.setSubject(mapOfOppOwner.get(Key).Name + ' Shipment Details');
                email.setToAddresses(toAddress);
                String mailBody = 'Here is the detail of automobile parts </br>';
                mailBody += 'Successfully Updated Record </br>';
                mailBody += '<table border="1">'+
                    '<tr>'+
                    '<th> AutoMobile Type </th>'+
                    '<th> AutoMobile Name </th>'+
                    '<th> Comments </th>'+
                    '</tr>';
                
                for(Sobject obj : mapOfUpdateSobjectRecord.get(key)){
                    Id automobileId = String.valueOf(obj.get('Id'));
                    String autoMobileType = automobileId.getSObjectType().getDescribe().getlabel();
                    
                    mailBody += '<tr>'+
                        '<td>'+ autoMobileType +'</td>'+
                        '<td>'+ String.valueOf(obj.get('Name')) +'</td>';
                    
                    	if(mapOfOppOwner.get(Key).StageName.EqualsIgnoreCase('Return To HQ'))
                        	mailBody += '<td> Sensor update successfully from '+ mapOfOppOwner.get(key).Account.Name +' to '+mapOfOppOwner.get(key).Shipment_Account__r.Name+'</td>';
                        if(mapOfOppOwner.get(Key).StageName.EqualsIgnoreCase('Return To Customer'))
                            mailBody += '<td> Sensor update successfully from '+ mapOfOppOwner.get(key).Shipment_Account__r.Name +' to '+mapOfOppOwner.get(key).Account.Name+'</td>';
                       
                       mailBody += '</tr>';
                } 
                mailBody += '</table>';
                email.setHtmlBody(mailBody);
                listOfSingleMail.add(email);
            }
        }
        
        //Send Email
        Messaging.sendEmail(listOfSingleMail);
    }
    
    /* 
	*	Description     : This method is used fetch \n seprate string as list of stirng.
	*
	*	Return Type		: void
	*
	*	@argument		: List<String>
	*
	*	Revision Logs   : V_1.0 - Created
	*/
    public static List<String> getListOfSeprateString(String Str){
        
        //List used to return.
        List<String> listToReturn = new List<String>();
        
        //Loop ovet split string.
        for(String splitStr : Str.split('\n')){
            
            splitStr = splitStr.trim();
            
            //check lenth of string.
            if(splitStr.length() > 18){
                listToReturn.add(splitStr.substring(0, 18).trim());
            }
            else
                listToReturn.add(splitStr);
        }
        
        //return list.
        return listToReturn;
    }
    
    /* 
	*	Description     : This method is used fetch check that parameter is autoMobileSensor type or not.
	*
	*	Return Type		: Boolean
	*
	*	@argument		: String
	*
	*	Revision Logs   : V_1.0 - Created
	*/
    public static Boolean isAutoMobileSensor(String str){
        
        String autoMobileSensor = '00:11:CE:00';
        
        if(str.startsWithIgnoreCase(autoMobileSensor))
            return true;
        else
            return false;
    }
    
    /* 
	*	Description     : This method is used fetch check that parameter is AutoMobilePresenceSensor type or not.
	*
	*	Return Type		: Boolean
	*
	*	@argument		: String
	*
	*	Revision Logs   : V_1.0 - Created
	*/
    public static Boolean isAutoMobilePresenceSensor(String str){
        
        String autoMobilePresenceSensor = '00:11:CE:D';
        
        if(str.startsWithIgnoreCase(autoMobilePresenceSensor))
            return true;
        else
            return false;
    }
    
    /* 
	*	Description     : This method is used fetch check that parameter is isAutoMobileTBU type or not.
	*
	*	Return Type		: Boolean
	*
	*	@argument		: String
	*
	*	Revision Logs   : V_1.0 - Created
	*/
    public static Boolean isAutoMobileTDU(String str){
        
        String autoMobileTBU = '00:11:CE:E';
        
        if(str.startsWithIgnoreCase(autoMobileTBU))
            return true;
        else
            return false;
    }
    
    /* 
	*	Description     : This method is used fetch check that parameter is isAutoMobileTAG type or not.
	*
	*	Return Type		: Boolean
	*
	*	@argument		: String
	*
	*	Revision Logs   : V_1.0 - Created
	*/
    public static Boolean isAutoMobileTag(String str){
        
        String autoMobileTAG = 'XXX-XXX-XXX-XXX';
        Boolean returnValue = false;
        
        if(str.containsIgnoreCase('-')){
            List<String> splitString = str.split('-');
            
            if(splitString.size() >= 4 && splitString[0].length() == 3 && splitString[0].isNumeric() && splitString[1].length() == 3 && splitString[2].length() == 3 && splitString[3].length() >=3)
                returnValue = true;
        }        
        return returnValue;
    }
}