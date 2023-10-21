import java.util.*;

class Purse {
    private float dirham;
    private float fils50;
    private float fils25;
    private float total;

    public Purse(float dirham, float fils50, float fils25) {
        this.dirham = dirham;
        this.fils50 = fils50;
        this.fils25 = fils25;

    }

    // adding money
    public void addDirham(float num) {
        dirham += num;

    }

    public void addFils50(int num) {
        fils50 += num;

    }

    public void addFils25(int num) {
        fils25 += num;

    }

    // deducting money
    public void removeDirham(int num) {
        if (num <= total) {
            dirham -= num;

        }

        else {
            System.out.println("Insufficient Funds");

        }

    }

    public void removeFils50(int num) {
        float check = num * .5f;

        if (check <= total) {
            fils50 -= num;

        }

        else {
            System.out.println("Insufficient Funds");

        }

    }

    public void removeFils25(int num) {
        float check = num * .25f;

        if (check <= total) {
            fils25 -= num;

        }

        else {
            System.out.println("Insufficient Funds");

        }

    }

    public void totalCash() {
        total = dirham + (.5f * fils50) + (.25f * fils25);

        System.out.println("The total money in the wallet is " + total + " Dhs");

    }

}

public class Q3_PurseTester {
    public static void main(String[] args) {
        @SuppressWarnings("resource") // to ignore the resource leak warning

        Scanner ip = new Scanner(System.in);
        Purse objPurse = new Purse(0, 0, 0);

        while (true) {
            System.out.println("Option:" +
                    "\n\t1. Add Money" +
                    "\n\t2. Withdraw Money" +
                    "\n\t3. Check Balance" +
                    "\n\t4. Quit");
            System.out.print("Please Enter the option: ");
            int option = ip.nextInt();

            if (option == 1) {
                while (true) {
                    System.out.println("Option:" +
                            "\n\t1. Add the number of Dirhams" +
                            "\n\t2. Add the number of 50 fils" +
                            "\n\t3. Add the number of 25 fils" +
                            "\n\t4. Quit");
                    System.out.print("Please Enter the option: ");
                    int addOption = ip.nextInt();

                    if (addOption == 1) {
                        objPurse.totalCash();
                        System.out.print("Please Enter the number of Dirhams: ");
                        objPurse.addDirham(ip.nextInt());

                    }

                    else if (addOption == 2) {
                        objPurse.totalCash();
                        System.out.print("Please Enter the number of 50 Fils: ");
                        objPurse.addFils50(ip.nextInt());

                    }

                    else if (addOption == 3) {
                        objPurse.totalCash();
                        System.out.print("Please Enter the number of 25 Fils: ");
                        objPurse.addFils25(ip.nextInt());

                    }

                    else if (addOption == 4) {
                        break;

                    }

                    else {
                        System.out.println("Invalid Input");

                    }

                }

            }

            else if (option == 2) {
                while (true) {
                    System.out.println(
                            "Option:" +
                                    "\n\t1. Withdraw the number of Dirhams" +
                                    "\n\t2. Withdraw the number of 50 fils" +
                                    "\n\t3. Withdraw the number of 25 fils" +
                                    "\n\t4. Quit");
                    System.out.print("Please Enter the option: ");
                    int addOption = ip.nextInt();

                    if (addOption == 1) {
                        objPurse.totalCash();
                        System.out.print("Please Enter the number of Dirhams: ");
                        objPurse.removeDirham(ip.nextInt());

                    }

                    else if (addOption == 2) {
                        objPurse.totalCash();
                        System.out.print("Please Enter the number of 50 Fils: ");
                        objPurse.removeFils50(ip.nextInt());

                    }

                    else if (addOption == 3) {
                        objPurse.totalCash();
                        System.out.print("Please Enter the number of 25 Fils: ");
                        objPurse.removeFils25(ip.nextInt());

                    }

                    else if (addOption == 4) {
                        break;

                    }

                    else {
                        System.out.println("Invalid Input");

                    }

                }

            }

            else if (option == 3) {
                objPurse.totalCash();

            }

            else if (option == 4) {
                break;

            }

            else {
                System.out.println("Invalid Input");

            }

        }

    }

}