/**
* Description   - Member Casting(Parent) of Outer Class 
* Created by    - Sudheer Kumar Shakya
* Created Date  - 09/07/2022
* Revision log  -  V_1.0 -  Created  - Sudheer Kumar Shakya - Date - 09/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
**/
public virtual class MemberCasting {
    String name;
    String state;
    long phone;

    /**
    * Description   - Creating a method
    * Created by    - Sudheer Kumar Shakya
    * Created Date  - 09/07/2022
    * Revision log  -  V_1.0 -  Created  - Sudheer Kumar Shakya - Date - 09/07/2022
    *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
    **/
    void show(){ 
        // Printing the message 
        System.debug(name + ' : How do you do');
    }

    /**
    * Description   - creating child of Ineer Class extends Parent class
    * Created by    - Sudheer Kumar Shakya
    * Created Date  - 09/07/2022
    * Revision log  -  V_1.0 -  Created  - Sudheer Kumar Shakya - Date - 09/07/2022
    *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
    **/
    public class User extends MemberCasting {

        /**   Description :   Method 
        * Created by    - Sudheer Kumar Shakya
        * Created Date  - 09/07/2022
        * Revision log  -  V_1.0 -  Created  - Sudheer Kumar Shakya - Date - 09/07/2022
        *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
        **/
        public void addUser(){
            // Print message of MemeberCasting/ Parent class
            System.debug(name + ' :Hi I am great');
        }
    }

    /**
    * Description   - Creating a Main class  of Ineer Class
    * Created by    - Sudheer Kumar Shakya
    * Created Date  - 09/07/2022
    * Revision log  -  V_1.0 -  Created  - Sudheer Kumar Shakya - Date - 09/07/2022
    *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
    **/
    public class Main {

        /**   Description :   Constructor 
        * Created by    - Sudheer Kumar Shakya
        * Created Date  - 09/07/2022
        * Revision log  -  V_1.0 -  Created  - Sudheer Kumar Shakya - Date - 09/07/2022
        *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
        **/
        public  Main(){

            // Creating an object MemeberCasting
            MemberCasting mc = new User();
            mc.name = 'Sudheer';
            mc.state='Uttar Pradesh';
            mc.phone = 9876543210l;
            // Calling function
            mc.show();

            User u = (User)mc;

            // Downcast to access specific property of subclass
            u.addUser();
        }
    }
}