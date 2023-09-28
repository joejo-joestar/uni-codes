import java.util.*;

class Q2_SavingsAccount {
    static double annualInterestrate = 0.04;
    private float savingsBalance;

    public Q2_SavingsAccount (float currcred) {
        savingsBalance = currcred;

    }

    public void monthlyInterest() {
        double monthlyinterst = (savingsBalance * annualInterestrate) / 12;
        savingsBalance += monthlyinterst;

    }

    public static void modifyInterestRate (double interest) {
        annualInterestrate = (interest / 100);

    }

    public void display(int person) {
        System.out.println(" ");
        System.out.println("The annual interest rate is " + annualInterestrate);
        System.out.println("Person " + person + "'s Savings Balance:" + savingsBalance);
        System.out.println(" ");

    }

    public void simulate(int person) {
        System.out.println(" ");
        System.out.println("The annual interest rate is " + annualInterestrate);
        System.out.println("Person " + person + "'s Savings Balance: ");

        for (int j = 0; j < 12; j++) {
            monthlyInterest();
            System.out.println("In Month " + (j+1) + ":\t" + savingsBalance);

        }
        System.out.println(" ");

    }

    public static void main(String[] args) {
        Scanner inp = new Scanner(System.in);
        Q2_SavingsAccount[] acc = new Q2_SavingsAccount[4];

        for (int i = 0; i < 3; i++) {
            System.out.print("Please enter Person " + (i+1) + "'s Savings Balance: ");
            acc[i] = new Q2_SavingsAccount(inp.nextFloat());

            while (true) {
                System.out.println("Menu: \n 1. Check Current Balance \n 2. Change Interest Rate \n 3. Simulate Savings Balance for 12 months \n 4. Quit");
                System.out.print("Please enter the menu option: ");
                int ip = inp.nextInt();

                if (ip == 1) {
                    acc[i].display((i+1));

                }

                else if (ip == 2) {
                    System.out.print("Please enter the new interst rate: ");
                    double interest = inp.nextDouble();
                    modifyInterestRate(interest);

                }

                else if (ip == 3) {
                    acc[i].simulate((i+1));

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
