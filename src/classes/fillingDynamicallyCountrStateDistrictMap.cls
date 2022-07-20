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
    public fillingDynamicallyCountrStateDistrictMap(String firstLetter){
        
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
                If(!mapofCountryStatesandDistricts.get(district.State_Name__r.Country_Name__r.Name).get(district.State_Name__r.Name).contains(district.Name)) {
                    mapofCountryStatesandDistricts.get(district.State_Name__r.Country_Name__r.Name).get(district.State_Name__r.Name).add(district.Name);
                  
                    If(district.State_Name__r.Country_Name__r.Name.startsWith(firstLetter) && district.State_Name__r.Name.startsWith(firstLetter) &&
                        district.Name.startsWith(firstLetter))                        
                        combinationOfCountryStateAndDistrict.add(district.State_Name__r.Country_Name__r.Name + ' -> ' + district.State_Name__r.Name + ' -> ' + district.Name);
                }
            }
        }

        System.debug('Map of District State and Country is:'+mapofCountryStatesandDistricts);
        System.debug('Combination Key Set Of Country State and District is: '+combinationOfCountryStateAndDistrict);
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
        Map<Id,Country__c> mapofDistrictsinCountry=new Map<Id,Country__c>();
        AggregateResult[] districtAggregateForState = [Select Count(Name) Total_Number_of_States,SUM(Total_Number_of_Districts__c) ,Country_Name__c From State__c
                                                      GROUP BY Country_Name__c];
        for(AggregateResult aggresult : districtAggregateForState) {
            Country__c country = new Country__c();
            Country.Id = (Id)aggresult.get('Country_Name__c');
            Country.Total_Number_of_States__c = (Integer)aggresult.get('Total_Number_of_States');
            mapofDistrictsinCountry.put(country.Id,country);
        }

        //Finding total number of Districts 
        Map<Id,State__c> mapofStatesinCountry=new Map<Id,State__c>();
        AggregateResult[] stateAggregateForCountry = [Select Count(Name) Total_Number_of_Districts,State_Name__c From District__c
                                                     GROUP BY State_Name__c];
        for(AggregateResult aggresult : stateAggregateForCountry) {
            State__c state = new State__c();
            state.Id = (Id)aggresult.get('State_Name__c');
            state.Total_Number_of_Districts__c = (Integer)aggresult.get('Total_Number_of_Districts');
            mapofStatesinCountry.put(state.Id,state);
        }
        
        //updating records
        update mapofDistrictsinCountry.values();
        update mapofStatesinCountry.values();
    }

    public static void countryJSONdata(String enteredNameofCountry){

        Country wrapCountry=new Country();
      //  wrapCountry.nameOfCountry=enteredNameofCountry;
       // List<Country__c> listCode=[SELECT Country_Code__c FROM Country__c WHERE Name Like : enteredNameofCountry];
       // wrapCountry.Country_Code=(Decimal)listCode[0].get('Country_Code__c');
      
        wrapCountry.State=new List<States>();
        wrapCountry.nameOfCountry=enteredNameofCountry;
        List<Country__c> listCode=[SELECT Country_Code__c FROM Country__c WHERE Name Like : enteredNameofCountry];
        wrapCountry.Country_Code=(Decimal)listCode[0].get('Country_Code__c');
        List<AggregateResult> listAggState = [SELECT COUNT(Name)Total_Number_of_States FROM State__c
                                               WHERE Country_Name__r.Name Like : enteredNameofCountry
                                               GROUP BY Country_Name__r.Name];
        wrapCountry.Total_Number_of_States=(Integer)listAggState[0].get('Total_Number_of_States');

        List<AggregateResult> listAggDistrict=[SELECT COUNT(Name)Total_Number_of_Districts FROM District__c 
                                               WHERE State_Name__r.Country_Name__r.Name Like : enteredNameofCountry 
                                               GROUP BY State_Name__r.Country_Name__r.Name];
        wrapCountry.Total_Number_of_Districts=(Integer)listAggDistrict[0].get('Total_Number_of_Districts');

        for(String enteredState:mapofCountryStatesandDistricts.get(enteredNameofCountry).keyset()){
            if(enteredState=='Uttar Pradesh'){
                States wrapStates=new States();
                wrapStates.nameOfState=enteredState;

                List<AggregateResult> listAggDistricts=[SELECT COUNT(Name)Total_Number_of_Districts FROM District__c 
                                               WHERE State_Name__r.Name Like : enteredState 
                                               GROUP BY State_Name__r.Name];
                wrapStates.Total_Number_of_Districts=(Integer)listAggDistricts[0].get('Total_Number_of_Districts');
                  
                wrapStates.districts=new List<Districts>();
                for(String district:mapofCountryStatesandDistricts.get(enteredNameofCountry).get(enteredState)){
                    Districts wrapDistricts=new Districts();
                    wrapDistricts.nameOfDistrict=district;

                    wrapStates.districts.add(wrapDistricts);
                }

                wrapCountry.State.add(wrapStates);
            }
            
        }

        String countryjsonData=JSON.serialize(wrapCountry);
        System.debug(countryjsonData);
    }

    public List<Country> Country{get;set;}
    public class Country{
        public String nameOfCountry{get;set;}
        public Decimal Country_Code{get;set;}
        public Integer Total_Number_of_States{get;set;}
        public Integer Total_Number_of_Districts{get;set;}
        public List<States> State{get;set;}
    }

    public class States{
        public List<Districts> districts{get;set;}
        public String nameOfState{get;set;}
        public Integer Total_Number_of_Districts{get;set;}
    }
     
    public class Districts{
        public String nameOfDistrict{get;set;}
    }

}