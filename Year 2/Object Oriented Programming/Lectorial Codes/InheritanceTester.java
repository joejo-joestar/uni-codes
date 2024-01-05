class PersonInh implements Comparable<PersonInh> {
    private String name;
    private int age;

    public PersonInh(String name, int age) {
        this.name = name;
        this.age = age;

    }

    public String getName() {
        return name;

    }

    @Override
    public int compareTo(PersonInh o) {
        if (this.age == o.age) {
            return 0;

        }

        else {
            return (this.age > o.age) ? 1 : -1;

        }

    }

}

public class InheritanceTester {
    public static void main(String[] args) {
        PersonInh p2 = new PersonInh("stell", 20);
        PersonInh p1 = new PersonInh("Joe", 20);

        switch (p1.compareTo(p2)) {
            case 0:
                System.out.println(p1.getName() + " and " + p2.getName() + " both have the same age");
                break;

            case 1:
                System.out.println(p1.getName() + " is older than " + p2.getName());
                break;

            case -1:
                System.out.println(p1.getName() + " is younger than " + p2.getName());
                break;

            default:
                break;
        }

    }

}
