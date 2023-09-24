import java.lang.Math;

public class W02_Q3_Sq_Cub {
    public static void main(String[] args) {
        for (int i = 0; i <= 10; i++) {
            double num = i;
            double sq = Math.pow(num, 2);
            double cube = Math.pow(num, 3);

            System.out.println(" ");

            System.out.println("The Square of " + num + " is "+ sq);
            System.out.println("The Cube of " + num + " is "+ cube);

        }

    }
    
}