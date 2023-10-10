import java.util.*;

class Car
{
    String vehicle_id;
    float[] Cost;
    float total, Grand_Total;

    public Car(String vehicle_id, float[] Cost_Dupli)
    {
        this.vehicle_id = vehicle_id;
        Cost = Cost_Dupli;
    }

    public void calc_total()
    {
        total = Cost[0] + Cost[1] + Cost[2];
    }

    public void calc_grand_total()
    {
        Grand_Total = total * 0.9f;
    }

}

public class Main {

    public static void displayHighest(Car[] sivaa)
    {
        Car max = sivaa[0];
        for (int i = 0; i < sivaa.length; i++)
        {
            if (sivaa[i].Grand_Total > max.Grand_Total)
            {
                max = sivaa[i];
            }
        }
        System.out.println("Details of car with highest price: ");
        System.out.println("  vehicle_id = " + max.vehicle_id);
        System.out.println("  total = " + max.total);
        System.out.println("  Grand_Total = " + max.Grand_Total);
    }

    public static void main (String[] args)
    {
        Scanner scanner = new Scanner(System.in);
        System.out.println ( "Enter total number of Cars: " );
        int n = scanner.nextInt();
        scanner.nextLine();

        Car[] sivaa = new Car[n]; // Array for Cars

        for (int i = 0; i < n; i++)
        {
            float[] Cost_Dupli = new float[3];

            System.out.print ("\nEnter name of the vehicle: ");
            String vehicle_id = scanner.nextLine();
            System.out.print ("Enter Base Price: ");
            Cost_Dupli[0] = scanner.nextFloat();
            System.out.print ("Enter Exercise Duty: ");
            Cost_Dupli[1] = scanner.nextFloat();
            System.out.print ("Enter Sales Tax: ");
            Cost_Dupli[2] = scanner.nextFloat();
            scanner.nextLine();

            sivaa[i] = new Car(vehicle_id, Cost_Dupli);
            sivaa[i].calc_total();
            sivaa[i].calc_grand_total();
        }

        displayHighest(sivaa);
    }
}
