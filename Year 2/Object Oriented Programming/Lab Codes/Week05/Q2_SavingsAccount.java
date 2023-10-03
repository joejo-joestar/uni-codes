import java.util.*;

class Interest {
    static double annualInterestRate = 0.12;
    private float savingsBalance;

    public Interest(float currentCred) {
        savingsBalance = currentCred;

    }

    public void monthlyInterest() {
        double monthlyInterest = (savingsBalance * annualInterestRate) / 12;
        savingsBalance += monthlyInterest;

    }

    public static void modifyInterestRate(double interest) {
        annualInterestRate = (interest / 100);

    }

    public void display(int person) {
        System.out.println(" ");
        System.out.println("The annual interest rate is " + annualInterestRate);
        System.out.println("Person " + person + "'s Savings Balance:" + savingsBalance);
        System.out.println(" ");

    }

    public void simulate(int person) {
        System.out.println(" ");
        System.out.println("The annual interest rate is " + annualInterestRate);
        System.out.println("Person " + person + "'s Savings Balance: ");

        for (int j = 0; j < 12; j++) {
            monthlyInterest();
            System.out.println("In Month " + (j + 1) + ":\t" + savingsBalance);

        }
        System.out.println(" ");

    }

}

class Q2_SavingsAccount {
    public static void main(String[] args) {
        @SuppressWarnings("resource") // to ignore the resource leak warning

        Scanner inp = new Scanner(System.in);
        Interest[] acc = new Interest[4];

        for (int i = 0; i < 3; i++) {
            System.out.print("Please enter Person " + (i + 1) + "'s Savings Balance: ");
            acc[i] = new Interest(inp.nextFloat());

            while (true) {
                System.out.println(
                        "Menu: \n 1. Check Current Balance \n 2. Change Interest Rate \n 3. Simulate Savings Balance for 12 months \n 4. Quit");
                System.out.print("Please enter the menu option: ");
                int ip = inp.nextInt();

                if (ip == 1) {
                    acc[i].display((i + 1));

                }

                else if (ip == 2) {
                    System.out.print("Please enter the new interest rate: ");
                    double interest = inp.nextDouble();
                    Interest.modifyInterestRate(interest);

                }

                else if (ip == 3) {
                    acc[i].simulate((i + 1));

                }

                else if (ip == 4) {
                    break;

                }

                else {
                    System.out.println("Invalid Input");

                }

            }

        }

    }

}
