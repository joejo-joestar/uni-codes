class Person {
    private String name;
    private String address;

    public Person(String name, String address) {
        this.name = name;
        this.address = address;

    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String toString() {
        return "Person " + "[Name: " + getName() + ", " + "Address: " + getAddress() + "]";
    }

}

class Student extends Person {
    private String program;
    private int year;
    private double fees;

    public Student(String name, String address, String program, int year, double fees) {
        super(name, address);
        this.program = program;
        this.year = year;
        this.fees = fees;

    }

    public String getProgram() {
        return program;

    }

    public void setProgram(String program) {
        this.program = program;

    }

    public int getYear() {
        return year;

    }

    public void setYear(int year) {
        this.year = year;

    }

    public double getFees() {
        return fees;

    }

    public void setFees(double fees) {
        this.fees = fees;

    }

    public String toString() {
        return "Student " + "[" + super.toString() + ", " + "Program: " + getProgram() + ", " + "Year: " + getYear()
                + ", " + "Fees: " + getFees() + "]";

    }

}

class Staff extends Person {
    private String school;
    private double pay;

    public Staff(String name, String address, String school, double pay) {
        super(name, address);
        this.school = school;
        this.pay = pay;

    }

    public String getSchool() {
        return school;

    }

    public void setSchool(String school) {
        this.school = school;

    }

    public double getPay() {
        return pay;

    }

    public void setPay(double pay) {
        this.pay = pay;

    }

    public String toString() {
        return "Staff " + "[" + super.toString() + ", " + "School: " + getSchool() + ", " + "Pay: " + getPay() + "]";
    }

}

public class Q1_PersonTester {

    public static void main(String[] args) {

        Person p1 = new Person("Joe", "Shj");

        Person p2 = new Staff("Jo", "Dxb", "test", 100.92);

        Person p3 = new Student("Jo", "Ajm", "CSE", 2, 45000);

        System.out.println(p1.toString());
        System.out.println(p2.toString());
        System.out.println(p3.toString());

    }

}
