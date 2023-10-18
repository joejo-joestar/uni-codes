import java.util.*;

class DuplicateChecker {
    private int[] arr;
    private int[] arrDupe; // array with duplicated elements
    private int[] arrCount; // array with num of duplicates

    public DuplicateChecker(int[] arr) {
        this.arr = arr;

    }

    public void duplicates() {
        arrDupe = new int[arr.length];
        boolean[] flag = new boolean[arr.length];
        int dupeCount = 0;

        for (int i = 0; i < arr.length; i++) {
            if (flag[i]) {
                continue;

            }
            boolean dupesExist = false;

            for (int j = i + 1; j < arr.length; j++) {
                if (arr[i] == arr[j]) {
                    dupesExist = true;
                    flag[j] = true;

                }

            }
            if (dupesExist) {
                arrDupe[dupeCount++] = arr[i];

            }

        }
        arrDupe = Arrays.copyOfRange(arrDupe, 0, dupeCount);

        arrCount = new int[arrDupe.length];

        for (int i = 0; i < arrDupe.length; i++) {
            for (int j = 0; j < arr.length; j++) {
                if (arrDupe[i] == arr[j]) {
                    arrCount[i]++;

                }

            }

        }

    }

    public int[] getArrCount() {
        return arrCount;

    }

    public int[] getArrDupe() {
        return arrDupe;

    }

}

public class Q2_ArrayElements {

    public static void display(int[] arrDupe, int[] arrCount) {

        System.out.println("\nThe Duplicate Elements are: ");

        for (int i = 0; i < arrDupe.length; i++) {
            System.out.println("The Element " + "'" + arrDupe[i] + "'" + " has " + arrCount[i] + " Duplicates");

        }

    }

    public static void main(String[] args) {
        @SuppressWarnings("resource") // to ignore the resource leak warning

        Scanner joe = new Scanner(System.in);

        System.out.print("Please enter the number of elements: ");
        int lim = joe.nextInt();

        int[] arr = new int[lim];

        for (int i = 0; i < arr.length; i++) {
            System.out.print("Please enter Number " + (i + 1) + ": ");
            arr[i] = joe.nextInt();

        }
        DuplicateChecker check = new DuplicateChecker(arr);

        check.duplicates();

        int[] arrDupe = check.getArrDupe();
        int[] arrCount = check.getArrCount();

        display(arrDupe, arrCount);

    }

}
