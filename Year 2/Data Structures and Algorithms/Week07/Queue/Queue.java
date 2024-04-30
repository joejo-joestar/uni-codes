// MARK: Linked List
class Node {
    int info;
    Node next;

    Node(int info) {
        this.info = info;
    }
}

public class Queue {
    Node front, rear;

    boolean isEmpty() {
        return (front == null);
    }
    // MARK: Enqueue Operation
    void enqueue(int info) {
        System.out.println("Enqueueing "+ info);
        Node temp = new Node(info);
        if (isEmpty()) {
            front = rear = temp;
            return;
        }
        rear.next = temp;
        rear = rear.next;
    }

    // MARK: Dequeue Operation
    String dequeue() {
        // underflow condition
        if (isEmpty()) {
            return "underflow condition";
        }

        int temp = front.info;
        front = front.next;
        return "dequeueing " + temp;
    }

// MARK: Main Method
    public static void main(String[] args) {
        Queue q = new Queue();

        q.enqueue(4);

        System.out.println(q.dequeue());

        q.enqueue(5);
        q.enqueue(7);
        q.enqueue(8);

        System.out.println(q.dequeue());

        q.enqueue(6);

        System.out.println(q.dequeue());

        q.enqueue(1);

        System.out.println(q.dequeue());
        System.out.println(q.dequeue());
        System.out.println(q.dequeue());
        System.out.println(q.dequeue()); // Should return '-1' since underflow
        System.out.println(q.dequeue()); // Should return '-1' since underflow
    }
}
