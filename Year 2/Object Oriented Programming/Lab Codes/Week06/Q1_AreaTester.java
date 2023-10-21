import java.util.*;

class Area {
    private float side1;
    private float side2;

    public void calc_Area(int side) {
        side1 = side;
        float area = side * side;
        display(1, area);

    }

    public void calc_Area(float radius) {
        side1 = radius;
        float area = 3.14f * radius * radius;
        display(2, area);

    }

    public void calc_Area(float s1, float s2) {
        side1 = s1;
        side2 = s2;

        float area = side1 * side2;
        display(3, area);

    }

    public void display(int index, float area) {

        if (index == 1) {
            System.out.println("The Area of Square with side of length " +
                    side1 + " is " + area);

        }

        else if (index == 2) {
            System.out.println("The Area of the Circle with radius of length " +
                    side1 + " is " + area);

        }

        else if (index == 3) {
            System.out.println("The Area of the rectangle with side 1 of length " +
                    side1 + " and side 2 of length " + side2 +
                    " is " + area);

        }

    }

}

public class Q1_AreaTester {
    public static void main(String[] args) {
        @SuppressWarnings("resource") // to ignore the resource leak warning

        Scanner ip = new Scanner(System.in);
        Area obj = new Area();

        System.out.println("Option: " +
                "\n\t1. Calculate the area of a Square " +
                "\n\t2. Calculate the area of a Circle " +
                "\n\t3. Calculate the area of a Rectangle");
        System.out.print("Please Enter the option to calculate: ");
        int option = ip.nextInt();

        switch (option) {
            case 1:
                System.out.println("Calculate area of a Square: ");

                System.out.print("Please enter the length of a side: ");
                int side = ip.nextInt();

                obj.calc_Area(side);
                break;

            case 2:
                System.out.println("Calculate area of a Circle: ");

                System.out.print("Please enter the radius: ");
                float radius = ip.nextFloat();

                obj.calc_Area(radius);
                break;

            case 3:
                System.out.println("Calculate area of a Rectangle: ");

                System.out.print("Please enter the length of side 1: ");
                float side1 = ip.nextFloat();
                System.out.print("Please enter the length of side 2: ");
                float side2 = ip.nextFloat();

                obj.calc_Area(side1, side2);
                break;

        }

    }

}
