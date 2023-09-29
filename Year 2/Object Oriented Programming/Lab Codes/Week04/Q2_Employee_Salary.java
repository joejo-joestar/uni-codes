import java.util.Scanner;

class Employee {
    private String idnum;
    private String name;
    private int dept;
    private double basic;
    private double allowance;
    private double totalSalary;

    public Employee(String id, String na, int de, double bas) {
        idnum = id;
        name = na;
        dept = de;
        basic = bas;

    }

    public void calculateSalary(int dep) {
        double hra;

        if (dep == 1) {
            allowance = 1500;

        }

        if (dep == 2) {
            allowance = 2500;

        }

        if (dep == 3) {
            allowance = 3500;

        }

        hra = (0.4 * basic);
        totalSalary = basic + hra + allowance;

    }

    public void display(int i) {

        System.out.println(" ");

        System.out.println("ID number of the employee " + (i + 1) + ": " + idnum);

        System.out.println("Name of the employee " + (i + 1) + ": " + name);

        if (dept == 1) {
            System.out.println("Department of the employee " + (i + 1) + ": Staff");

        }

        else if (dept == 2) {
            System.out.println("Department of the employee " + (i + 1) + ": Accounts");

        }

        else if (dept == 3) {
            System.out.println("Department of the employee " + (i + 1) + ": Admin");

        }

        System.out.println("Total Salary of the employee " + (i + 1) + ":" + totalSalary);

        System.out.println(" ");

    }

}

public class Q2_Employee_Salary {
    @SuppressWarnings("resource") // to ignore the resource leak warning
    public static void main(String[] args) {
        Scanner ip = new Scanner(System.in);
        Employee[] earr = new Employee[3];

        for (int i = 0; i < 3; i++) {
            System.out.println(" ");

            System.out.print("Please enter the ID number of the employee " + (i + 1) + ": ");
            String id = ip.nextLine();

            System.out.print("Please enter the Name of the employee " + (i + 1) + ": ");
            String na = ip.nextLine();

            System.out.print("Please enter the Department of the employee " + (i + 1)
                    + " ('1' for Staff, '2' for Accounts, '3' for Admin): ");
            int de = ip.nextInt();

            System.out.print("Please enter the Basic of the employee " + (i + 1) + ": ");
            double bas = ip.nextDouble();

            System.out.println(" ");

            ip.nextLine();

            earr[i] = new Employee(id, na, de, bas);

            earr[i].calculateSalary(de);

        }

        for (int i = 0; i < 3; i++) {
            earr[i].display(i);

        }

    }

}
