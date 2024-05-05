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
                "C:\\Users\\joecn\\Documents\\GitHub\\uni-codes\\Year 2\\Data Structures and Algorithms\\Week05\\studentin.txt");
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
        StudentInfo[] temp = new StudentInfo[10];
        for (int i = 0; i < temp.length; i++) {
            splitBuffer = buffer[i].split(" ", 4);
            temp[i] = new StudentInfo(splitBuffer[1], splitBuffer[0], Integer.parseInt(splitBuffer[2]),
                    Float.parseFloat(splitBuffer[3]));
        }
        return temp;
    }
}

// MARK: Class for Merge Sort
public class MergeSort {
    // MARK: sort()
    public static void sort(StudentInfo[] arr, int l, int h) {
        if (l < h) {
            int mid = (h + l - 1) / 2;
            sort(arr, l, mid);
            sort(arr, mid + 1, h);
            merge(arr, l, mid, h);
        }
    }

    // MARK: merge()
    static void merge(StudentInfo[] arr, int l, int m, int h) {
        int countIndex = 0;
        int left = l;
        int right = m + 1;
        int size = h - l + 1;
        StudentInfo[] auxArr = new StudentInfo[size];

        while (left <= m && right <= h) {
            if (arr[left].getName().compareTo(arr[right].getName()) <= 0) {
                auxArr[countIndex] = arr[left];
                left++;
            } else {
                auxArr[countIndex] = arr[right];
                right++;
            }
            countIndex++;
        }

        while (right <= h) {
            auxArr[countIndex] = arr[right];
            right++;
            countIndex++;
        }

        while (left <= m) {
            auxArr[countIndex] = arr[left];
            left++;
            countIndex++;
        }

        for (int i = 0; i < size; i++)
            arr[i + l] = auxArr[i];

        System.out.print("    ");
        // Displaying each iteration
        for (int i = 0; i < arr.length; i++)
            System.out.print(arr[i].getName() + " ");
        System.out.println();
    }

    // MARK: display()
    public static void display(StudentInfo[] stu) {
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
            System.out.printf(indexFormat + idFormat + div + nameFormat + div + yearFormat + div + cgpaFormat + "\n",
                    index,
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