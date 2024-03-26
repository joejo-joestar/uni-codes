#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define STRING_SIZE 50
#define STACK_SIZE 1

typedef struct {
  char *id;
  char *name;
  char *date;
  float cgpa;
} studentInfo;

void push(studentInfo stack[STACK_SIZE], int *top, studentInfo s) {
  if (*top == STACK_SIZE - 1) {  // Checking Overflow Condition
    printf("Stack is filled, Overflow Condition\n");
    return;
  }
  stack[++(*top)] = s;
}

studentInfo *pop(studentInfo stack[STACK_SIZE], int *top) {
  if (*top == -1) {  // Checking Underflow Condition
    printf("Stack is empty, Underflow Condition\n");
    return NULL;
  }
  return &stack[(*top)--];
}

void getParts(char parts[4][STRING_SIZE], char *line) {
  int word = 0, begin = 0, len = strlen(line);

  // Exclude the trailing \n from the string.
  if (line[len - 1] == '\n') {
    len--;
    line[len] = 0;  // replace the \n with null byte
  }

  for (int i = 0; i <= len; i++) {
    // IF we're at the last character of the word
    // OR at the last character of the line
    // then copy the word to parts
    if (line[i + 1] == ' ' || i == len - 1) {
      // copy line[begin ↔ i] inclusive to parts[word][0 ↔ j - i]
      for (int j = begin; j <= i; j++) {
        parts[word][j - begin] = line[j];
      }

      // put null byte AFTER the copied characters.
      parts[word][i - begin + 1] = 0;

      word++;
      begin = i + 2;
    }
  }
}

void main() {
  char *line = calloc(STRING_SIZE, sizeof(char));
  studentInfo arr[STACK_SIZE];
  char parts[4][STRING_SIZE];
  int lineNumber = 0;

  FILE *file = fopen("studentin.dat", "r");
  int top = -1;
  while (fgets(line, STRING_SIZE - 1, file)) {
    getParts(parts, line);
    studentInfo s;
    s.id = malloc(STRING_SIZE);
    s.name = malloc(STRING_SIZE);
    s.date = malloc(STRING_SIZE);
    strcpy(s.id, parts[0]);
    strcpy(s.name, parts[1]);
    strcpy(s.date, parts[2]);
    s.cgpa = atof(parts[3]);
    push(arr, &top, s);
  }
  fclose(file);

  FILE *output = fopen("studentout.dat", "w");
  while (top >= 0) {
    studentInfo *s = pop(arr, &top);
    if (s == NULL) break;
    fprintf(output, "%s %s %s %.2f\n", s->id, s->name, s->date, s->cgpa);
    printf("%s %s %s %.2f\n", s->id, s->name, s->date, s->cgpa);
  }
  fclose(output);
}
