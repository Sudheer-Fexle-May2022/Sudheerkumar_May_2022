/**
* Description   - Instance of class 
* Created by    - Sudheer Kumar Shakya
* Created Date  - 09/07/2022
* Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date - 09/07/2022
*                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
**/
public class InstanceofClass {

    /**
    * Description   - Creating a inner class to manage the points 
    * Created by    - Sudheer Kumar Shakya
    * Created Date  - 09/07/2022
    * Revision log  -  V_1.0 - Created  - Sudheer Kumar Shakya - Date - 09/07/2022
    *                  V_1.1 - Modified - Sudheer Kumar Shakya - Date - 09/07/2022
    **/
    class Point {
        Double x;
        Double y;

        Point(Double x, Double y) {
             this.x = x;
             this.y = y;
        }

        Double getXCoordinate() {
             return x;
        }

        Double getYCoordinate() {
             return y;
        }
    }

    List<Point> points = new List<Point>();

    /**   Description :   Ctreating a method
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 08/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 08/07/2022
    **/
    public void plot(Double x, Double y) {
        points.add(new Point(x, y));
    }
    
    // The following method takes the list of points and does something with them
    public void render() {
    }

    /**   Description :   Ctreating a method to perform instanceOf keyword
    *     Created By  :   Sudheer Kumar Shakya
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Sudheer Kumar Shakya - Date - 08/07/2022
    *                     V_1.1 - Modified - Sudheer Kumar Shakya - Date - 08/07/2022
    **/
    public static void instanceofKeyword(){
        Object o = null;
        Boolean result = o instanceof Account;
        System.debug(result);
    }
}