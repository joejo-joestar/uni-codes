#include <stdio.h>
#include <stdlib.h>

#define LEN 100

FILE* inp;
int* arr;

void swap(int* a, int* b) {
  int temp = *a;
  *a = *b;
  *b = temp;
}

void bubbleSort() {
  for (int i = 1; i < LEN; i++)
    for (int j = 0; j < LEN - i; j++)
      if (arr[j] > arr[j + 1]) swap(&arr[j], &arr[j + 1]);
}

void selectionSort() {
  for (int i = 0; i < LEN - 1; i++)
    for (int j = i + 1; j < LEN; j++)
      if (arr[i] > arr[j]) swap(&arr[i], &arr[j]);
}

void insertionSort() {
  int key;
  int j = 0;
  for (int i = 1; i < LEN; i++) {
    key = arr[i];
    j = i - 1;
    while (j >= 0 && key < arr[j]) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[i] = key;
  }
}

void main() {
  inp = fopen("array.txt", "r");
  arr = calloc(LEN, sizeof(int));
  for (int i = 0; i < LEN; i++) fscanf(inp, "%d", &arr[i]);

  FILE* uhh = fopen("smth.txt", "w");
  for (int i = 0; i < LEN; i++) fprintf(uhh, "%d\n", arr[i]);

  // bubbleSort();
  // selectionSort();
  insertionSort();

  FILE* op = fopen("Sorted.txt", "w");
  for (int i = 0; i < LEN; i++) fprintf(op, "%d\n", arr[i]);

  fclose(inp);
  fclose(uhh);
  fclose(op);
}