#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define Q_MAX 6
#define STR_SIZE 100

typedef struct {
  char *id;
  char *name;
  char *dob;
  float cgpa;
} student;

typedef struct {
  int front;
  int rear;
  int size;
  student *s;
} cQueue;

void getParts(char *parts[4], char *line) {
  char *tok;
  tok = strtok(line, " ");
  int i = 0;
  while (tok != NULL) {
    parts[i] = tok;
    tok = strtok(NULL, " ");
    i++;
  }
  i = 0;
}

void enqueue(cQueue *q, student s) {
  if (q->size == Q_MAX - 1) {
    printf("Queue is Full, Queue overflow condition\n");
  } else {
    q->s[q->rear] = s;
    q->rear = (q->rear + 1) % Q_MAX;
    q->size++;
  }
}

student dequeue(cQueue *q) {
  if (q->rear == q->front) {
    printf("Queue is Empty, Queue underflow condition\n");
  } else {
    student st = q->s[q->front];
    q->front = (q->front + 1) % Q_MAX;
    q->size--;
    return st;
  }
}

void main() {
  cQueue *q = malloc(Q_MAX);
  q->front = 3;
  q->rear = 2;
  q->s = malloc(Q_MAX * sizeof(student));
  q->size = 0;

  char *line = malloc(STR_SIZE);
  char *parts[4];
  FILE *inp = fopen("studentin.dat", "r");
  while (fgets(line, STR_SIZE, inp)) {
    getParts(parts, line);
    student s;
    s.id = malloc(STR_SIZE);
    s.name = malloc(STR_SIZE);
    s.dob = malloc(STR_SIZE);
    strcpy(s.id, parts[0]);
    strcpy(s.name, parts[1]);
    strcpy(s.dob, parts[2]);
    s.cgpa = atof(parts[3]);

    enqueue(q, s);
  }
  fclose(inp);

  FILE *out = fopen("studentout.dat", "w");
  while (q->front != q->rear) {
    student temp = dequeue(q);
    fprintf(out, "%s %s %s %.2f\n", temp.id, temp.name, temp.dob, temp.cgpa);
    printf("%s %s %s %.2f\n", temp.id, temp.name, temp.dob, temp.cgpa);
  }
  fclose(out);
}
