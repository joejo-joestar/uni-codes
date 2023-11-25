import java.util.*;

class Book implements Comparable<Book> {
    private String name;
    private double cost;

    Book(String name, double cost) {
        this.name = name;
        this.cost = cost;
    }

    public String getName() {
        return name;
    }

    public double getCost() {
        return cost;
    }

    @Override
    public int compareTo(Book o) {
        if (this.name.equalsIgnoreCase(o.name)) {
            return 0;
        }

        else {
            return 1;
        }
    }
}

class GeneralizedSearch {
    static int index;

    public static boolean search(Book[] arr, Book item) {
        boolean flag = false;
        for (int i = 0; i < arr.length; i++) {
            if (item.compareTo(arr[i]) == 0) {
                index = i;
                flag = true;
                break;
            }

            else {
                flag = false;
            }
        }
        return flag;
    }

    public static void display(Book[] arr, Book item) {
        if (!search(arr, item)) {
            System.out.println("Sorry, Book Does not Exist");
            System.out.println();
        }

        else {
            System.out.println("Book Exists at Index " + index);
            System.out.println("  Name : " + arr[index].getName());
            System.out.println("  Cost : " + arr[index].getCost());
            System.out.println();
        }
    }
}

class Sort implements Comparator<Book> {

    public int compare(Book obj1, Book obj2) {
        if (obj1.getCost() > obj2.getCost()) {
            return 1;
        }

        else if (obj1.getCost() < obj2.getCost()) {
            return -1;
        }

        else {
            return 0;
        }
    }

    public static void sort(Book[] arr) {
        Book temp = arr[0];

        Sort sort = new Sort();

        for (int i = 0; i < arr.length; i++) {
            for (int j = i + 1; j < arr.length; j++) {
                if (sort.compare(arr[i], arr[j]) == -1) {
                    temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;

                }

                else if (sort.compare(arr[i], arr[j]) == 1) {
                    continue;
                }

                else {
                    continue;
                }
            }
        }
    }

    public static void display(Book[] arr) {

        for (Book book : arr) {
            System.out.println("Title : " + book.getName());
            System.out.println("Cost: " + book.getCost());
            System.out.println();
        }
    }
}

public class Q2_BookTester {

    public static void main(String[] args) {
        Book[] arr = new Book[5];
        arr[0] = new Book("Origins", 35.99);
        arr[1] = new Book("Hitchhiker's Guide to the Galaxy", 60.50);
        arr[2] = new Book("Things to Make and do in the 4th Dimension", 104.99);
        arr[3] = new Book("A Wrinkle in Time", 60.50);
        arr[4] = new Book("Wonder", 40);

        Book book1 = new Book("Test", 35.99);
        Book book2 = new Book("hitchhiker's guide to the galaxy", 60.50);
        Book book3 = new Book("origins", 30.99);

        GeneralizedSearch.display(arr, book1);
        GeneralizedSearch.display(arr, book2);
        GeneralizedSearch.display(arr, book3);

        Sort.sort(arr);
        Sort.display(arr);

    }
}
