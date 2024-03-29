import java.util.*;
import java.io.File;

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
                System.out.println("[" + i + "] " + buffer[i]);
                i++;
            }
            System.out.println();

            fileReader.close();
        } catch (Exception e) {
            System.out.println("File Handling Error");
        }
    }

    StudentInfo[] split() {
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

public class MergeSort {
    public static void sort(StudentInfo[] arr, int l, int h) {
        if (l < h) {
            int mid = (h + l - 1) / 2;
            sort(arr, l, mid);
            sort(arr, mid + 1, h);
            merge(arr, l, mid, h);
        }
    }

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
        for (int i = 0; i < arr.length; i++)
            System.out.print(arr[i].getName() + " ");
        System.out.println();
    }

    public static void main(String[] args) {
        FileHandle file = new FileHandle();
        StudentInfo[] stu = new StudentInfo[file.count];
        stu = file.split();
        sort(stu, 0, stu.length - 1);
        int i = 0;

        System.out.println();
        for (StudentInfo inf : stu) {
            System.out.printf("[%d] %s %s %d %.2f\n", i, inf.getId(), inf.getName(), inf.getYear(), inf.getCgpa());
            i++;
        }
    }
}