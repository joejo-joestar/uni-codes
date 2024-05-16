package ADT;

import java.util.*;

// MARK: Circular Queue
@SuppressWarnings("unchecked") // 🤡
public final class CQueue<T> {
    final T[] info;
    int front = 0; // inclusive
    int rear = 0; // exclusive
    final int maxSize;

    public CQueue(int maxSize) {
        this.maxSize = maxSize;

        // creating an array of a generic is not allowed
        // so we first create an ArrayList of the generic
        // and then convert it to a regular primitive array.
        ArrayList<T> temp = new ArrayList<T>(maxSize);
        for (int i = 0; i < maxSize; i++) {
            temp.add(null);
        }
        info = (T[]) temp.toArray();
    }

    // MARK: isEmpty()
    public boolean isEmpty() {
        return (front == rear);
    }

    // MARK: size()
    public int size() {
        if (!isEmpty()) {
            return ((maxSize - front + rear) % maxSize);
        }
        return 0;
    }

    // MARK: isFull()
    public boolean isFull() {
        return (size() == maxSize);
    }

    // MARK: enqueue()
    public void enqueue(T elem) {
        // Overflow Condition
        if (isFull()) {
            System.out.println(Ansi.FG_BRIGHT_RED + "Circular Queue is Full" + Ansi.RESET);
            return;
        } else {
            info[rear] = elem;
            rear = (rear + 1) % maxSize;
        }
    }

    // MARK: peek()
    public T peek() {
        if (!isEmpty()) {
            return info[front];
        }
        return null;
    }

    // MARK: dequeue()
    public T dequeue() {
        T temp = null;
        // Underflow Condition
        if (isEmpty()) {
            System.out.println(Ansi.FG_BRIGHT_RED + "Circular Queue is Empty" + Ansi.RESET);
        } else {
            temp = this.info[front];
            front = (front + 1) % maxSize;
        }
        return temp;
    }

    // TODO: finish printing
    // MARK: printQueue()
    public void printQueue() {
        // for displaying front and rear of queue
        int maxDigits = String.valueOf(maxSize).length();
        System.out.printf(
                Ansi.FG_BRIGHT_CYAN + "[" + Ansi.FG_BRIGHT_YELLOW + "front = %" + ((maxDigits >= 2) ? maxDigits : 2)
                        + "s "
                        + "rear  = %" + ((maxDigits >= 2) ? maxDigits : 2)
                        + "s"
                        + Ansi.FG_BRIGHT_CYAN + "] "
                        + Ansi.RESET,
                String.valueOf(front), String.valueOf(rear));
        System.out.print(Ansi.FG_BRIGHT_GREEN + "[" + Ansi.RESET);

        // displaying elements
        String separator = Ansi.FG_YELLOW + ", " + Ansi.RESET;
        for (int i = front; i < ((rear - 2 + maxSize) % maxSize); i = ((i + 1) % maxSize)) {
            System.out.print(info[i] + separator);
        }
        if (isEmpty()) {
            System.out.println(Ansi.FG_BRIGHT_GREEN + "]" + Ansi.RESET);
        } else {
            System.out.println(info[(rear - 1 + maxSize) % maxSize] + Ansi.FG_BRIGHT_GREEN + "]" + Ansi.RESET);
        }
    }

    // MARK: haha funni
    public void bint() {
        System.out.println("bogos binted!");
    }

    public void bint(String s) {
        System.out.println(s);
    }
}
