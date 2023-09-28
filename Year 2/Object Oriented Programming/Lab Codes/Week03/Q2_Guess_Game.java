import java.util.*;

class Player {
    int num;

    public void guess (int num) {
        this.num = num;

    }

}


class GuessGame {
    Player p1 = new Player();
    Player p2 = new Player();
    Player p3 = new Player();

    public void startGame() {
        int[] guess = new int[3];
        Scanner inp = new Scanner(System.in);

        for (int i = 0; i < 3; i++) {
            System.out.print("Please enter Player " + (i+1) + " guess: ");
            int input = inp.nextInt();
            guess[i] = input;

        }

        p1.guess(guess[0]);
        p2.guess(guess[1]);
        p3.guess(guess[2]);

    }

    public void check (int win) {
        if (win == p1.num) {System.out.println("Player 1 Wins!");}
        if (win == p2.num) {System.out.println("Player 2 Wins!");}
        if (win == p3.num) {System.out.println("Player 3 Wins!");}
        if ((win != p1.num) && (win != p2.num) && (win != p3.num)) {
            System.out.println("Noone Wins");
        }

    }

}


public class Q2_Guess_Game {
    public static void main(String[] args) {
        Random rand = new Random();

        int winnum = rand.nextInt(10);

        // System.out.println("rand: " + winnum);

        GuessGame obj = new GuessGame();

        obj.startGame();

        obj.check(winnum);

    }

}
