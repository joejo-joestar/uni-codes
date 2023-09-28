import java.util.Scanner;

class Q01_Primenums {
    public static void main(String[] args) {
        Scanner inp = new Scanner(System.in);
        int num1, num2 = 0;
        int flag = 0;

        System.out.print("Please enter the first number of the range: ");
        num1 = inp.nextInt();

        System.out.print("Please enter the second number of the range: ");
        num2 = inp.nextInt();

        for (int i = num1; i <= num2; i++) {
            if (i == 1 || i == 0){
                continue;

            }

            flag = 1;
            for (int j = 2; j <= i/2; j++) {
                if (i%j == 0) {
                    flag = 0;
                    break;

                }

            }

            if(flag == 1) {
                System.out.print(i + " ");
            }

        }

    }

}
