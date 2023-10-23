import java.util.*;

class Books {
    private long isbn;
    private String name, author, publisher;
    private int edition, status;

    public Books(long isbn, String name, String author, String publisher, int edition, int status) {
        this.isbn = isbn;
        this.name = name;
        this.author = author;
        this.publisher = publisher;
        this.edition = edition;
        this.status = status;

    }

    public void checkStatus(LinkedList<Books> bookList, LinkedList<Long> isbnList, Long search) {
        int flag = 0;

        for (Books temp : bookList) {
            if (search == temp.isbn) {
                if (temp.status == 0) {
                    flag = 1;

                }

                else if (temp.status == 1) {
                    flag = 2;

                }

                else if (temp.status == 2) {
                    flag = 3;

                }

                break;

            }

            else if (isbnList.contains(search)) {
                continue;

            }

            else {
                System.out.println("\nBook Does not exist or Invalid ISBN");
                break;
            }

        }

        if (flag == 1) {
            System.out.println("The Book is Available");

        }

        else if (flag == 2) {
            System.out.println("The Book is Issued");

        }

        else if (flag == 3) {
            System.out.println("The Book is Reserved");

        }

    }

    public void changeStatus(LinkedList<Books> bookList, LinkedList<Long> isbnList, Long search) {
        @SuppressWarnings("resource") // to ignore the resource leak warning
        Scanner joe = new Scanner(System.in);

        for (Books book : bookList) {
            if (search == book.isbn) {
                System.out.println("Status: \n\t1. Available \n\t2. Issued \n\t3. Reserved");
                System.out.println("Please enter the updated Status: ");
                int input = joe.nextInt();
                int statusUpdate = input - 1;

                if (statusUpdate < 3) {
                    int temp = book.status;
                    book.status = statusUpdate;

                    if (temp == 0 && statusUpdate == 1) {
                        System.out.println("\nThe Status has been updated from Available to Issued");

                    }

                    else if (temp == 0 && statusUpdate == 2) {
                        System.out.println("\nThe Status has been updated from Available to Reserved");

                    }

                    else if (temp == 1 && statusUpdate == 0) {
                        System.out.println("\nThe Status has been updated from Issued to Available");

                    }

                    else if (temp == 1 && statusUpdate == 2) {
                        System.out.println("\nThe Status has been updated from Issued to Reserved");

                    }

                    else if (temp == 2 && statusUpdate == 0) {
                        System.out.println("\nThe Status has been updated from Reserved to Available");

                    }

                    else if (temp == 2 && statusUpdate == 1) {
                        System.out.println("\nThe Status has been updated from Reserved to Issued");

                    }

                    else {
                        System.out.println("\nThe status has not been updated");

                    }

                }

                else {
                    System.out.println("\nInvalid Input");

                }

                break;

            }

            else if (isbnList.contains(search)) {
                continue;

            }

            else {
                System.out.println("\nBook Does not Exist or invalid ISBN ");
                break;

            }

        }

    }

    public void display(LinkedList<Books> bookList, LinkedList<Long> isbnList) {
        int index = 1;
        for (Books book : bookList) {
            System.out.println("\nThe Details of Book " + index + ": ");
            System.out.println("  Title\t\t: \t" + book.name);
            System.out.println("  ISBN\t\t: \t" + book.isbn);
            System.out.println("  Author\t: \t" + book.author);
            System.out.println("  Publisher\t: \t" + book.publisher);
            System.out.println("  Edition\t: \t" + book.edition);
            System.out.print("  ");
            book.checkStatus(bookList, isbnList, book.isbn);

            index++;

        }

    }

}

public class Q2_LibraryTester {
    public static void main(String[] args) {
        @SuppressWarnings("resource") // to ignore the resource leak warning

        Scanner joe = new Scanner(System.in);
        LinkedList<Books> bookList = new LinkedList<>();
        LinkedList<Long> isbnList = new LinkedList<>();

        while (true) {

            System.out.println("\nOptions: " +
                    "\n\t1. Add Book" +
                    "\n\t2. View Books" +
                    "\n\t3. Check Status of Book" +
                    "\n\t4. Change Status of Book" +
                    "\n\t5. Quit");
            System.out.print("Please enter the Option: ");
            int option = joe.nextInt();
            Books book = new Books(0, null, null, null, 0, 0);

            if (option == 1) {
                System.out.print("\nPlease enter the number of books: ");
                int numBooks = joe.nextInt();

                for (int i = 0; i < numBooks; i++) {
                    System.out.println("\nPlease enter the details of the book " + (i + 1) + " : ");
                    joe.nextLine();
                    System.out.print("  Title of Book\t:\t ");
                    String name = joe.nextLine();

                    System.out.print("  ISBN\t\t:\t ");
                    Long isbn = joe.nextLong();

                    joe.nextLine();
                    System.out.print("  Author\t:\t ");
                    String author = joe.nextLine();

                    System.out.print("  Publisher\t:\t ");
                    String publisher = joe.nextLine();

                    System.out.print("  Edition\t:\t ");
                    int edition = joe.nextInt();

                    book = new Books(isbn, name, author, publisher, edition, 0);
                    bookList.add(book);
                    isbnList.add(isbn);

                }

            }

            else if (option == 2) {
                book.display(bookList, isbnList);

            }

            else if (option == 3) {
                System.out.print("Please enter the ISBN of the book to search for: ");
                Long search = joe.nextLong();

                System.out.println();

                book.checkStatus(bookList, isbnList, search);

            }

            else if (option == 4) {
                System.out.print("Please enter the ISBN of the book to search for: ");
                Long search = joe.nextLong();

                book.changeStatus(bookList, isbnList, search);

            }

            else if (option == 5) {
                break;

            }

            else {
                System.out.println("Invalid Input");

            }

        }

    }

}
