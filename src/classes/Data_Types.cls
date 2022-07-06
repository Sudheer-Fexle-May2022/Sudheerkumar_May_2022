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

    } 

    /**   Description :   Implementation Other different different data Types
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
    public static void otherDatatypes(){
       
        //implementing integer data type
        Integer rollNumber = 81;
        system.debug(' roll number is: '+rollNumber);
        Integer marksPercentage=84;
        system.debug('percentage of marks  is: '+marksPercentage);

        //Boolean example
        Boolean qualifiedGraduation;
        qualifiedGraduation = true;
        system.debug('Value of shipmentDispatched '+qualifiedGraduation);

        //Using Date Data type to fetch date
        Date graduationDate = date.today();
        System.debug('graduationDate '+graduationDate);
        
        //Example of string data type
        String studentName = 'Sudjheer Kumar Shakya';
        System.debug('Name of student is: '+studentName);
        String collegeName = 'GEC Ajmer';
        System.debug('Name of college is: '+collegeName);

        //Declaring an sObject variable of type Account
        Account obj = new Account();

        //Assignment of values to fields of sObjects
        obj.Name = 'XYZ Customer';
        obj.Description = 'Test Account';
        System.debug('obj variable value'+obj); 
        
    }
}