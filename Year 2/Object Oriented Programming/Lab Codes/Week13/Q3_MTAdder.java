
import java.util.Scanner;

class Sum extends Thread implements Runnable {
    int l1, l2;
    long sum;

    public void run() {
        for (int i = l1; i <= l2; i++) sum += i;

    }
}

public class Q3_MTAdder {
    private static long sum(int nTerms, int nThreads){
        Sum s = new Sum();
        int count = 1;
        while (count <= (nTerms/nThreads)){
            s.l1 = s.l2+1;
            s.l2 = (nTerms/nThreads) == count ? nTerms : nTerms/nThreads;
            Thread t1 = new Thread(s);
            t1.start();
            while(t1.isAlive());
            count++;
        }
        return s.sum;
    }
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter terms : ");
        int terms = scanner.nextInt();
        System.out.print("Enter threads : ");
        int threads = scanner.nextInt();
        System.out.println("Sum : " + sum(terms,threads));
    }
}