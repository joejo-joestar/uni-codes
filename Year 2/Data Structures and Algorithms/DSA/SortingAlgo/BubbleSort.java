package SortingAlgo;

@SuppressWarnings("unchecked") // 🤡
public class BubbleSort<T extends Comparable> {
    T[] array;

    public BubbleSort(T[] array) {
        this.array = array;
    }

    public T[] sortAscending() {
        T[] sortedArray;
        for (int i = 0; i < (array.length - 1); i++) {
            for (int j = 0; j < (array.length - i - 1); j++) {
                if (array[j].compareTo(array[j + 1]) > 0) {
                    T temp = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = temp;
                }
            }
            printArray();
        }
        sortedArray = array;
        return sortedArray;
    }

    public T[] sortDescending() {
        T[] sortedArray;
        for (int i = 0; i < (array.length - 1); i++) {
            for (int j = 0; j < (array.length - i - 1); j++) {
                if (array[j].compareTo(array[j + 1]) < 0) {
                    T temp = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = temp;
                }
            }
            printArray();
        }
        sortedArray = array;
        return sortedArray;
    }

    public void printArray() {
        System.out.print("[");
        for (int i = 0; i < array.length - 1; i++) {
            System.out.print(array[i] + ", ");
        }
        System.out.println(array[array.length - 1] + "]");

    }
}
