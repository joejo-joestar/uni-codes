import java.util.*;

public class Q2_StringSplitB {
    public static void main(String[] args) {
        @SuppressWarnings("resource") // to ignore the resource leak warning

        Scanner joe = new Scanner(System.in);

        System.out.print("please Enter a sentence:\n" +
                "  ==> ");
        String sentence = joe.nextLine();

        StringTokenizer split = new StringTokenizer(sentence.toLowerCase(), " ");

        System.out.println("Tokens Starting with 'b' is ");

        while (split.hasMoreTokens()) {
            String bSplit = split.nextToken();
            if (bSplit.startsWith("b")) {
                System.out.println(bSplit);

            }

        }

    }

}
