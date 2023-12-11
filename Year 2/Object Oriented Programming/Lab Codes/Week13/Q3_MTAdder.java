import java.util.*;

class Sum extends Thread {
    int from, to;
    long sum = 0;

    public Sum(int from, int to) {
        this.from = from;
        this.to = to;

    }

    public void run() {
        for (int i = from; i <= to; i++) {
            sum += i;
        }

    }
}

public class Q3_MTAdder {
    @SuppressWarnings("resource") // to ignore the resource leak warning
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Please enter the limit: ");
        int lim = sc.nextInt();

        System.out.print("Please enter the number of threads: ");
        int numT = sc.nextInt();

        Sum[] t = new Sum[numT];

        for (int i = 0; i < numT; i++) {
            int from = 1 + (i * (lim / numT));
            int to = ((i + 1) * (lim / numT));
            if (i == numT - 1) {
                to = lim;

            }
            t[i] = new Sum(from, to);
            t[i].start();

        }

        long sum = 0;
        for (int i = 0; i < numT; i++) {
            try {
                t[i].join();

            } catch (Exception e) {
                System.out.println(e);

            }
            sum += t[i].sum;

        }

        System.out.println("Sum is " + sum);

    }

}