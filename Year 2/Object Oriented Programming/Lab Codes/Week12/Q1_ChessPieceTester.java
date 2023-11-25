import java.util.*;

interface Movable {
    void move(String newPos);

}

abstract class ChessPiece implements Movable {
    String name;
    String color;
    String curPos;

    public ChessPiece(String name, String color, String curPos) {
        this.name = name;
        this.color = color;
        this.curPos = curPos;

    }

    public void move(String newPos) {
        System.out.println(color + " " + name + " moving from " + curPos + " to " + newPos);
        this.curPos = newPos;

    }

    public String toString() {
        return color + " " + name + curPos;

    }
}

class King extends ChessPiece {
    String newPos;

    public King(String color, String curPos) {
        super("K", color, curPos);

    }

}

class Queen extends ChessPiece {
    String newPos;

    public Queen(String color, String curPos) {
        super("Q", color, curPos);

    }

}

class Bishop extends ChessPiece {
    String newPos;

    public Bishop(String name, String color, String curPos) {
        super(name, color, curPos);

    }

}

public class Q1_ChessPieceTester {
    @SuppressWarnings("resource") // to ignore the resource leak warning
    public static void main(String[] args) {
        ArrayList<ChessPiece> piece = new ArrayList<ChessPiece>();

        piece.add(new Bishop("B", "White", "c1"));
        piece.add(new King("Black", "e1"));
        piece.add(new Queen("White", "d1"));

        Scanner joe = new Scanner(System.in);

        for (int i = 0; i < piece.size(); i++) {
            System.out.println((i + 1) + ". " + piece.get(i));
        }

        while (true) {
            System.out.print("\nPlease enter the piece number and next move ('0 e' to exit program): ");
            String inp = joe.nextLine();
            String[] split = inp.split(" ", 2);

            if (split.length < 2) {
                System.out.println("Invalid Input");
                continue;

            }

            int num = Integer.parseInt(split[0]);
            String newPos = split[1];

            if (inp.equals("0 e")) {
                break;

            }

            if ((num - 1) < 0 || (num - 1) >= piece.size()) {
                System.out.println("Invalid Piece");

            }

            else {
                piece.get((num - 1)).move(newPos);

            }

        }

    }

}
