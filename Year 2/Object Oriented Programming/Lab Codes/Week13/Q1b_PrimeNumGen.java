import java.util.*;

class GenPrimesB {
	int startFrom; 
	int limit; 

	public GenPrimesB(int startFrom, int limit)  {
		if (startFrom < 0 || limit < 0) {
			throw new IllegalArgumentException("Input numbers Cannot be Negative");
		}

		else {
			this.startFrom = startFrom;
			this.limit = limit;
		}
	}

	public ArrayList<Integer> primes() {
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

public class Q1b_PrimeNumGen {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		try {		
			System.out.print("Please Enter the Lower Limit: ");
			int startFrom = sc.nextInt();

			System.out.print("Please Enter the Upper Limit: ");
			int limit = sc.nextInt();
			GenPrimesB test = new GenPrimesB(startFrom, limit) ;
			ArrayList<Integer> primes = test.primes();

			System.out.println("The Primes between " + startFrom + " and " + limit + " are: " + primes);

		}

		catch(IllegalArgumentException e){
			System.out.println(e);
		}

	}
}
