import java.util.*;

class Calculate {
    public static void printTable(int limit) {
        System.out.println();

        for (int row = 1; row <= limit; row++) {
            for (int col = 1; col <= 10; col++) {
                System.out.print("| " + (row * col) + "\t");
            }
            System.out.println("|");
        }

    }

}

public class Q3_TimesTable {
    public static void main(String[] args) {
        @SuppressWarnings("resource") // to ignore the resource leak warning

        Scanner joe = new Scanner(System.in);

        System.out.print("Please enter the table to print: ");
        Calculate.printTable(joe.nextInt());
        
    }

}

