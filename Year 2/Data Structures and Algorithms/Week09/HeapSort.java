import java.util.*;

// MARK: Heap Sort Class
public class HeapSort {
    // MARK: heapSort()
    static void heapSort(String[] s) {
        buildHeap(s);
        for (int i = s.length - 1; i >= 0; i--) {
            String temp = s[0];
            s[0] = s[i];
            s[i] = temp;

            heapify(s, i, 0);
            display("Iteration " + i, s);
        }
    }

    // MARK: buildHeap()
    static void buildHeap(String[] s) {
        for (int i = (s.length / 2) - 1; i >= 0; i--) {
            heapify(s, s.length, i);
        }
    }

    // MARK: heapify()
    static void heapify(String[] s, int size, int subtreeRoot) {
        int largest = subtreeRoot;
        int left = 2 * subtreeRoot + 1;
        int right = 2 * subtreeRoot + 2;

        if (left < size && isLarger(s[left], s[largest])) {
            largest = left;
        }
        if (right < size && isLarger(s[right], s[largest])) {
            largest = right;
        }
        if (largest != subtreeRoot) {
            String temp = s[subtreeRoot];
            s[subtreeRoot] = s[largest];
            s[largest] = temp;
            heapify(s, size, largest);
        }
    }

    static boolean isLarger(String s1, String s2) {
        return s1.compareTo(s2) > 0;
    }

    // MARK: display()
    static void display(String header, String[] s) {
        int longestString = 0;
        for (String temp : s) {
            if (temp.length() > longestString) {
                longestString = temp.length();
            }
        }
        String headerFormat = Ansi.FG_BRIGHT_GREEN + "%15s:" + Ansi.RESET;
        String format = " %" + -longestString + "s ";
        System.out.printf(headerFormat + Ansi.FG_CYAN + " [" + Ansi.RESET, header);
        if (s.length < 1) {
            System.out.println(Ansi.FG_CYAN + "]" + Ansi.RESET);
            return;
        }
        for (int i = 0; i < s.length - 1; i++) {
            System.out.printf(format + Ansi.FG_YELLOW + "|" + Ansi.RESET, s[i]);
        }
        System.out.printf(format + Ansi.FG_CYAN + "]" + Ansi.RESET + "\n", s[s.length - 1]);
    }

    // MARK: main()
    public static void main(String[] args) {
        Scanner joe = new Scanner(System.in);

        System.out.print("\nPlease enter the number of elements in the array:\n" + Ansi.FG_GREEN + "   => " + Ansi.RESET);
        try {
            int size = Integer.parseInt(joe.nextLine());

            String[] sArr = new String[size];

            System.out.println("\nPlease enter the Strings:");
            for (int i = 0; i < size; i++) {
                System.out.print(Ansi.FG_GREEN + "String " + (i + 1) + ": " + Ansi.RESET);
                sArr[i] = joe.nextLine();
            }

            System.out.println();
            display("Original Array", sArr);

            buildHeap(sArr);
            display("Max Heap", sArr);

            heapSort(sArr);
            display("Sorted Array", sArr);
        } catch (Exception e) {
            System.out.println(Ansi.FG_RED + "Invalid input" + Ansi.RESET);
        }

        joe.close();
    }
}
