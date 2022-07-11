/**
* Description   - Creating an Outer Class 
* Created by    - Sudheer Kumar Shakya
* Created Date  - 09/07/2022
* Revision log  -  V_1.0 -  Created  - Sudheer Kumar Shakya - Date - 09/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
**/
public class PurchaseOrder{

    /**
    * Description   - Order Purchase Interface Inner Class 
    * Created by    - Sudheer Kumar Shakya
    * Created Date  - 09/07/2022
    * Revision log  -  V_1.0 -  Created  - Sudheer Kumar Shakya - Date - 09/07/2022
    *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
    **/
    public Interface OrderPurchase {

        Double discount();
    }    

    /**
    * Description   - Customer Purchase Order Inner Class  implements the Purchase Order class
    * Created by    - Sudheer Kumar Shakya
    * Created Date  - 09/07/2022
    * Revision log  -  V_1.0 -  Created  - Sudheer Kumar Shakya - Date - 09/07/2022
    *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
    **/
    public class CustomerPurchaseOrder implements OrderPurchase {

        /**   Description :   Method Decalred in the Customer purchase order class same as Interface Class
        * Created by    - Sudheer Kumar Shakya
        * Created Date  - 09/07/2022
        * Revision log  -  V_1.0 -  Created  - Sudheer Kumar Shakya - Date - 09/07/2022
        *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
        **/
        public Double discount() {
            system.debug('Customer Purchase Order Discount ');
            Integer Ammount=100;
            Integer  AfterDisc=95;
            return AfterDisc;  // Flat 5% discount
        }
    }

    /**
    * Description   - Employee Purchase Order Inner class implements the Purchase Order class
    * Created by    - Sudheer Kumar Shakya
    * Created Date  - 09/07/2022
    * Revision log  -  V_1.0 -  Created  - Sudheer Kumar Shakya - Date - 09/07/2022
    *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
    **/
    public class EmployeePurchaseOrder implements OrderPurchase {

        /**   Description :   Method Decalred in the Employee purchase order class same as Interface Class
        * Created by    - Sudheer Kumar Shakya
        * Created Date  - 09/07/2022
        * Revision log  -  V_1.0 -  Created  - Sudheer Kumar Shakya - Date - 09/07/2022
        *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
        **/
        public Double discount() {
          system.debug('Employee Purchase Order Discount ');
          Integer Ammount=500;
          Integer AftrDiscount=450;//Ammount payable after 10% discount  
          return AftrDiscount;  // It’s worth it being an employee! 10% discount
        } 
    }

    /**
    * Description   - Process Purchase Order Inner Class
    * Created by    - Sudheer Kumar Shakya
    * Created Date  - 09/07/2022
    * Revision log  -  V_1.0 -  Created  - Sudheer Kumar Shakya - Date - 09/07/2022
    *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
    **/
    public class ProcessPurchaseOrder{

        /**   Description :   Constructor print the statement 
        * Created by    - Sudheer Kumar Shakya
        * Created Date  - 09/07/2022
        * Revision log  -  V_1.0 -  Created  - Sudheer Kumar Shakya - Date - 09/07/2022
        *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
        **/
        public ProcessPurchaseOrder(){
            OrderPurchase op1 = new CustomerPurchaseOrder();
            op1.discount();
            processOrder(op1);

            OrderPurchase op2 = new EmployeePurchaseOrder();
            op2.discount();
            processOrder(op2);
        }

        /**   Description :   Method print the statement 
        * Created by    - Sudheer Kumar Shakya
        * Created Date  - 09/07/2022
        * Revision log  -  V_1.0 -  Created  - Sudheer Kumar Shakya - Date - 09/07/2022
        *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
        **/
        public void processOrder(OrderPurchase order){
            system.debug('Check Discount :' +order.discount());
        }
    } 
}