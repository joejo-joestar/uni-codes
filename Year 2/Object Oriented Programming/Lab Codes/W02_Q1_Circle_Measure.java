import java.util.Scanner;

public class W02_Q1_Circle_Measure {
    public static void main(String[] args) {
        int rad;
        double dia, peri, ar;
        double pi = 3.14159;
        
        Scanner inp = new Scanner(System.in);

        System.out.print("PLease enter the radius of a circle: ");
        rad = inp.nextInt();

        dia = 2 * rad;
        peri = 2 * pi * rad;
        ar = pi * rad * rad; 

        System.out.println("The Diameter of the circle with radius '" + rad + "' is " + dia);
        System.out.println("The Circumference of the circle with radius '" + rad + "' is " + peri);
        System.out.println("The Area of the circle with radius '" + rad + "' is " + ar);
    
    }

}