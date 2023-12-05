import java.util.*;

class NameInvalidException extends Exception {
    public NameInvalidException(String name) {
        super("Name \"" + name + "\" is invalid.");
    }
}
class AgeInvalidException extends Exception {
    public AgeInvalidException(int age) {
        super("Age \"" + age + "\" should be < 35.");
    }
}
class YearInvalidException extends Exception {
    public YearInvalidException(int year) {
        super("Year \"" + year + "\" should be 1 to 4.");
    }
}
class IDInvalidException extends Exception {
    public IDInvalidException(String ID) {
        super("ID \"" + ID + "\" is invalid.");
    }
}

class Validator {
    public static boolean isNameValid(String name) {
        for (int i = 0; i < name.length(); i++) {
            if (!Character.isAlphabetic(name.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isAgeValid(int age) {
        return (age < 35);
    }

    public static boolean isYearValid(int year) {
        return (1 <= year && year <= 4);
    }

    public static boolean isIDValid(String ID) {
        // Check length
        if (ID.length() != 6) return false;
        char[] chars = ID.toCharArray();

        // Check first 'f'
        if (chars[0] != 'f') return false;

        // Check 4 digits
        for (int i = 1; i <= 4; i++) {
            if (!Character.isDigit(chars[i])) {
                return false;
            }
        }

        // Check last character
        return "GHPU".contains(chars[5] + "");
    }
}

class Student {
    private String name;
    private int age;
    private int year;
    private String id;

    public Student(String name, int age, int year, String id)
        throws NameInvalidException, AgeInvalidException,
        YearInvalidException, IDInvalidException {
        this.name = name;
        this.age = age;
        this.year = year;
        this.id = id;

        if (!Validator.isNameValid(name)) {throw new NameInvalidException(name);}
        if (!Validator.isAgeValid(age)) {throw new AgeInvalidException(age);}
        if (!Validator.isYearValid(year)) {throw new YearInvalidException(year);}
        if (!Validator.isIDValid(id)) {throw new IDInvalidException(id);}
    }
}

public class Q2_StudentTester {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter student details:");
        System.out.print("  Name: "); String name = sc.nextLine();
        System.out.print("  Age:  "); int age = Integer.parseInt(sc.nextLine());
        System.out.print("  Year: "); int year = Integer.parseInt(sc.nextLine());
        System.out.print("  ID:   "); String id = sc.nextLine();

        try {
            Student student = new Student(name, age, year, id);
            System.out.println("Created Student object!");
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }
}