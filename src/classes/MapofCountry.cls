/**
* Description   - Creating the map of Country  
* Created by    - Sudheer Kumar Shakya
* Created Date  - 09/07/2022
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date - 09/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
**/
public with sharing class MapofCountry {

    //Creating a Nested Map 
    Static Map<String,Map<String, Map<String, List<String>>>> countriesMap = new Map<String,Map<String, Map<String, List<String>>>>();
    
    //Nested Map for getting sattes and district name
    Static Map<String, Map<String, List<String>>> countryMap= new Map<String, Map<String, List<String>>>();

    /**   Description :   Now using two Methods using 2 Nested Map to print all countries 
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   String
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 09/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
    **/
    public static void mapofCountries(String CodeofCountry){
    
        //we use nested dummy map to put all the countries into the countrywith code map
        Map<String, Map<String, List<String>>> countrydummyMap = new Map<String, Map<String, List<String>>>();

        countriesMap.put('+91',new Map<String, Map<String, List<String>>>());
        countriesMap.put('+977',new Map<String, Map<String, List<String>>>());
        countriesMap.put('+66',new Map<String, Map<String, List<String>>>());

        // For India
        countrydummyMap.put('India', new  Map<String, List<String>>());
        
        //States of india
        Map<String, List<String>> statesMaps1 = new Map<String, List<String>>();
        statesMaps1.put('Uttar Pradesh',new List<String>());
        statesMaps1.put('Rajasthan',new List<String>());
        statesMaps1.put('Arunanchal Pradesh',new List<String>());
        statesMaps1.put('Haryana',new List<String>());
        statesMaps1.put('Chhattis Garh',new List<String>());

        //District List of States
        List<String> upDistrictsList = new List<String>{'Bareily','Mathura','Kanpur','PrayaagRaaj','Ayodhya'};

        List<String> rjDistrictsList = new List<String>{'Ajmer','Alwar','Jodhpur','Jaipur','Udaypur','Bharatpur','Chittaur'};

        List<String> apDistrictsList = new List<String>{'Hyderabad','Vijaywada','Amrawati','Vishakhapattanam'};

        List<String> hrDistrictsList = new List<String>{'Gurugram','Rohtak','Karnal','Sonipat','Hisar'};

        List<String> cgDistrictsList = new List<String>{'Vishalpur','Rajpur','Bhilai','Rajgarh','Durg','Ambikapur'};

        statesMaps1.get('Uttar Pradesh').addAll(upDistrictsList);
        statesMaps1.get('Rajasthan').addAll(rjDistrictsList);
        statesMaps1.get('Arunanchal Pradesh').addAll(apDistrictsList);
        statesMaps1.get('Haryana').addAll(hrDistrictsList);
        statesMaps1.get('Chhattis Garh').addAll(cgDistrictsList);
        countrydummyMap.get('India').putAll(statesMaps1);

        countryMap.putAll(countrydummyMap);
        countriesMap.get('+91').putAll(countryMap);
        countrydummyMap.clear();

        //Nepal Country
        countrydummyMap.put('Nepal',new  Map<String, List<String>>());

        //States map of Nepal
        Map<String, List<String>> statesMap2 = new Map<String, List<String>>();
        statesMap2.put('Karnali',new List<String>());
        statesMap2.put('Bagmati',new List<String>());
        statesMap2.put('Gandaki',new List<String>());
        statesMap2.put('Lumbini',new List<String>());

        //List of Districts of states
        List<String> karnaliDistrictsList = new List<String>{'Dailekh','Dolpa','Humla','Jajarkot','Jumla'};

        List<String> bagmatiDistrictsList = new List<String>{'Bhaktapur','Chitwan ','Dhading ','Dolakha','Kathmandu'};

        List<String> gandakiDistrictsList = new List<String>{'Baglung','Gorkha ','Kaski ','Lamjung ','Manang '};

        List<String> lumbiniDistrictsList = new List<String>{'Arghakhanchi ','Baglung ','Banke ','Bardiya ','Dang Deukhuri'};

        statesMap2.get('karnali').addAll(karnaliDistrictsList);
        statesMap2.get('bagmati').addAll(bagmatiDistrictsList);
        statesMap2.get('gandaki').addAll(gandakiDistrictsList);
        statesMap2.get('lumbini').addAll(lumbiniDistrictsList);
        countrydummyMap.get('Nepal').putAll(statesMap2);

        countryMap.putAll(countrydummyMap);
        countriesMap.get('+977').putAll(countrydummyMap);
        countrydummyMap.clear();

        //Thailand 
        countrydummyMap.put('Thailand',new  Map<String, List<String>>());

        Map<String, List<String>> stateMap3 = new Map<String, List<String>>();
        stateMap3.put('Ang Thong',new List<String>());
        stateMap3.put('Bangkok',new List<String>());
        stateMap3.put('ChaiNat',new List<String>());
        stateMap3.put('Chaiyaphum',new List<String>());

        List<String> angthongDistrictList = new List<String>{'Chaiyo','Pamok','Pho Thong','Sawaeng Ha','Samko'};

        List<String> bangkokDistrictList = new List<String>{'Bang Bon','Bang kapi','Bang khan','Bang Khae'};

        List<String> chainatDistrictList = new List<String>{'Hankha',' Manoram','Mueang Chai','Noen Kham','Nong Mamong'};

        List<String> chaiyaphumDistrictList = new List<String>{'Bamnet Narong','Ban Khwao','Kaeng Khro','Ban Thaen'};

        stateMap3.get('Ang Thong').addAll(angthongDistrictList);
        stateMap3.get('Bangkok').addAll(bangkokDistrictList);
        stateMap3.get('ChaiNat').addAll(chainatDistrictList);
        stateMap3.get('Chaiyaphum').addAll(chaiyaphumDistrictList);
        countrydummyMap.get('Thailand').putAll(stateMap3);

        countryMap.putAll(countrydummyMap);
        countriesMap.get('+66').putAll(countrydummyMap);
        countrydummyMap.clear();         

        System.debug(countriesMap.get(CodeofCountry));
    }

    /**   Description :   Here we ae using a method to get the Country with given letter and District greator from given Integer
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   String,Integer
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya- Date-10- 07-2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 10-07-2022
    **/
    public static void getCombiletterSize(String combiLetter,Integer distSize){

        Map<String,List<String>> mapOfState = new  Map<String,List<String>>();
        List<String> listOfDistrict = new List<String>();

        String startLetter = '';
        for(String nameofCountry : countryMap.keySet()){
            if(nameofCountry.startsWith(combiLetter)){
                for(String nameofState : countryMap.get(nameofCountry).keySet()){
                    if(nameofState.startswith(combiLetter)){
                        for(String districtName : countryMap.get(nameofCountry).get(nameofState) ){
                            if(districtName.startsWith(combiLetter)){
                                System.debug('CombiCountry: '+nameofCountry+', State : '+nameofState+ ', District : '+districtName);
                            }
                        }
                    }
                }    
            }
        }

        System.debug('District greater than given integer is: '); 

        for(String nameofCountry : countryMap.keySet()){
        	mapOfState = countryMap.get(nameofCountry);
            for(String nameofState : mapOfState.keySet()){
            	listOfDistrict.addAll(mapOfState.get(nameofState));
               	for(String districtName : listOfDistrict ){
                	if( districtName.length() >= distSize){
                        System.debug('District Name is: '+districtName);
                    }
                }
            }
        }
    }
}