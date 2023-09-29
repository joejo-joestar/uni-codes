import java.util.Scanner;

public class OddEven {
	@SuppressWarnings("resource") // to ignore the resource leak warning
	public static void main(String[] args) {

		Scanner inp = new Scanner(System.in);

		int num;

		System.out.print("Please enter a number: ");
		num = inp.nextInt();

		if (num % 2 == 0) {
			System.out.println("The number '" + num + "' is even");

		}

		else {
			System.out.println("The number '" + num + "' is odd");

		}

	}
}
