interface Sortable {
    int[] sort(int[] arr);

}

class BubbleSort implements Sortable {
    @Override
    public int[] sort(int[] arr) {
        int temp;

        for (int i = 0; i < arr.length; i++) {
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[i] > arr[j]) {
                    temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
                    
                }

            }

        }
        return arr;
    }

}

class SelectionSort implements Sortable {
    @Override
    public int[] sort(int[] arr) {

        for (int i = 0; i < arr.length; i++) {
            int minIndex = i;

            for (int j = i + 1; j < arr.length; j++) {
                if (arr[j] < arr[minIndex]) {
                    minIndex = j;

                }

            }
            int temp = arr[minIndex];
            arr[minIndex] = arr[i];
            arr[i] = temp;

        }
        return arr;

    }

}

public class Q3_Sorting {

    public static void main(String[] args) {
        BubbleSort obj1 = new BubbleSort();
        SelectionSort obj2 = new SelectionSort();

        int[] arr = new int[] { 5, 4, 2, 3, 1, 6, 2, 0 };

        int[] bSorted = new int[arr.length];
        bSorted = obj1.sort(arr);
        for (int i = 0; i < bSorted.length; i++) {
            System.out.print(bSorted[i]);
        }
        System.out.println();

        int[] sSorted = new int[arr.length];
        sSorted = obj2.sort(arr);
        for (int i = 0; i < sSorted.length; i++) {
            System.out.print(sSorted[i]);
        }
        System.out.println();

    }

}
