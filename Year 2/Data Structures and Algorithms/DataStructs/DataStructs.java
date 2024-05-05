package DataStructs;

class Node {
    Object info;
    Node next;

    Node(Object info) {
        this.info = info;
    }

    public void insert(Object info) {

    }

    public void insert(Object info, int index) {

    }
}

class Stack {
    Object info;
    int top;

    Stack(Object info) {
        this.info = info;
    }

    public boolean isEmpty() {
        if (top == -1) {
            return true;
        } else {
            return false;
        }
    }

    public void push(Object info) {

    }

    public Object pop() {
        if (isEmpty()) {
            return 0;
        }
        Object temp = top;
        top--;
        return temp;
    }

}

class Queue {

}
