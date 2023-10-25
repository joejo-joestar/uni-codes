import java.util.*;

class IDGen {
    String year;
    String discipline;
    String school;
    String campus;
    String id;

    public IDGen(String year, String discipline, String school, String campus) {
        this.year = year;
        this.discipline = discipline;
        this.school = school;
        this.campus = campus;

    }

    public void id() {
        Random rand = new Random();
        id = String.format("%04d", rand.nextInt(1000));

    }

    public String genID() {

        if ("pilani".equalsIgnoreCase(campus)) {
            return year + discipline.toUpperCase() + school.toUpperCase() + id + "P";

        }

        else if ("hyderabad".equalsIgnoreCase(campus)) {
            return year + discipline.toUpperCase() + school.toUpperCase() + id + "H";

        }

        else if ("goa".equalsIgnoreCase(campus)) {
            return year + discipline.toUpperCase() + school.toUpperCase() + id + "G";

        }

        else if ("dubai".equalsIgnoreCase(campus)) {
            return year + discipline.toUpperCase() + school.toUpperCase() + id + "U";

        }

        else {
            return "Invalid Campus";

        }

    }

    public String genEmail() {

        if ("pilani".equalsIgnoreCase(campus) ||
                "hyderabad".equalsIgnoreCase(campus) ||
                "goa".equalsIgnoreCase(campus) ||
                "dubai".equalsIgnoreCase(campus)) {

            return "f" + year + id + "@" +
                    campus.toLowerCase() + ".bits-pilani.ac.in";
        }

        else
            return "Invalid Campus";

    }

}

public class Q1_IDGenerator {
    public static void main(String[] args) {
        @SuppressWarnings("resource") // to ignore the resource leak warning

        Scanner joe = new Scanner(System.in);

        System.out.print("Please enter the year: ");
        String year = joe.nextLine();

        System.out.print("Discipline codes\n" +
                "  A1 => Chem\n" +
                "  A3 => EEE\n" +
                "  A4 => Mech\n" +
                "  A7 => CS\n" +
                "Please enter your Discipline based on the codes: ");
        String discipline = joe.nextLine();

        System.out.print("PS or TS: ");
        String school = joe.nextLine();

        System.out.print("Available Campuses\n" +
                "  Pilani\n" +
                "  Hyderabad\n" +
                "  Goa\n" +
                "  Dubai\n" +
                "Please enter your current campus: ");
        String campus = joe.nextLine();

        IDGen student = new IDGen(year, discipline, school, campus);

        student.id();

        System.out.println("\nThe ID Number is\t:\t" + student.genID());
        System.out.println("The Email ID is\t\t:\t" + student.genEmail());

    }

}
