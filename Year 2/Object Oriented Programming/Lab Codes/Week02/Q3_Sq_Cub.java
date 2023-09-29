import java.lang.Math;

public class Q3_Sq_Cub {
    public static void main(String[] args) {
        for (int i = 0; i <= 10; i++) {
            double num = i;
            double sq = Math.pow(num, 2);
            double cube = Math.pow(num, 3);

            System.out.println(" ");

            System.out.println("The Square of\t" + num + "\tis\t" + sq);
            System.out.println("The Cube of\t" + num + "\tis\t" + cube);

        }

    }

}
