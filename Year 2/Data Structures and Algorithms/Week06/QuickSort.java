import java.util.*;
import java.io.File;

final class GV {
    public final static int MILLIS = 1000000; // Only used to convert ns to ms
}

// MARK: Student Info
class StudentInfo {
    private String name;
    private String id;
    private int year;
    private float cgpa;

    public StudentInfo(String name, String id, int year, float cgpa) {
        this.name = name;
        this.id = id;
        this.year = year;
        this.cgpa = cgpa;
    }

    public String getName() {
        return name;
    }

    public String getId() {
        return id;
    }

    public int getYear() {
        return year;
    }

    public float getCgpa() {
        return cgpa;
    }
}

// MARK: Class for File Handle
class FileHandle {
    String[] buffer;
    int i = 0, count = 0;

    public FileHandle() {
        File inputFile = new File(
                "C:\\Users\\joecn\\Documents\\GitHub\\uni-codes\\Year 2\\Data Structures and Algorithms\\Week06\\studentin.txt");
        // File inputFile = new File("studentin.txt");
        try {
            Scanner fileReader = new Scanner(inputFile);
            while (fileReader.hasNextLine()) {
                fileReader.nextLine();
                count++;
            }
            buffer = new String[count];

            fileReader.close();
            fileReader = null;
            fileReader = new Scanner(inputFile);

            System.out.println();
            while (fileReader.hasNextLine()) {
                buffer[i] = fileReader.nextLine();
                i++;
            }
            System.out.println();

            fileReader.close();
        } catch (Exception e) {
            System.out.println(Ansi.FG_RED + "File Handling Error" + Ansi.RESET);
        }
    }

    // Method to split Lines into values of student class
    StudentInfo[] splitLines() {
        String[] splitBuffer = new String[4];
        StudentInfo[] temp = new StudentInfo[count];
        for (int i = 0; i < temp.length; i++) {
            splitBuffer = buffer[i].split(" ", 4);
            temp[i] = new StudentInfo(splitBuffer[1], splitBuffer[0], Integer.parseInt(splitBuffer[2]),
                    Float.parseFloat(splitBuffer[3]));
        }
        return temp;
    }
}

// MARK: Quick Sort Class
public class QuickSort {
    // MARK: sort()
    public static void sort(StudentInfo[] arr, int l, int h) {
        if (l < h) {
            int pivot = partition(arr, l, h);
            sort(arr, l, pivot - 1);
            sort(arr, pivot + 1, h);

            System.out.print("    ");
            for (int i = 0; i < arr.length; i++)
                System.out.print(arr[i].getName() + " ");
            System.out.println();
        }
    }

    // MARK: swap()
    static void swap(StudentInfo[] arr, int a, int b) {
        StudentInfo temp = arr[a];
        arr[a] = arr[b];
        arr[b] = temp;
    }

    // MARK: partition()
    static int partition(StudentInfo[] arr, int l, int h) {
        int pivot = l;
        int left = l + 1;
        int right = h;

        while (left <= right) {
            while (left <= h && arr[left].getName().compareTo(arr[pivot].getName()) >= 0) {
                left = left + 1;
            }
            while (l <= right && arr[right].getName().compareTo(arr[pivot].getName()) < 0) {
                right = right - 1;
            }
            if (left < right) {
                swap(arr, left, right);
            }
            left = left + 1;

        }
        swap(arr, right, pivot);

        return right;
    }

    // MARK: display()
    public static void display(StudentInfo[] stu){
        int index = 0;
        System.out.println();
        String indexFormat = Ansi.FG_CYAN + "[" + Ansi.FG_YELLOW + "%2d" + Ansi.FG_CYAN + "]"
                + Ansi.RESET;
        int longestName = 0, longestID = 0;
        for (StudentInfo temp : stu) {
            if (temp.getName().length() > longestName) {
                longestName = temp.getName().length();
            }
            if (temp.getId().length() > longestID) {
                longestID = temp.getName().length();
            }
        }
        String nameFormat = "%" + -longestName + "s";
        String idFormat = " %" + longestID + "s";
        String yearFormat = "%4d";
        String cgpaFormat = "%.2f";
        String div = Ansi.FG_YELLOW + " | " + Ansi.RESET;
        for (StudentInfo inf : stu) {
            System.out.printf(indexFormat + idFormat + div + nameFormat + div + yearFormat + div + cgpaFormat + "\n", index,
                    inf.getId(),
                    inf.getName(), inf.getYear(), inf.getCgpa());
            index++;
        }
    }

    // MARK: main()
    public static void main(String[] args) {
        FileHandle file = new FileHandle();
        StudentInfo[] stu = new StudentInfo[file.count];
        stu = file.splitLines();
        display(stu);
        long startTime = System.nanoTime();
        sort(stu, 0, stu.length - 1);
        long endTime = System.nanoTime();
        display(stu);

        float timeTaken = (float) (endTime - startTime) / GV.MILLIS;
        System.out.println(Ansi.FG_BRIGHT_GREEN + "\nTime Taken: " + Ansi.FG_CYAN + "[" + Ansi.FG_YELLOW + timeTaken
                + Ansi.FG_CYAN + "]" + Ansi.FG_BRIGHT_GREEN + "ms" + Ansi.RESET);
    }
}