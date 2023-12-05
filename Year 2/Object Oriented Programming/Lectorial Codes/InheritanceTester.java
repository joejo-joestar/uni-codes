class Person implements Comparable<Person> {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;

    }

    public String getName() {
        return name;

    }

    @Override
    public int compareTo(Person o) {
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
        Person p2 = new Person("stell", 20);
        Person p1 = new Person("Joe", 20);

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
