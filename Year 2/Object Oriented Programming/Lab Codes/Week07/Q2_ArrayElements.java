// incomplete code
// incomplete code
// incomplete code
// incomplete code
// incomplete code


import java.util.*;

class DuplicateChecker {
    int lim;
    int[] arr;
    int[] arrCount;
    int[] arrDupe;

    public DuplicateChecker(int[] arr) {
        this.arr = arr;
        lim = arr.length;
        arrCount = new int[lim];
        arrDupe = new int[lim];

    }

    public int[] duplicatesCount() {
        int dupeCount = 0;
        for (int i = 0; i < arr.length; i++) {
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[i] == arr[j]) {
                    dupeCount++;

                }
                arrCount[i] = dupeCount;

            }

        }
        return arrCount;

    }

    public int[] duplicates() {
        for (int i = 0; i < arr.length; i++) {
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[i] == arr[j]) {
                    arrDupe[i] = arr[j];
                }

            }
        }
        return arrDupe;

    }

}

public class Q2_ArrayElements {
    public static void main(String[] args) {
        Scanner joe = new Scanner(System.in);

        System.out.print("Please enter the number of elements: ");
        int lim = joe.nextInt();

        int[] arr = new int[lim];

        for (int i = 0; i < arr.length; i++) {
            System.out.print("Please enter Number " + (i + 1) + ": ");
            arr[i] = joe.nextInt();

        }
        DuplicateChecker check = new DuplicateChecker(arr);

        int[] arrDupe = new int[lim];
        int[] arrCount = new int[lim];

        arrDupe = check.duplicates();
        arrCount = check.duplicatesCount();

    }

}
