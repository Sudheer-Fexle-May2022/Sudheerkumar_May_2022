/**
* Description   - Implementing list with an example

* Created by    - Sudheer Kumar Shakya
*
* Created Date  - 02/07/2022
*
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date-02/07/2022
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class Data_Types {

    /**   Description :   Example of List
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   None 
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date-02/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya- Date -02/07/2022
    * 
    **/
    public static void listofStates(){
       
        // Initializing the List
        List<String> stateslist = new List<String>();

        // This statement would give null as output in Debug logs
        system.debug('initially List : ' +stateslist);

        // Now adding the states to the list using add method()
        stateslist.add('Uttar Pardesh');
        stateslist.add('Rajasthan');
        stateslist.add('Uttara Khand');
        stateslist.add('Haryana');
        stateslist.add('Andhra Pradesh');
        stateslist.add('Arunanchal Pradesh');

        // This statement is used to return the list of added states as output in Debug logs
        system.debug('List after adding states  : ' +stateslist);

        // Now getting the state at zeroth index
        String statehavingFirstPosition = stateslist.get(0);

        // This statement would return Uttar Pardesh as output in Debug log
        system.debug('Vaule of state having First Position : ' +statehavingFirstPosition);

        // setting the element at 1 position
        stateslist.set(0,'Arunanchal Pradesh');

        //setting first element at last position
        stateslist.set(5,'Uttar Pradesh');

        // This statement would give output in Debug log
        system.debug('List after setting the state at first position: ' +stateslist);

        // Using clear() method to remove all the states from the list
        stateslist.clear();

        // This statement would give output in Debug log
        system.debug('Value of List'+ stateslist);
    }

    /**   Description :   Implementation of Map Data 
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   None 
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date-02/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya- Date -02/07/2022
    * 
    **/
    public static void mapImplementation(){
        // Initializing the Map
        Map<string, string> atomnotoatomname = new Map<string, string>
        {'1'=>'H', '2'=>'He','3'=>'Li','4'=>'Be'};

        // This statement would give as output as key value pair in Debug log
        System.debug('initially map looks like '+atomnotoatomname);

        // Defining another new map
        Map<string, string> m = new Map<string, string>();

        // Inserting a new key-value pair 
        m.put('5', 'B');
        m.put('6', 'C');

        //Now assert that the map contains a specified key and respective value
        System.assert(m.containsKey('5'));
        System.debug('If output is true then Map contains the key and output is:'
        + m.containsKey('5'));

        // Using get() function to retrieve a value 
        String value = m.get('5');
        System.debug('Value at the Specified key using get function: '+value);

        // Return a set that contains all of the keys in the map
        Set<String> setOfKeys = m.keySet();
        System.debug('Value of Set with Keys '+setOfKeys);
    }
    
    /**   Description :   Implementation of Set Data type 
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   None 
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date-02/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya- Date -02/07/2022
    * 
    **/
    public static void setOfBranches() {
        Set<String> branchset = new Set<String>{'CSE', 'EIC', 'ECE','ME'};
        system.debug('Initially set looks like : ' +branchset);

        // Adding an element in the set by using add()
        branchset.add('CE');
        system.debug('Set after adding new value : ' +branchset);

        // Using remove() to remove an element from the set
        branchset.remove('EIC');
        system.debug('Set after  removing the value : ' +branchset);

        //Now Check whether the set contains a particular element or not
        branchset.contains('CSE');
        system.debug('Value of Set with all values : ' +branchset);

        // Initializing  the Set of integers
        Set<Integer> setofintvalues = new Set<Integer>();
        setofintvalues.add(25);
        setofintvalues.add(36);

        // Creating a list based on the set
        List<Integer> listofintegers = new List<Integer>(setofintvalues);

        // integerlist elements are copied from setofintvalues
        System.debug(listofintegers);

        // Initializing the Set of integers
        Set<integer> newset = new Set<integer>{4, 9, 16,49,64};

        List<integer> newlist = new List<integer>{9, 49,16};

        Boolean result =newset.retainAll(newlist);
        System.assertEquals(true, result);

        system.debug(result);

        // Initializing  the Set of decimals
        Set<Decimal> d1 = new Set<Decimal>();

        //daiing the values using add()
        d1.add(29.09);
        d1.add(12.89);
        d1.add(99.00);

        Set<Decimal> d2 = new Set<Decimal>(d1); 

        system.debug(d2);

        Set<Decimal> d3 = new Set<Decimal>{23.09,24.00};

        Boolean result2 = d2.retainAll(d3);
        System.assertEquals(true, result);

        system.debug(result2);

        //Define the Set of Integer
        Set<Integer> mynumber = new Set<Integer>{10,12};
        Set<Integer> snumber = new Set<Integer>{13};
        Set<Integer> rnumber = new Set<Integer>{11, 12, 13};

        Boolean result3, result4;

        result3 = mynumber.addAll(snumber);
        system.assertEquals(true, result3);
        system.debug(result3);
         
        //implementing date Data type
        Date someDate = Date.newInstance(2022, 07, 02);
        List<Date> dates = new List<Date>();
        dates.add(someDate);
        system.debug(dates); 
        
        //implementing Datetime
        Datetime dt1 = DateTime.newInstance(2022,07,02,16,55,30);
        List<Datetime> dt=new List<Datetime>();
        dt.add(dt1);
        system.debug(dt);
        
        //implementing sObject 
        Account account = [select Id, AnnualRevenue, Website from Account limit 1];
        Map<String, Schema.SObjectField> schemaFieldMap = Schema.SObjectType.Account.fields.getMap();
        Map<String, Object> queriedFieldValues = new Map<String, Object>();
        for (String fieldName: schemaFieldMap.keySet()) {
            try { 
                queriedFieldValues.put(fieldName, account.get(fieldName)); 
            } catch (SObjectException e)    { 
                // Intentional capture 
            }
        }
        System.debug(queriedFieldValues);

        //String data type
        List < String > Dept = new List < String > { 'CSE', 'EEE','ECE' };  
        system.debug('Default Department List : ' + Dept);

        //add(ListElement)  
        Dept.add('MECH');  
        Dept.add('IT');  
        system.debug('Using add(ListElement) - Department List : ' + Dept);  

        //add(index, ListElement)  
        Dept.add(0, 'Civil');  
        Dept.add(5, 'Bio Technology');  
        system.debug('Using add(index, ListElement)-Department List : ' + Dept); 

        //addAll(fromList)  
        List < String > Depttest = new List < string > ();  
        Depttest.addAll(Dept);  
        system.debug('Using addAll(fromList) - Department List : ' + Depttest); 

        //size()  
        Integer s = Dept.size();  
        system.debug('Using size() - Department Size : ' + s); 

        //get(index)  
        string str = Dept.get(3);  
        system.debug('Using get(index) - Department Index 3 is: ' + str); 

        //isEmpty()  
        Boolean b = Dept.isEmpty();  
        system.debug('Using isEmpty() - Department Empty : ' + b);  

        //clone()  
        List < String > Depttest2 = new List < string > ();  
        Depttest2 = Dept.clone();  
        system.debug('Using clone() - Department List 2 : ' + Depttest2);  

        //Clear()  
        Depttest2.clear();  
        system.debug('Using clear() - Department List 2 : ' + Depttest2); 

        //Example of Integer data type
        List<Integer> numbers = new List<Integer>{1,2,3,4,5};
        System.debug(numbers);

        //adding numbers using add()
        numbers.add(1);
        numbers.add(2);
        numbers.add(3);
        numbers.add(4);
        numbers.add(5);
        System.debug(numbers);

        //removing elements using remove()
        System.debug('Removing element "10" from index 3');
        numbers.remove(3);
        System.debug('Updated List = ' + numbers);

        //Clearing elements using clear()
        System.debug('Clearing list...');
        numbers.clear();
        System.debug('Updated list = ' + numbers);
    }    
}