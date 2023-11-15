import java.util.*;

class Society {
    String name;
    ArrayList<Member> memberList = new ArrayList<>();

    public void addMember(String name, String address) {
        Member member = new StandardMember(name, address);
        memberList.add(member);

    }

    public void addSeniorMember(String name, String address, int fee) {
        Member seniorMember = new SeniorMember(name, address, fee);
        memberList.add(seniorMember);

    }

    public int getFeeTotal() {
        int totalFee = 0;
        for (Member member : memberList) {
            totalFee += member.getFee();
        }
        return totalFee;
    }

}

abstract class Member {
    String name;
    String address;

    public Member(String name, String address) {
        this.name = name;
        this.address = address;

    }

    public String getName() {
        return name;

    }

    public String getAddress() {
        return address;

    }

    public abstract int getFee();

}

class StandardMember extends Member {
    StandardMember(String name, String address) {
        super(name, address);

    }

    public int getFee() {
        return 1000;

    }

}

class SeniorMember extends Member {
    int fee;

    public SeniorMember(String name, String address, int fee) {
        super(name, address);
        this.fee = fee;
    }

    public int getFee() {
        return fee;
    }

}

public class Q1_SocietyTester {
    public static void main(String[] args) {
        @SuppressWarnings("resource") // to ignore the resource leak warning
        Scanner joe = new Scanner(System.in);

        Society members = new Society();

        System.out.print("\nPlease enter the number of Standard Members: ");
        int numOfMembers = joe.nextInt();

        System.out.print("Please enter the number of Senior Members: ");
        int numOfSMembers = joe.nextInt();

        joe.nextLine();

        for (int i = 0; i < numOfMembers; i++) {
            System.out.print("\nPlease enter Name of the Standard Member: ");
            String name = joe.nextLine();

            System.out.print("Please enter the Address of the Standard Member: ");
            String address = joe.nextLine();

            members.addMember(name, address);

        }

        for (int i = 0; i < numOfSMembers; i++) {
            System.out.print("\nPlease enter Name of the Senior Member: ");
            String name = joe.nextLine();

            System.out.print("Please enter the Address of the Senior Member: ");
            String address = joe.nextLine();

            System.out.print("Please enter the Fee of the Senior Member: ");
            int fees = joe.nextInt();
            joe.nextLine();

            members.addSeniorMember(name, address, fees);

        }

        System.out.println("Total Fees is " + members.getFeeTotal());

    }

}
