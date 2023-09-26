import java.util.Scanner;

class Votes {
    int[] vote = new int[10000];
    int voters;
    int totvotecount;
    int countc1 = 0;
    int countc2 = 0;
    int countc3 = 0;
    int countc4 = 0;
    int countc5 = 0;
    int countvoid = 0;

public Votes(int[] vote, int voters) {
    this.vote = vote;
    this.voters = voters;
        
}

public void count (int[] vote, int voters){

    for (int i = 0; i < voters; i++) {
        if (vote[i] == 1) {countc1++;}
        else if (vote[i] == 2) {countc2++;}
        else if (vote[i] == 3) {countc3++;}
        else if (vote[i] == 4) {countc4++;}
        else if (vote[i] == 5) {countc5++;}
        else {countvoid++;}

    }

}

public void display() {
    System.out.println(" ");
    System.out.println("Candidate 1 has " + countc1 + " votes");
    System.out.println("Candidate 2 has " + countc2 + " votes");
    System.out.println("Candidate 3 has " + countc3 + " votes");
    System.out.println("Candidate 4 has " + countc4 + " votes");
    System.out.println("Candidate 5 has " + countc5 + " votes");
    System.out.println("There were " + countvoid + " spoilt votes");
}


public class Q1_Election {
    public static void main(String[] args) {
        Scanner inp = new Scanner(System.in);
        
        System.out.print("Please enter the number of voters: ");
        int voters = inp.nextInt();
        
        int[] votes = new int[voters];
        
        for (int i = 0; i < voters; i++) {
            System.out.println(" ");
            
            System.out.print("Please enter your vote: ");
            int vote = inp.nextInt();
        
            votes[i] = vote;
        }
        
        Votes obj = new Votes(votes, voters);
        obj.count(votes, voters);
        obj.display();

        }
        
    }
    
}
