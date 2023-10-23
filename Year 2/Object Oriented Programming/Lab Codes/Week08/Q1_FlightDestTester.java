import java.util.*;

class FlightDest {
    private String flightNum;
    private String flightDest;

    public FlightDest(String flightNum, String flightDest) {
        this.flightNum = flightNum;
        this.flightDest = flightDest;

    }

    public String getFlightNum() {
        return flightNum;

    }

    public String getFlightDest() {
        return flightDest;

    }

}

class FlightInfo {
    private ArrayList<FlightDest> flightDestList;
    private FlightDest pair;

    public FlightInfo() {
        flightDestList = new ArrayList<>();

    }

    public void addFlightListDestPair(String fNo, String flightDest) {
        pair = new FlightDest(fNo, flightDest);
        flightDestList.add(pair);

    }

    public ArrayList<String> getFlightDest(String flightDest) {
        ArrayList<String> info = new ArrayList<>();

        for (FlightDest temp : flightDestList) {
            if (temp.getFlightDest().equals(flightDest)) {
                info.add(temp.getFlightNum());

            }

        }
        return info;

    }

    public void display() {
        int index = 1;
        for (FlightDest temp : flightDestList) {
            System.out.println("\nThe Details of Flight " + index + ": ");
            System.out.println("  Flight Number\t: " + temp.getFlightNum());
            System.out.println("  Destination\t: " + temp.getFlightDest());

            index++;

        }

    }

    public ArrayList<FlightDest> getFlightInfo() {
        return flightDestList;

    }

}

public class Q1_FlightDestTester {
    @SuppressWarnings("resource") // to ignore the resource leak warning

    public static void addFlight(FlightInfo flight, int i) {
        Scanner joe = new Scanner(System.in);
        System.out.print("\nPlease enter the Flight Number of Flight " + (i + 1) + " : ");
        String flightNum = joe.nextLine();
        System.out.print("Please enter the Destination of Flight " + (i + 1) + " : ");
        String flightDest = joe.nextLine();

        flight.addFlightListDestPair(flightNum, flightDest);

    }

    public static void main(String[] args) {
        @SuppressWarnings("resource") // to ignore the resource leak warning

        Scanner joe = new Scanner(System.in);
        FlightInfo flight = new FlightInfo();
        int index = 0;

        while (true) {
            System.out.println("\nOptions:" +
                    "\n\t1. Add Flight" +
                    "\n\t2. View Flights" +
                    "\n\t3. View Flights to Destination" +
                    "\n\t4. Quit");
            System.out.print("Please enter the Option: ");
            int option = joe.nextInt();

            if (option == 1) {
                addFlight(flight, index);
                index = index + 1;

            }

            else if (option == 2) {
                System.out.println("\nFlights:");
                flight.display();

            }

            else if (option == 3) {
                joe.nextLine();
                System.out.print("\nPlease enter the Destination for the Flight Info: ");
                String dest = joe.nextLine();

                ArrayList<String> info = flight.getFlightDest(dest);
                System.out.println("\nAll the Flights traveling to " + dest + " :");
                System.out.println("  " + info);

            }

            else if (option == 4) {
                break;

            }

            else {
                System.out.println("Invalid Option");

            }

        }

    }

}