import java.util.*;

class AnagramChecker {

    public static boolean isAnagram(String phrase1, String phrase2) {

        ArrayList<Character> strippedPhrase1 = filter(phrase1);
        ArrayList<Character> strippedPhrase2 = filter(phrase2);

        if (strippedPhrase1.size() != strippedPhrase2.size()) {
            return false;

        }

        else {

            Collections.sort(strippedPhrase1);
            Collections.sort(strippedPhrase2);

            return strippedPhrase1.equals(strippedPhrase2);

        }

    }

    public static ArrayList<Character> filter(String phrase) {

        ArrayList<Character> list = new ArrayList<>();

        for (char letter : phrase.toLowerCase().toCharArray()) {
            if (!('a' <= letter && letter <= 'z')) {
                continue;

            }

            else {
                list.add(letter);

            }

        }

        return list;

    }

}

public class Q4_Anagram {
    public static void main(String[] args) {
        @SuppressWarnings("resource") // to ignore the resource leak warning

        Scanner joe = new Scanner(System.in);

        System.out.print("Please Enter two Sentences:\n" +
                "  ==> ");
        String phrase1 = joe.nextLine();

        System.out.print("  ==> ");
        String phrase2 = joe.nextLine();

        if (AnagramChecker.isAnagram(phrase1, phrase2)) {
            System.out.println("The two phrases are Anagrams");

        }

        else {
            System.out.println("The two phrases are not Anagrams");

        }

    }

}
