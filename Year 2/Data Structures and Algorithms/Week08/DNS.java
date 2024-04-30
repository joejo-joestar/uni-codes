import java.util.*;

// MARK: Global Vars
class GV {
    public static int SIZE_OF_BUCKET = 17;
    public static long A = 33;
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
        return (int)(hashCode % (long)GV.SIZE_OF_BUCKET);
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
            System.out.println("DNS insertion successful");
            return;
        }
        while (currentNode != null && currentNode.next != null) {
            currentNode = currentNode.next;
        }
        currentNode.next = newNode;
        System.out.println("DNS insertion successful");
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
            System.out.println("Host Name not Found!");
            return;
        }
        System.out.printf(" The hostname %s is present in the hash table\n The IP Address is %s\n",
                currentNode.getHostname(), currentNode.getIpAddress());
    }

    // MARK: Display
    // Method to display all records
    public void display() {
        for (int i = 0; i < bucket.length; i++) {
            System.out.printf("Index [%d]:\n", i);
            Node cursor = bucket[i];
            while (cursor != null) {
                System.out.printf("  %s | %s\n", cursor.getHostname(), cursor.getIpAddress());
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
            System.out.println(
                    "\nPlease Choose and Option:\n\t1. Insert hostname with IP\n\t2. Find hostname\n\t3. Display\n\t4. Exit");
            System.out.print("  => ");
            try {
                option = Integer.parseInt(joe.nextLine());
            } catch (Exception e) {
                System.out.println("\nInvalid Input!\n");
                break;
            }

            // gate condition
            if (option > 4 || option < 1) {
                System.out.println("\nPlease enter a valid option!\n");

            }

            // 1. Insert
            else if (option == 1) {
                System.out.println("\nPlease enter a Hostname to Insert:");
                System.out.print("  => ");
                String hostname = joe.nextLine();
                System.out.println("Please enter a IP Address to Insert:");
                System.out.print("  => ");
                String ipAddress = joe.nextLine();
                hashTable.insert(hostname, ipAddress);
            }

            // 2. Find
            else if (option == 2) {
                System.out.println("\nPlease enter a hostname to search:");
                System.out.print("  => ");
                String hostname = joe.nextLine();
                hashTable.find(hostname);
            }

            // 3. Display
            else if (option == 3) {
                System.out.println("\nDisplaying Entire Hash Table:\n");
                hashTable.display();
            }

            // 4. Exit
            else if (option == 4) {
                System.out.println("\nBye!\n");
                break;
            }
        }

        joe.close();

    }

}
