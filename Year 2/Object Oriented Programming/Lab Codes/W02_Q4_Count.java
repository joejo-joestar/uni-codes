import java.util.Scanner;

public class W02_Q4_Count {
    public static void main(String[] args) {
        int countpos = 0;
        int countneg = 0;
        int countzero = 0;
        int temp = 0;

        Scanner inp = new Scanner(System.in);       
        
        int[] nums = new int[5];

        for (int i = 0; i < 5; i++) {
            System.out.print("Please enter Number " + (i+1) + ": ");
            nums[i] = inp.nextInt();
            
        }

        for (int i = 0; i < 5; i++) {
            if (nums[i] > 0)
                countpos++;

            else if (nums[i] < 0)
                countneg++;

            else if (nums[i] == 0)
                countzero++;

            else 
                temp++;

        }
        
        System.out.println("Number of Positive Numbers are " + countpos);
        System.out.println("Number of Negative Numbers are " + countneg);
        System.out.println("Number of Zeroes are " + countzero);
        
    }

}
