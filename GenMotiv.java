/* Example motivating generics: 
   written by Hyunyoung Lee for CSCE 314 Students 
*/

import java.util.*;

class GenMotiv {
  public static void main(String[] args) {
   //GenMotiv g = new GenMotiv();
   //List<Integer> l = new LinkedList<Integer>();
   //l.add(Integer.valueOf(7));
   //Integer x = l.get(0); // no need for type cast
   //String x1 = l.get(0); // compile-time error

   /* The following code will cause a warning error:
   Note: GenMotiv.java uses unchecked or unsafe operations.
   Note: Recompile with -Xlint:unchecked for details.

   As recommended in the error, recompile with the -Xlint:unchecked option
   and see the error message; correct the error, and see what happens.*/
   List<Integer> l = new LinkedList<Integer>();
   l.add(Integer.valueOf(7));
   Integer x = l.get(0); // compiler error: incompatible types
   //Integer x = (Integer) l.get(0); // O.K. 
   Number s = (Number) l.get(0); // bad cast exception
   System.out.println("x = " + x);
   //*/ 
  }
}