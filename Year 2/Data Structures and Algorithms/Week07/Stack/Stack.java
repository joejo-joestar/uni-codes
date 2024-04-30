// MARK: Linked List
class Node {
    int info;
    Node next;

    Node(int info) {
        this.info = info;
    }
}

public class Stack {
    Node top;

    boolean isEmpty() {
        return (top == null);
    }

    // MARK: PUSH Operation
    void push(int info) {
        System.out.println("Pushed " + info);
        Node temp = new Node(info);
        temp.next = top;
        top = temp;
    }

    // MARK: POP Operation
    String pop() {
        if (isEmpty()) {
            return "underflow condition";
        }
        int temp = top.info;
        top = top.next;
        return "popping " + temp;
    }

    // MARK: Main Method
    public static void main(String[] args) {
        Stack s = new Stack();
        s.push(4);

        System.out.println(s.pop());

        s.push(5);
        s.push(7);
        s.push(8);

        System.out.println(s.pop());

        s.push(6);

        System.out.println(s.pop());

        s.push(1);

        System.out.println(s.pop());
        System.out.println(s.pop());
        System.out.println(s.pop());
        System.out.println(s.pop()); // Should return '-1' since underflow
        System.out.println(s.pop()); // Should return '-1' since underflow
    }
}
