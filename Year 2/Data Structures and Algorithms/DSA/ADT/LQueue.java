package ADT;

import java.util.*;

// MARK: Queue
@SuppressWarnings("unchecked") // 🤡
public final class LQueue<T> {
    final T[] info;
    final int maxSize;
    int front = 0; // inclusive
    int rear = 0; // exclusive

    public LQueue(int maxSize) {
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

    // MARK: Queue: isEmpty()
    public boolean isEmpty() {
        return (front == rear);
    }

    // MARK: Queue: isFull()
    public boolean isFull() {
        return (rear == maxSize);
    }

    // MARK: Queue: size()
    public int size() {
        return (rear - front);
    }

    // MARK: Queue: enqueue()
    public void enqueue(T elem) {
        // Overflow Condition
        if (isFull()) {
            System.out.println(Ansi.FG_BRIGHT_RED + "Queue is Full" + Ansi.RESET);
            return;
        }
        info[rear] = elem;
        rear++;
    }

    // MARK: Queue: peek()
    public T peek() {
        if (!isEmpty()) {
            return info[front];
        }
        return null;
    }

    // MARK: Queue: dequeue()
    public T dequeue() {
        // Underflow Condition
        if (isEmpty()) {
            System.out.println(Ansi.FG_BRIGHT_RED + "Queue is Empty" + Ansi.RESET);
            return null;
        }
        T temp = this.info[front];
        front++;
        if (isEmpty()) {
            // reset front and rear back to 0, so that we start with a
            // fresh empty queue with full capacity
            rear = 0;
            front = 0;
        }
        return temp;
    }

    // MARK: Queue: printQueue()
    public void printQueue() {
        // for displaying front and rear of queue
        int maxDigits = String.valueOf(maxSize).length();
        System.out.printf(
                Ansi.FG_BRIGHT_CYAN + "[" + Ansi.FG_BRIGHT_YELLOW + "front = %" + ((maxDigits >= 2) ? maxDigits : 2)
                        + "s " + Ansi.FG_BRIGHT_CYAN + " | " + Ansi.FG_BRIGHT_YELLOW
                        + "rear  = %" + ((maxDigits >= 2) ? maxDigits : 2)
                        + "s"
                        + Ansi.FG_BRIGHT_CYAN + "] "
                        + Ansi.RESET,
                String.valueOf(front), String.valueOf(rear));
        System.out.print(Ansi.FG_BRIGHT_GREEN + "[" + Ansi.RESET);

        // displaying elements
        String separator = Ansi.FG_YELLOW + ", " + Ansi.RESET;
        for (int i = front; i < rear - 1; i++) {
            System.out.print(info[i] + separator);
        }
        if (rear <= 0) {
            System.out.println(Ansi.FG_BRIGHT_GREEN + "]" + Ansi.RESET);
        } else {
            System.out.println(info[rear - 1] + Ansi.FG_BRIGHT_GREEN + "]" + Ansi.RESET);
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
