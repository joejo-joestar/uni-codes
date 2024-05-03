#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX 300000000

// MARK: sizeOfArray()
// function to return size of array from file
int sizeOfArray(int op) {
  FILE* sizeFile = fopen("testCaseSize.txt", "r");
  int size = 0;
  if (op < 1 || op > 15) {
    return 0;
  } else {
    for (int i = 0; i < op; i++) {
      fscanf(sizeFile, "%d", &size);
    }
  }
  fclose(sizeFile);
  return size;
}

// MARK: getArray()
// function to convert needed line into array of integers also from file
int* getArray(int arraySize, int sizeOp) {
  FILE* testCase = fopen("searchTestCase.txt", "r");
  char* line = malloc(11 * sizeof(char) * arraySize);
  int currLine = 1;

  while (fgets(line, MAX, testCase)) {
    if (currLine == sizeOp) {
      break;
    }
    currLine++;
  }
  fclose(testCase);

  int* numbers = malloc(sizeof(int) * arraySize);
  char* tok;
  tok = strtok(line, " ");
  for (int i = 0; i < arraySize; i++) {
    numbers[i] = atoi(tok);
    tok = strtok(NULL, " ");
  }

  return numbers;
}

// MARK: linearSearch()
int linearSearch(int key, int* numbers, int arraySize) {
  for (int i = 0; i < arraySize; i++) {
    if (numbers[i] == key) {
      return i;
    }
  }
  return -1;
}

// MARK: cmpFunc() (for inbuilt qsort fn)
int cmpFunc(const void* a, const void* b) { return (*(int*)a - *(int*)b); }

// MARK: selectionSort() (Obsolete)
// function to do selection sort for sorting array before doing binary search
void sort(int* numbers, int arraySize) {
  int min = 0, temp = 0;
  for (int i = 0; i < arraySize; i++) {
    min = i;
    for (int gw = i + 1; gw < arraySize; gw++) {
      if (numbers[gw] < numbers[min]) {
        min = gw;
      }
    }
    temp = numbers[min];
    numbers[min] = numbers[i];
    numbers[i] = temp;
    
    // "Loading"
    if (i % 1000 == 0) printf(".");
  }
}

// MARK: binarySearch()
int binarySearch(int key, int* numbers, int arraySize) {
  int mid = 0, beg = 0, end = arraySize - 1;
  while (end >= beg) {
    mid = (beg + end) / 2;
    if (numbers[mid] == key) {
      return mid;
    } else if (numbers[mid] < key) {
      beg = mid + 1;
    } else {
      end = mid - 1;
    }
  }
  return -1;
}

// MARK: main()
void main() {
  printf("Enter size of array to search from (1-15): ");
  int sizeOp = -1;
  scanf("%d", &sizeOp);

  int arraySize = sizeOfArray(sizeOp);
  if (arraySize > 0) {
    printf("Size of array is %d integers\n", arraySize);
  } else {
    printf("Invalid Size");
    return;
  }

  int* numbers = getArray(arraySize, sizeOp);

  printf("Please enter int to search: ");
  int key = -1;
  scanf("%d", &key);

  // linear search
  printf("\nLinear Search Start\n");
  clock_t lsStart = clock();
  int lsPos = linearSearch(key, numbers, arraySize);
  clock_t lsEnd = clock();
  float lsTime = ((double)(lsEnd - lsStart) / CLOCKS_PER_SEC) * 1000.00;
  if (lsPos == -1) {
    printf("Linear Search did not find element: %d\n", key);
  } else {
    printf("Linear Search found element: %d at position: %d in [%.2f ms]\n",
           key, lsPos, lsTime);
  }
  FILE* lsOp = fopen("linearSearchOutput.csv", "a");
  fprintf(lsOp, "%d, %d, %.2f\n", key, lsPos, lsTime);
  fclose(lsOp);

  // // qsort
  // printf("\n  Quick Sort started..\n");
  // clock_t qsStart = clock();
  // qsort(numbers, arraySize, sizeof(int), cmpFunc);
  // clock_t qsEnd = clock();
  // float qsTime = ((double)(qsEnd - qsStart) / CLOCKS_PER_SEC) * 1000.00;
  // printf("  Sorted in [%.2f ms]\n", qsTime);

  // Selection Sort
  printf("\n  Selection Sort started..\n");
  clock_t ssStart = clock();
  sort(numbers, arraySize);
  clock_t ssEnd = clock();
  float ssTime = ((double)(ssEnd - ssStart) / CLOCKS_PER_SEC);
  printf("\n  Sorted in [%.2f s]", ssTime);

  // store sorted array into another file
  clock_t stoStart = clock();
  FILE* sArray = fopen("SortedArray.csv", "w");
  for (int i = 0; i < arraySize; i++) {
    fprintf(sArray, "%d, %d\n", i, numbers[i]);
  }
  fclose(sArray);
  clock_t stoEnd = clock();
  float stoTime = ((double)(stoEnd - stoStart) / CLOCKS_PER_SEC) * 1000.00;
  printf("\nSorted Array stored in file \"SortedArray.csv\" [%2f ms]\n");

  // binary search
  printf("\nBinary Search Start\n");
  clock_t bsStart = clock();
  int bsPos = binarySearch(key, numbers, arraySize);
  clock_t bsEnd = clock();
  float bsTime = ((double)(bsEnd - bsStart) / CLOCKS_PER_SEC) * 1000.00;
  if (bsPos == -1) {
    printf("Binary Search did not find element: %d\n", key);
  } else {
    printf("Binary Search found element: %d at position: %d in [%.2f ms]\n",
           key, bsPos, bsTime);
  }

  FILE* bsOp = fopen("binarySearchOutput.csv", "a");
  fprintf(bsOp, "%d,%d,%.2f\n", key, bsPos, bsTime);
  fclose(bsOp);
}