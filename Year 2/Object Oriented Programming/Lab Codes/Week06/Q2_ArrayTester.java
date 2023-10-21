import java.util.Scanner;

public class Q2_ArrayTester {

    public static void min(int lim, float[] arr) {
        float min = arr[0];
        for (int i = 0; i < lim; i++) {
            if (arr[i] < min) {
                min = arr[i];

            }

        }
        System.out.println("The minimum val in the array is " + min);

    }

    public static void max(int lim, float[] arr) {
        float max = arr[0];
        for (int i = 0; i < lim; i++) {
            if (arr[i] > max) {
                max = arr[i];

            }

        }
        System.out.println("The maximum val in the array is " + max);

    }

    public static void avg(int lim, float[] arr) {
        float sum = 0;

        for (int i = 0; i < lim; i++) {
            sum += arr[i];
        }

        float avg = sum / lim;

        System.out.println("The average of the array is " + avg);
    }

    public static void main(String[] args) {
        @SuppressWarnings("resource") // to ignore the resource leak warning

        Scanner ip = new Scanner(System.in);

        System.out.print("Please enter the number of elements: ");
        int lim = ip.nextInt();

        float[] arr = new float[lim];

        for (int i = 0; i < lim; i++) {
            System.out.print("Please enter the element " + (i + 1) + ": ");
            arr[i] = ip.nextFloat();

        }

        min(lim, arr);
        max(lim, arr);
        avg(lim, arr);

    }

}
