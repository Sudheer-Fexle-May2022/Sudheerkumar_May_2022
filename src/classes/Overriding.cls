/**   Description :   Purpose to create this class is to perform overriding
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
public virtual class Overriding {

    /**   Description :   creating a method
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
    public virtual void write() {
        System.debug('Lets start overriding: ');
    }

    /**   Description :   creating a method
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date-04/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya- Date -04/07/2022
    **/ 
    public virtual Double discount() {
        return .05;
    }
}