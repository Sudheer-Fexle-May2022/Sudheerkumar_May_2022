/**
* Description   - This class is being created to implement utility class concept
*
* Created by    - Sudheer Kumar Shakya
*
* Created Date  - 05/07/2022
*
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date-05/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date-05/07/2022
*
**/
public class ConstantClassExample {
    static final Double regularCustomerDiscount = 0.1;
    static Double finalPrice = 0;
    
    /**   Description :   Creating a method
    *
    *     Created By  :   Sudheer Kumar Shakya
    *
    *     Arguments   :   Integer  
    *     Return      :   Double
    *
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date-05/07/2022    
    *                      V_1.1 - Modified - Sudheer Kumar Shakya- Date -05/07/2022
    * 
    **/ 
    public static Double provideDiscount (Integer price) {
       
        //calculate the discount
        finalPrice = price - price * regularCustomerDiscount;
        return finalPrice;
    }
}