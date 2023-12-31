import java.util.Scanner;

public class Q1_Circle_Measure {
    @SuppressWarnings("resource") // to ignore the resource leak warning
    public static void main(String[] args) {
        int rad;
        double dia, peri, ar;
        double pi = 3.14159;

        Scanner inp = new Scanner(System.in);

        System.out.print("Please enter the radius of a circle: ");
        rad = inp.nextInt();

        dia = 2 * rad;
        peri = 2 * pi * rad;
        ar = pi * rad * rad;

        System.out.println("The Diameter of the circle with radius '" + rad + "' is " + dia);
        System.out.println("The Circumference of the circle with radius '" + rad + "' is " + peri);
        System.out.println("The Area of the circle with radius '" + rad + "' is " + ar);

    }

}
