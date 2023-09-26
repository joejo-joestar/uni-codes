import java.util.*;

class Largest {
    public static void main(String[] args) {
        Scanner inp = new Scanner(System.in);
        int num1, num2, num3 = 0;
        
        System.out.print("Please enter the first number: ");
        num1 = inp.nextInt();

        System.out.print("Please enter the second number: ");
        num2 = inp.nextInt();

        System.out.print("Please ennter the third number: ");
        num3 = inp.nextInt();

        if(num1 > num2 && num1 > num3) {
            System.out.println("The Larget Number is: " + num1);
            
        }

        else if(num2 > num1 && num2 > num3) {
            System.out.println("The Larget Number is: " + num2);
            
        }

        else if(num3 > num2 && num3 > num1) {
            System.out.println("The Larget Number is: " + num3);
            
        }

        else {
            System.out.println("All three numbers are equal.");
            
        }

    }

}
