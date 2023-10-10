import java.util.*;

class Car {
    private String vehicle;
    private float[] cost = new float[3];
    private float total, grandTotal;

    public Car(String vehicle, float base, float exercise, float salesTax) {
        this.vehicle = vehicle;
        cost[0] = base;
        cost[1] = exercise;
        cost[2] = salesTax;

    }

    public void calcTotal() {
        total = cost[0] + cost[1] + cost[2];

    }

    public void calcGrandTotal() {
        grandTotal = total * .9f;

    }

    public String getVehicle() {
        return vehicle;
    }

    public float getTotal() {
        return total;
    }

    public float getGrandTotal() {
        return grandTotal;
    }

}

public class Q1_Showroom {

    public static void display(Car[] car) {

        Car max = car[0];

        for (int i = 0; i < car.length; i++) {
            if (car[i].getGrandTotal() > max.getGrandTotal()) {
                max = car[i];

            }

        }

        System.out.println("The Car with the Highest Grand Total is ");
        System.out.println("Vehicle: " + max.getVehicle());
        System.out.println("Total: " + max.getTotal());
        System.out.println("Grand Total: " + max.getGrandTotal());
    }

    public static void main(String[] Args) {
        @SuppressWarnings("resource") // to ignore the resource leak warning
        Scanner joe = new Scanner(System.in);

        System.out.print("Please enter the number of cars to add: ");
        int lim = joe.nextInt();
        Car[] car = new Car[lim];

        for (int i = 0; i < lim; i++) {
            System.out.println();
            System.out.println("Please enter the Details of car " + (i + 1) + ": ");

            joe.nextLine();
            System.out.print("Vehicle Id: ");
            String vehicle = joe.nextLine();

            System.out.print("Base Cost: ");
            float base = joe.nextFloat();

            System.out.print("Exercise Duty: ");
            float exercise = joe.nextFloat();

            System.out.print("Sales Tax: ");
            float salesTax = joe.nextFloat();

            car[i] = new Car(vehicle, base, exercise, salesTax);
            car[i].calcTotal();
            car[i].calcGrandTotal();

        }
        display(car);

    }

}
