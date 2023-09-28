import java.util.Scanner;

class Elements {
    int anum;
    String name, sym, type;
    double aweight;

    Elements(int an, String na, String sy, String ty, double aw) {
        anum = an;
        name = na;
        sym = sy;
        type = ty;
        aweight = aw;

    }

    public void display() {
        System.out.println(" ");
        System.out.println("Atomic Number: " + anum);
        System.out.println("Element Name: " + name);
        System.out.println("Chemical Symbol: " + sym);
        System.out.println("Element Type/Class: " + type);
        System.out.println("Atomic Weight: " + aweight);
        System.out.println(" ");

    }

    public void sort() {

        if (aweight > 15) {
            display();

        }

    }

}


public class Q1_PT {
    public static void main(String[] args) {
        Scanner inp = new Scanner(System.in);

        System.out.print("Please enter the number of the elements to input: ");
        int num = inp.nextInt();

        Elements[] arr = new Elements[num];

        for (int i = 0; i < num; i++) {
            System.out.println(" ");

            System.out.print("Please enter the Atomic number of the element: ");
            int anum = inp.nextInt();

            inp.nextLine();

            System.out.print("Please enter the Name of the element: ");
            String name = inp.nextLine();

            System.out.print("Please enter the Chemical Symbol of the element: ");
            String sym = inp.nextLine();

            System.out.print("Please enter the Class / Type of the element: ");
            String type = inp.nextLine();

            System.out.print("Please enter the Atomic Weight of the element: ");
            Double aweight = inp.nextDouble();

            arr[i] = new Elements(anum, name, sym, type, aweight);

            // arr[i].display();

        }

        System.out.println(" ");
        System.out.println("The Elements with Atomic Weight over 15amu are: ");
        for (int i = 0; i < num; i++) {
            arr[i].sort();

        }

    }

}
