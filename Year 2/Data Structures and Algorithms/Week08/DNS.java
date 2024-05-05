import java.util.*;

// MARK: Global Vars
class GV {
    public static int SIZE_OF_BUCKET = 17;
    public static long A = 33; // 🤡 // Given in qn
}

// MARK: Linked List
class Node {
    private String hostname;
    private String ipAddress;
    Node next;

    public Node(String hostname, String ipAddress) {
        this.hostname = hostname;
        this.ipAddress = ipAddress;
    }

    public String getHostname() {
        return hostname;
    }

    public String getIpAddress() {
        return ipAddress;
    }
}

// MARK: Separate Chaining Class (For Hashing)
class SeparateChaining {
    Node[] bucket;
    int n;
    long a;

    // separate chaining logic
    SeparateChaining(int n, long a) {
        this.n = n;
        this.a = a;
        bucket = new Node[n];
    }

    // hashing happens here
    private long hashFunction(String str) {
        long hashCode = 0;
        // long a = GV.A; // given in qn

        for (int i = 0; i < str.length(); i++) {
            hashCode += str.codePointAt(i) * Math.pow(a, i);
        }
        return hashCode;
    }

    // hash compression happens here
    private int hashCompress(long hashCode) {
        return (int) (hashCode % (long) GV.SIZE_OF_BUCKET);
    }

    // MARK: Insert
    // Method to insert through all records
    public void insert(String hostname, String ipAddress) {
        Node newNode = new Node(hostname, ipAddress);
        long hashCode = hashFunction(hostname);
        int index = hashCompress(hashCode);

        Node currentNode = bucket[index];
        if (currentNode == null) {
            bucket[index] = newNode;
            System.out.println(Ansi.FG_BRIGHT_GREEN + "  DNS insertion successful" + Ansi.RESET);
            return;
        }
        while (currentNode != null && currentNode.next != null) {
            currentNode = currentNode.next;
        }
        currentNode.next = newNode;
        System.out.println(Ansi.FG_BRIGHT_GREEN + "  DNS insertion successful" + Ansi.RESET);
    }

    // MARK: Find
    // Method to search through all records
    public void find(String hostname) {
        long hashCode = hashFunction(hostname);
        int index = hashCompress(hashCode);

        Node currentNode = bucket[index];
        while (currentNode != null && !currentNode.getHostname().equals(hostname)) {
            currentNode = currentNode.next;
        }
        if (currentNode == null) {
            System.out.println(Ansi.FG_RED + "Host Name not Found!" + Ansi.RESET);
            return;
        }
        System.out.printf(
                "The hostname " + Ansi.FG_BRIGHT_CYAN + "[" + Ansi.FG_BRIGHT_GREEN + "%s" + Ansi.FG_BRIGHT_CYAN + "]"
                        + Ansi.RESET
                        + " is present in the hash table.\nThe IP Address is " + Ansi.FG_BRIGHT_CYAN + "["
                        + Ansi.FG_BRIGHT_GREEN + "%s" + Ansi.FG_BRIGHT_CYAN + "]\n"
                        + Ansi.RESET,
                currentNode.getHostname(), currentNode.getIpAddress());
    }

    // MARK: Display
    // Method to display all records
    public void display() {
        int longestName = 0;
        for (int i = 0; i < bucket.length; i++) {
            Node cursor = bucket[i];
            while (cursor != null) {
                if (cursor.getHostname().length() > longestName) {
                    longestName = cursor.getHostname().length();
                }
                cursor = cursor.next;
            }
        }
        String formatName = "%" + longestName + "s";
        for (int i = 0; i < bucket.length; i++) {
            System.out.printf(Ansi.FG_BLUE + "Index [%d]:\n" + Ansi.RESET, i);
            Node cursor = bucket[i];
            while (cursor != null) {
                System.out.printf(formatName + Ansi.FG_YELLOW + " | " + Ansi.RESET + "%s" + "\n", cursor.getHostname(),
                        cursor.getIpAddress());
                cursor = cursor.next;
            }
            System.out.println();
        }
    }
}

// MARK: Main Class
public class DNS {
    public static void main(String[] args) {
        SeparateChaining hashTable = new SeparateChaining(GV.SIZE_OF_BUCKET, GV.A);
        Scanner joe = new Scanner(System.in);
        int option = 0;
        while (true) {
            System.out.println("\n" + Ansi.FG_GREEN + "Please choose an option:" + "\n"
                    + "\t" + Ansi.FG_YELLOW + "[1]" + Ansi.RESET + " Insert hostname with IP\n"
                    + "\t" + Ansi.FG_YELLOW + "[2]" + Ansi.RESET + " Find hostname\n"
                    + "\t" + Ansi.FG_YELLOW + "[3]" + Ansi.RESET + " Display\n"
                    + "\t" + Ansi.FG_YELLOW + "[4]" + Ansi.RESET + " Exit");
            System.out.print(Ansi.FG_GREEN + "  => " + Ansi.RESET);
            try {
                option = Integer.parseInt(joe.nextLine());
            } catch (Exception e) {
                System.out.println(Ansi.FG_RED + "\n  Invalid Input!\n" + Ansi.RESET);
                break;
            }

            // 1. Insert
            if (option == 1) {
                System.out.println(Ansi.FG_GREEN + "\nPlease enter a Hostname to insert:");
                System.out.print("  => " + Ansi.RESET);
                String hostname = joe.nextLine();
                System.out.println(Ansi.FG_GREEN + "Please enter a IP Address to insert:");
                System.out.print("  => " + Ansi.RESET);
                String ipAddress = joe.nextLine();
                hashTable.insert(hostname, ipAddress);
            }

            // 2. Find
            else if (option == 2) {
                System.out.println(Ansi.FG_GREEN + "\nPlease enter a Hostname to Search:");
                System.out.print("  => " + Ansi.RESET);
                String hostname = joe.nextLine();
                hashTable.find(hostname);
            }

            // 3. Display
            else if (option == 3) {
                System.out.println(Ansi.FG_BRIGHT_GREEN + "\nDisplaying Entire Hash Table:\n" + Ansi.RESET);
                hashTable.display();
            }

            // 4. Exit
            else if (option == 4) {
                System.out.println(Ansi.FG_YELLOW + "\nvro aah\n" + Ansi.RESET);
                break;
            }

            // nand gate condition
            else {
                System.out.println(Ansi.FG_RED + "\n  Please enter a valid option!\n" + Ansi.RESET);
            }
        }
        joe.close();
    }
}
