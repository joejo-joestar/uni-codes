#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX 1000
#define STR_SIZE 1000

typedef struct {
  char* name;
  char* id;
  int year;
  float cgpa;
} studentInfo;

void getParts(char* parts[4], char* line) {
  char* tok;
  tok = strtok(line, " ");
  int i = 0;
  while (tok != NULL) {
    parts[i] = tok;
    tok = strtok(NULL, " ");
    i++;
  }
  i = 0;
}

void sort(studentInfo* arr, int l, int h) {
  if (l < h) {
    int mid = (h + l - 1) / 2;
    sort(arr, l, mid);
    sort(arr, mid + 1, h);
    merge(arr, l, mid, h);
  }
}

void merge(studentInfo* arr, int l, int m, int h) {
  int countIndex = 0;
  int left = l;
  int right = m + 1;
  int size = h - l + 1;
  int* test = malloc(10);
  studentInfo* auxArr = calloc(10, sizeof(studentInfo));
  while (left <= m && right <= h) {
    if (arr[left].name <= 0) {
      auxArr[countIndex] = arr[left];
      left++;
    } else {
      auxArr[countIndex] = arr[right];
      right++;
    }
    countIndex++;
  }

  while (right <= h) {
    auxArr[countIndex] = arr[right];
    right++;
    countIndex++;
  }

  while (left <= m) {
    auxArr[countIndex] = arr[left];
    left++;
    countIndex++;
  }

  for (int i = 0; i < size; i++) arr[i + l] = auxArr[i];

  for (int i = 0; i < arraySize(arr); i++) printf("%s ", arr[i].name);
}

void main() {
  char* line = malloc(STR_SIZE);
  char* parts[4];
  FILE* inp = fopen("studentin.dat", "r");
  while (fgets(line, STR_SIZE, inp)) {
    getParts(parts, line);
    studentInfo s;
    s.id = malloc(STR_SIZE);
    s.name = malloc(STR_SIZE);
    s.year = malloc(STR_SIZE);
    strcpy(s.id, parts[0]);
    strcpy(s.name, parts[1]);
    s.year = atoi(parts[2]);
    s.cgpa = atof(parts[3]);

    enqueue(q, s);
  }
  fclose(inp);
}
