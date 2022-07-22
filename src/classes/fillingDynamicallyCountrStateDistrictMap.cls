/**
* Description   - Creating the map of Country  
* Created by    - Sudheer Kumar Shakya
* Created Date  - 15/07/2022
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date - 15/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 15/07/2022
**/
public with sharing class fillingDynamicallyCountrStateDistrictMap {

    //Declaring Global Map
    static Map<String,Map<String,List<String>>> mapofCountryStatesandDistricts=new Map<String,Map<String,List<String>>>();

    /**   Description :   Constructor 
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   String
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 15/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 15/07/2022
    **/
    public fillingDynamicallyCountrStateDistrictMap(String firstLetter,String enteredNameofCountry){
        
        //filling map dynamically
        List<District__c> districtList = [Select Name, State_Name__r.Name, State_Name__r.Country_Name__r.Name From District__c];   
        List<String> combinationOfCountryStateAndDistrict = new list<String>();
        
        //Check for Validate Conditions
        If(!districtList.isEmpty()) {
            for(District__c district : districtList) {
                If(!mapofCountryStatesandDistricts.containsKey(district.State_Name__r.Country_Name__r.Name)) {
                    mapofCountryStatesandDistricts.put(district.State_Name__r.Country_Name__r.Name, new Map<String, List<String>>());
                }
                If(!mapofCountryStatesandDistricts.get(district.State_Name__r.Country_Name__r.Name).containsKey(district.State_Name__r.Name)) {
                    mapofCountryStatesandDistricts.get(district.State_Name__r.Country_Name__r.Name).put(district.State_Name__r.Name, new List<String>());
                }
                If(!mapofCountryStatesandDistricts.get(district.State_Name__r.Country_Name__r.Name).get(district.State_Name__r.Name)
                .contains(district.Name)) {
                    mapofCountryStatesandDistricts.get(district.State_Name__r.Country_Name__r.Name).get(district.State_Name__r.Name).add(district.Name);
                    If(district.State_Name__r.Country_Name__r.Name.startsWith(firstLetter) && district.State_Name__r.Name.startsWith(firstLetter) &&
                        district.Name.startsWith(firstLetter)) {                       
                        combinationOfCountryStateAndDistrict.add(district.State_Name__r.Country_Name__r.Name + ' -> ' + district.State_Name__r.Name + 
                        ' -> ' + district.Name);
                    }       
                }
            }
        }
        System.debug('Map of District State and Country is:'+mapofCountryStatesandDistricts);
        System.debug('Country map showing after filling dynamically:');
        System.debug('Combination Key Set Of Country State and District is: '+combinationOfCountryStateAndDistrict);
        aggregateCountDistrictandState();
        countryJSONdata(enteredNameofCountry);
    }    

    /**   Description :   Method To update records
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   Void
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 15/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 15/07/2022
    **/
    public static void aggregateCountDistrictandState(){
        //Findng total Number of states using aggregate
        Map<Id,State__c> mapofDistrictsinState=new Map<Id,State__c>();
        AggregateResult[] districtAggregateResultForState = [Select Count(Id)totalDistricts, State_Name__c From District__c
         GROUP BY State_Name__c];
        if(!districtAggregateResultForState.isEmpty()){                                                     
            for(AggregateResult ar : districtAggregateResultForState) {
                mapofDistrictsinState.put((Id)ar.get('State_Name__c'), new State__c(Id = (Id)ar.get('State_Name__c'),
                Total_Number_of_Districts__c =(Integer)ar.get('totalDistricts')));
            }
        }
        //Finding total number of Districts 
        Map<Id,Country__c> mapofStatesinCountry=new Map<Id,Country__c>();
        AggregateResult[] stateAggregateForCountry = [Select Count(Id)totalStates,SUM(Total_Number_of_Districts__c)totalDistrict,Country_Name__c 
        FROM State__c GROUP BY Country_Name__c];
        if(!stateAggregateForCountry.isEmpty()){
            for(AggregateResult aggresult : stateAggregateForCountry) {
                mapofStatesinCountry.put((Id)aggresult.get('Country_Name__c'),new Country__c(Id=(Id)aggresult.get('Country_Name__c'),
                Total_Number_of_States__c=(Integer)aggresult.get('toatalStates'),
                Total_Number_of_Districts__c=(Integer)aggresult.get('totalDistrict')));
            }  
        }     
        //updating records
        if(!mapofDistrictsinState.isEmpty()){
            update mapofDistrictsinState.values();
        }
        
        if(!mapofStatesinCountry.isEmpty()){
            update mapofStatesinCountry.values();
        }
    }

    /**   Description :   In this method we will create json for country
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   Void
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 15/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 15/07/2022
    **/
    public static void countryJSONdata(String enteredNameofCountry){
        List<State__c> stateList = [SELECT Id,Name,Total_Number_of_Districts__c,Country_Name__r.Name,Country_Name__r.Country_Code__c,
        Country_Name__r.Total_Number_of_States__c,Country_Name__r.Total_Number_of_Districts__c FROM State__c 
        WHERE Country_Name__r.Name Like: enteredNameofCountry];   
        if(!stateList.isEmpty()){
            Country wrapCountry=new Country();
            wrapCountry.nameOfCountry= stateList[0].Country_Name__r.Name;
            wrapCountry.Country_Code=stateList[0].Country_Name__r.Country_Code__c;
            wrapCountry.Total_Number_of_States=stateList[0].Country_Name__r.Total_Number_of_States__c;
            wrapCountry.Total_Number_of_Districts=stateList[0].Country_Name__r.Total_Number_of_Districts__c;
            wrapCountry.State=new List<States>();
            for(State__c state : stateList){
                States wrapStates=new States();
                wrapStates.nameOfState=state.Name;
                wrapStates.Total_Number_of_Districts=stateList[0].Total_Number_of_Districts__c;
                wrapStates.districts=new List<Districts>();
                if(mapofCountryStatesandDistricts.containsKey(enteredNameofCountry)
                && mapofCountryStatesandDistricts.get(enteredNameofCountry)
                .containsKey(state.Name)){
                    for(String district:mapofCountryStatesandDistricts.get(enteredNameofCountry).get(state.Name)){
                        Districts wrapDistricts=new Districts();
                        wrapDistricts.nameOfDistrict=district;

                        wrapStates.districts.add(wrapDistricts);
                    }
                }
                wrapCountry.State.add(wrapStates);
            }   
            String countryjsonData=JSON.serialize(wrapCountry);
            System.debug(countryjsonData);
            
            //updating country json data
            Country__c  country = new Country__c();
            country.Id =  stateList[0].Country_Name__r.Id;
            country.Country_JSON_Data__c = countryjsonData;
            update country;

            //Created logic for clickable URL
            String recordLink = URL.getSalesforceBaseUrl().getHost()+'/'+country.Id;
            System.debug(recordLink);
            
        }
    }
    //Wrapper Classes
    public class Countryjson{
    public List<Country> Country{get;set;}
    }
    public class Country{
        public String nameOfCountry{get;set;}
        public Decimal Country_Code{get;set;}
        public Decimal Total_Number_of_States{get;set;}
        public Decimal Total_Number_of_Districts{get;set;}
        public List<States> State{get;set;}
    }

    public class States{
        public List<Districts> districts{get;set;}
        public String nameOfState{get;set;}
        public Decimal Total_Number_of_Districts{get;set;}
    }
     
    public class Districts{
        public String nameOfDistrict{get;set;}
    }
}