import java.util.Scanner;

class CreditCard {
    private String name;
    private String cardNum;
    private boolean enabled;
    private int pin;
    private String expiryMonth;
    private int cardType;
    private double currentCred;
    double creditLim;

    public CreditCard(String name, String cardNum, boolean enabled, int pin,
            String expiryMonth, int cardType, double currentCred, double creditLim) {
        this.name = name;
        this.cardNum = cardNum;
        this.enabled = enabled;
        this.pin = pin;
        this.expiryMonth = expiryMonth;
        this.cardType = cardType;
        this.currentCred = currentCred;
        this.creditLim = creditLim;

    }

    @SuppressWarnings("resource") // to ignore the resource leak warning
    public void changePin(int p) {
        Scanner ip = new Scanner(System.in);
        if (p == pin) {
            System.out.printf("Please enter New Card Pin: ");
            int newPin = ip.nextInt();
            pin = newPin;
            System.out.println("The pin has been successfully changed!");
        }

        else if (p != pin) {
            System.out.println("The input Pin is Incorrect");
        }

        else {
            System.out.println("Error!");
        }

    }

    @SuppressWarnings("resource") // to ignore the resource leak warning
    public void transact(int p) {
        Scanner ip = new Scanner(System.in);

        if (p == pin) {
            if (enabled == true) {
                System.out.print("Input Amount to Withdraw: ");

                double amt = ip.nextInt();
                double siDisc = (amt - (amt * 0.01));
                double goDisc = (amt - (amt * 0.02));
                double plDisc = (amt - (amt * 0.03));

                if (amt > currentCred) {
                    System.out.println();
                    System.out.println("Insufficient Funds");
                    System.out.println();

                }

                if (amt <= creditLim) {
                    if (cardType == 1) {
                        currentCred = currentCred - siDisc;
                        System.out.println("Current Credit = " + currentCred);

                    }

                    else if (cardType == 2) {
                        currentCred = currentCred - goDisc;
                        System.out.println("Current Credit = " + currentCred);

                    }

                    else if (cardType == 3) {
                        currentCred = currentCred - plDisc;
                        System.out.println("Current Credit = " + currentCred);

                    }

                    else {
                        System.out.println("error");

                    }

                }

                else if (amt > creditLim) {
                    System.out.println("The amount entered is over the credit limit.");

                }

                else {
                    System.out.println("Error");

                }

            }

            else if (enabled == false) {
                System.out.println("Please Activate the Card.");

            }

            else {
                System.out.println("Error");
            }

        }

        else if (p != pin) {
            System.out.println("The input Pin is Incorrect");
        }

        else {
            System.out.println("Error!");
        }

    }

    @SuppressWarnings("resource") // to ignore the resource leak warning
    public void changeCardStat(int p) {
        Scanner ip = new Scanner(System.in);

        char inp;

        if (p == pin) {
            if (enabled == true) {
                System.out.println("Do you want to Deactivate the card? " +
                        "\n (input 'y' to deactivate else input 'n')");
                inp = ip.next().charAt(0);

                if (inp == 'y') {
                    enabled = false;
                    System.out.println("The card has successfully Deactivated");

                }

                else if (inp == 'n') {
                    enabled = true;
                    System.out.println("The card is not deactivated");

                }

                else {
                    System.out.println("Error");

                }

            }

            else if (enabled == false) {
                System.out.println("Do you want to Activate the card? " +
                        "\n (input 'y' to activate else input 'n')");
                inp = ip.next().charAt(0);

                if (inp == 'y') {
                    enabled = true;
                    System.out.println("The card has successfully Activated");

                }

                else if (inp == 'n') {
                    enabled = false;
                    System.out.println("The card is not activated");
                }

                else {
                    System.out.println("Error");

                }
            }

            else {
                System.out.println("Error");
            }

        }

        else if (p != pin) {
            System.out.println("The input Pin is Incorrect");
        }

        else {
            System.out.println("Error!");
        }

    }

    public void display() {
        System.out.println(" ");
        System.out.println("Card-holder Name: " + name);
        System.out.println("Card Number: " + cardNum);

        if (enabled == true) {
            System.out.println("The Card is Activated");
        }

        else if (enabled == false) {
            System.out.println("The Card is Inactive");
        }

        else {
            System.out.println("Error");
        }

        System.out.println("Card Pin: " + pin);
        System.out.println("Card Expiry Month: " + expiryMonth);

        if (cardType == 1) {
            System.out.println("Card Type: Silver");
        }

        else if (cardType == 2) {
            System.out.println("Card Type: Gold");
        }

        else if (cardType == 3) {
            System.out.println("Card Type: Platinum");
        }

        else {
            System.out.println("Not Valid");
        }

        System.out.println("Current Credit: " + currentCred);
        System.out.println("Credit Limit: " + creditLim);
        System.out.println(" ");

    }

}

public class Q1_CreditCard {
    @SuppressWarnings("resource") // to ignore the resource leak warning
    public static void main(String[] args) {
        Scanner ip = new Scanner(System.in);

        CreditCard temp = new CreditCard(null, null, false, 0, null, 0, 0, 0);
        CreditCard[] userArr = new CreditCard[1];
        userArr[0] = temp;

        while (true) {
            System.out.println();
            System.out.println("Menu:" +
                    "\n\t1. View Card Details" +
                    "\n\t2. Add Card Details" +
                    "\n\t3. Change Pin" +
                    "\n\t4. Transaction" +
                    "\n\t5. Activate / Deactivate Card" +
                    "\n\t6. Quit");
            System.out.println();

            System.out.printf("Please enter the option number: ");
            int inp = ip.nextInt();

            // View Card
            if (inp == 1) {
                userArr[0].display();

            }

            // Add Card
            if (inp == 2) {
                System.out.println();
                ip.nextLine();
                System.out.printf("Please enter Card-holder Name: ");
                String cNam = ip.nextLine();

                System.out.printf("Please enter Card Number: ");
                String cNum = ip.nextLine();

                boolean en = false;

                System.out.printf("Please enter Card Pin: ");
                int p = ip.nextInt();

                ip.nextLine();
                System.out.printf("Please enter Card Expiry Month: ");
                String expMon = ip.nextLine();

                System.out.printf("Please enter the Card Type ('1' for Silver, '2' for Gold, '3' for Platinum): ");
                int cTy = ip.nextInt();

                System.out.println();

                double curCred = 10000;

                double credLim = 1000;

                CreditCard u1 = new CreditCard(cNam, cNum, en, p, expMon, cTy, curCred, credLim);
                userArr[0] = u1;

            }

            // Change Pin
            if (inp == 3) {
                System.out.printf("Please enter Current Card Pin: ");
                int pin = ip.nextInt();
                userArr[0].changePin(pin);

            }

            // Transaction
            if (inp == 4) {
                System.out.printf("Please enter Current Card Pin: ");
                int pin = ip.nextInt();
                userArr[0].transact(pin);

            }

            // Activate / Deactivate
            if (inp == 5) {
                System.out.printf("Please enter Current Card Pin: ");
                int pin = ip.nextInt();
                userArr[0].changeCardStat(pin);
                ;

            }

            // Exit
            if (inp == 6) {
                break;

            }

            else {
                System.out.println();
                System.out.println("Invalid Input");
                System.out.println();

            }
        }
    }

}
