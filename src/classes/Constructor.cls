/**
* Description   - This class is being created to implement the constructor
*
* Created by    - Sudheer Kumar Shakya
*
* Created Date  - 04/07/2022
*
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date-04/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date-04/07/2022
*
**/
public class Constructor{
    string Employeename;
    String EmployeeState;
    Integer EmployeeNo;
    
    /**   Description :   Creating a Constructor
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date-04/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya- Date -04/07/2022
    * 
    **/
    Public Constructor() {
        EmployeeName = 'Sudheer';
        EmployeeState='Uttar Pradesh';
        EmployeeNo = 1015;
    }

    /**   Description :   Creating method to print 
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date-04/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya- Date -04/07/2022
    * 
    **/
    public void Show() {
        System.debug('The name of employee is: ' +EmployeeName);
        System.debug('The Employee number is: ' +EmployeeNo);
        system.debug('the state of employee is: '+EmployeeState);
    }
}