
interface avgVisit {
	public double avgV();

	public String display();
}

abstract class Expo {
	public String pavN;
	public int days;

	public Expo(String pavN, int days) {
		this.pavN = pavN;
		this.days = days;
	}

	public String toString() {

	}

}

class Russia extends Expo implements avgVisit {
	public double avg;
	public int visitors, slot, rank, avgVisitor;

	public Russia(String pavN, int days, int slot, int visitors, int rank) {
		Super(pavN, days);
		this.slot = slot;
		this.visitors = visitors;
		this.rank = rank;
	}

}

public class Q1ExpoTester {

}
