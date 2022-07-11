/**
* Description   - Performing the concept of Super Keyword
* Created by    - Sudheer Kumar Shakya
* Created Date  - 08/07/2022
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date - 08/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 08/07/2022
**/
public virtual class SuperKeyword {
    public String IUCNstatus;
    public String Animalfirst;
    public String Animalsecond;
    public String Animalthird;

    /**   Description :   Ctreating a Constructor of super class
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 08/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 08/07/2022
    **/
    public SuperKeyword() {

        IUCNstatus = 'Critically Endangered';
        Animalfirst = 'African forest elephant';
        Animalsecond = 'Amur Leopard';
        Animalthird = 'Black Rhino';
    }

    /**   Description :   Ctreating a parameterized Constructor of super class
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 08/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 08/07/2022
    **/
    public SuperKeyword(String CriticalstatusofAnimals, String newAnimalfirst, String newAnimalsecond,String newAnimalthird) {

        IUCNstatus = CriticalstatusofAnimals;
        Animalfirst = newAnimalfirst;
        Animalsecond = newAnimalsecond;
        Animalthird = newAnimalthird;
    }

    /**   Description :   Ctreating a method
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 08/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 08/07/2022
    **/
    public virtual void showIUCNstatus() {

        System.debug('Criticalstatus of African forest elephant is : ' + IUCNstatus);
        System.debug('Criticalstatus of Amur Leopard is: ' + IUCNstatus);
        System.debug('Criticalstatus of Black Rhino is: ' + IUCNstatus);
        
    }

    /**   Description :   Ctreating another method
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 08/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 08/07/2022
    **/
    public virtual String getIUCNstatus() {
        return IUCNstatus;
    }

    /**
    * Description   - creating a child class
    * Created by    - Sudheer Kumar Shakya
    * Created Date  - 08/07/2022
    * Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date - 08/07/2022
    *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 08/07/2022
    **/
    public class Child extends SuperKeyword {
               
        /**   Description :   Ctreating a method
        *     Created By  :   Sudheer Kumar Shakya
        *     Arguments   :   None
        *     Return      :   None
        *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 08/07/2022
        *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 08/07/2022
        **/
        public override void showIUCNstatus() {
            super.getIUCNstatus();
            System.debug('But you can call me ' + super.getIUCNstatus());
        }
        
        /**   Description :   Ctreating a Constructor
        *     Created By  :   Sudheer Kumar Shakya
        *     Arguments   :   None
        *     Return      :   None
        *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 08/07/2022
        *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 08/07/2022
        **/
        public Child(){
            super('frican forest elephant','Amur Leopard','Black Rhino','Critically Endangered');
        }
    }
}