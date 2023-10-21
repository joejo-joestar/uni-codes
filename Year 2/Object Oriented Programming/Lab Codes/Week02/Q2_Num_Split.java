import java.util.Scanner;

public class Q2_Num_Split {
    @SuppressWarnings("resource") // to ignore the resource leak warning
    public static void main(String[] args) {

        Scanner inp = new Scanner(System.in);

        System.out.print("Please enter a 5 digit number: ");
        String num = inp.nextLine();

        String split[] = num.split("");

        for (int i = 0; i < 5; i++) {
            System.out.print(split[i] + " ");

        }

    }

}
