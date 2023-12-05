import java.util.*;


class GenPrimesA {
    public ArrayList<Integer> primes(int startFrom, int limit) {
        ArrayList<Integer> prime = new ArrayList<>();
        while (startFrom <= limit) {
            boolean flag = false;
            for (int i = 2; i <= startFrom / 2; ++i) {
                if (startFrom % i == 0) {
                    flag = true; 
                    break;
                }

            }

            if (!flag && startFrom != 0 && startFrom != 1) prime.add(startFrom);
            ++startFrom;	
        }

        return prime;
    }
}

public class Q1a_PrimeNumGen {
    public static void main(String[] args) {
        GenPrimesA test = new GenPrimesA();
        ArrayList<Integer> primes = test.primes(5, 18);
        System.out.println("The Primes between 5 and 18 are: " + primes);


    }
}
