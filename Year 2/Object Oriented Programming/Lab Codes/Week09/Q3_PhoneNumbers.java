import java.util.*;

class Number {
    public static String countryCode(String number) {
        if (!number.startsWith("00971")) {
            return "Invalid Country Code";

        }

        else {
            return "UAE";

        }

    }

    public static String numberType(String number) {
        if (number.regionMatches(5, "50", 0, 2) ||
                number.regionMatches(5, "52", 0, 2) ||
                number.regionMatches(5, "53", 0, 2) ||
                number.regionMatches(5, "54", 0, 2) ||
                number.regionMatches(5, "55", 0, 2) ||
                number.regionMatches(5, "56", 0, 2)) {
            return "Mobile Number";

        }

        else if (number.regionMatches(5, "2", 0, 1) ||
                number.regionMatches(5, "4", 0, 1) ||
                number.regionMatches(5, "6", 0, 1)) {
            return "Land Line Number";

        }

        else if (number.regionMatches(5, "800", 0, 3) ||
                number.regionMatches(5, "600", 0, 3)) {
            return "Toll Free Number";

        }

        else {
            return "Invalid Country Code";

        }

    }

}

public class Q3_PhoneNumbers {
    public static void main(String[] args) {
        @SuppressWarnings("resource") // to ignore the resource leak warning

        Scanner joe = new Scanner(System.in);

        System.out.print("please Enter a phone number with country code:\n" +
                "  ==> ");
        String number = joe.nextLine();

        System.out.println("Country Code\t:\t" + Number.countryCode(number));
        System.out.println("Number Type \t:\t" + Number.numberType(number));

    }

}
