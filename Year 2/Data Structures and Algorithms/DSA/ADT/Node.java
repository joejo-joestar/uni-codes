package ADT;

// MARK: Node
public final class Node<T> {
    Node<T> previous = null;
    final T info;
    Node<T> next = null;

    Node(T info) {
        this.info = info;
    }

    Node(T info, Node<T> next) {
        this.info = info;
        this.next = next;
    }

    Node(T info, Node<T> next, Node<T> previous) {
        this.previous = previous;
        this.info = info;
        this.next = next;
    }
}
