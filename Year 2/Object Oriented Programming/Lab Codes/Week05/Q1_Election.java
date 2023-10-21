import java.util.Scanner;

class Votes {
    int[] vote = new int[10000];
    int voters;
    int countC1 = 0;
    int countC2 = 0;
    int countC3 = 0;
    int countC4 = 0;
    int countC5 = 0;
    int countVoid = 0;

    public Votes(int[] vote) {
        this.vote = vote;

    }

    public void count(int[] vote, int voters) {

        for (int i = 0; i < voters; i++) {
            if (vote[i] == 1) {
                countC1++;
            } else if (vote[i] == 2) {
                countC2++;
            } else if (vote[i] == 3) {
                countC3++;
            } else if (vote[i] == 4) {
                countC4++;
            } else if (vote[i] == 5) {
                countC5++;
            } else {
                countVoid++;
            }

        }

    }

    public void display() {
        System.out.println(" ");
        System.out.println("Candidate 1 has " + countC1 + " votes");
        System.out.println("Candidate 2 has " + countC2 + " votes");
        System.out.println("Candidate 3 has " + countC3 + " votes");
        System.out.println("Candidate 4 has " + countC4 + " votes");
        System.out.println("Candidate 5 has " + countC5 + " votes");
        System.out.println("There were " + countVoid + " spoilt votes");
    }
}

public class Q1_Election {
    @SuppressWarnings("resource") // to ignore the resource leak warning
    public static void main(String[] args) {
        Scanner inp = new Scanner(System.in);

        System.out.print("Candidates: " +
                "\n\t1. Candidate 1 " +
                "\n\t 2. Candidate 2 " +
                "\n\t 3. Candidate 3 " +
                "\n\t 4. Candidate 4 " +
                "\n\t 5. Candidate 5");
        System.out.print("Please enter the number of voters: ");
        int voters = inp.nextInt();

        int[] votes = new int[voters];

        for (int i = 0; i < voters; i++) {
            System.out.println(" ");

            System.out.print("Please enter your vote: ");
            int vote = inp.nextInt();

            votes[i] = vote;
        }

        Votes obj = new Votes(votes);
        obj.count(votes, voters);
        obj.display();

    }

}
