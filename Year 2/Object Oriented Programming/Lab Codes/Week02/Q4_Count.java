import java.util.Scanner;

public class Q4_Count {
    @SuppressWarnings("resource") // to ignore the resource leak warning
    public static void main(String[] args) {
        int countPos = 0;
        int countNeg = 0;
        int countZero = 0;
        Scanner inp = new Scanner(System.in);

        int[] nums = new int[5];

        for (int i = 0; i < 5; i++) {
            System.out.print("Please enter Number " + (i + 1) + ": ");
            nums[i] = inp.nextInt();

        }

        for (int i = 0; i < 5; i++) {
            if (nums[i] > 0)
                countPos++;

            else if (nums[i] < 0)
                countNeg++;

            else if (nums[i] == 0)
                countZero++;
            else {
            }

        }

        System.out.println("Number of Positive Numbers are " + countPos);
        System.out.println("Number of Negative Numbers are " + countNeg);
        System.out.println("Number of Zeroes are " + countZero);

    }

}
