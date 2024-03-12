#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*----------------------------------------------------------------------------*/

// struct for student info
typedef struct {
  char* id;
  char* name;
  float cgpa;
} student;

// struct for defining node
typedef struct node {
  student stu;
  struct node* next;
} node;

// fn to remove whitespaces
char* trim(char* s) {
  char* trimmed = strtok(s, "\n");
  return trimmed;
}

/*----------------------------------------------------------------------------*/

// fn for checking if ll is empty
int isEmpty(node* start) {
  if (start == NULL)
    return 1;
  else
    return 0;
}

// fn to return size of ll
int size(node* start) {
  node* cursor;
  cursor = start;
  int i = 0;
  while (cursor) {
    i++;
    cursor = cursor->next;
  }
  return i;
}

/*----------------------------------------------------------------------------*/

// fn to insert elements into a node and then into a ll
void insert(int index, char* name, char* id, float cgpa, node** start) {
  node* temp;
  node* newNode = calloc(1, sizeof(node));

  int lSize = size(*start);

  student s;
  s.id = id;
  s.name = name;
  s.cgpa = cgpa;

  newNode->stu = s;

  // if ll is empty or insert at beginning
  if (isEmpty(*start) || index == 0) {
    newNode->next = *start;
    *start = newNode;
    printf("Node Inserted in the beninging\n");
  }
  // insert at end
  else if (index >= lSize) {
    temp = *start;
    while (temp->next != NULL) {
      temp = temp->next;
    }
    newNode->next = NULL;
    temp->next = newNode;
    printf("Node Inserted in the end\n");
  }
  // else insert at index
  else {
    temp = *start;
    for (int i = 0; i < index - 1; i++) {
      temp = temp->next;
    }
    newNode->next = temp->next;
    temp->next = newNode;
    printf("Node Inserted after position %d\n", index);
  }
}

// searching node by stu.name
int find(node* start, char* name) {
  node* cursor;
  cursor = start;
  int j = 1;
  while (cursor) {
    student n = cursor->stu;
    if (strcmp(name, n.name) == 0) {
      return j;
    }
    j++;
    cursor = cursor->next;
  }
  return -1;
}

int delete(node** start, char* name) {
  if (isEmpty(*start)) {
    return -1;
  }
  node* cursor = *start;
  node* cursor_before = NULL;
  int j = 0;
  while (cursor) {
    student n = cursor->stu;
    if (strcmp(name, n.name) == 0) {
      if (cursor_before) {
        cursor_before->next = cursor->next;
      }
      if (j == 0) {
        *start = cursor->next;
      }  // for deleting initial node
      free(cursor);
      return 1;
    }
    j++;
    cursor_before = cursor;
    cursor = cursor->next;
  }

  return 0;  // since no record was deleted.
}  // delete node by stu.name

// fn to display
void display(node* start) {
  struct node* cursor;
  cursor = start;
  // if list is empty
  if (cursor == NULL) {
    printf("Nothing to print\n");
  } else {
    printf(
        "\nThere are %d records present in the list."
        "\nThe student records present in the list are:\n",
        size(start));

    int j = 0;  // for S.No
    while (cursor != NULL) {
      printf("%d. %s, %s, %.2f\n", (j + 1), cursor->stu.name, cursor->stu.id,
             cursor->stu.cgpa);  // another segmentation fault
      cursor = cursor->next;
      j++;
    }
  }
}

/*----------------------------------------------------------------------------*/

// fn to insert dummy testing records.
void insert_testing_records(node** start) {
  node* rec1 = calloc(1, sizeof(node));
  node* rec2 = calloc(1, sizeof(node));
  node* rec3 = calloc(1, sizeof(node));
  rec1->stu.name = "sr";
  rec1->stu.id = "34";
  rec1->stu.cgpa = 10;
  rec1->next = rec2;
  rec2->stu.name = "jo";
  rec2->stu.id = "19";
  rec2->stu.cgpa = 20;
  rec2->next = rec3;
  rec3->stu.name = "us";
  rec3->stu.id = "04";
  rec3->stu.cgpa = 30;
  rec3->next = NULL;
  *start = rec1;
}

void main() {
  int option;
  node* start = NULL;
  insert_testing_records(&start);

  char* name;
  char* id;
  float cgpa;
  int index;

  while (1) {
    printf(
        "\n\x1b[33mOptions:\x1b[0m"
        "\n  1. Add Student Record"
        "\n  2. Find Student Record"
        "\n  3. Delete Student Record"
        "\n  4. Display List"
        "\n  5. isEmpty"
        "\n  6. Size"
        "\n  7. Exit"
        "\nPlease enter the Option: ");
    scanf("%d", &option);

    switch (option) {
      case 1:  // 1. Add Student Record
        printf("Adding Student Record:\n");

        name = calloc(32, sizeof(char));
        id = calloc(24, sizeof(char));

        printf("  Name:\t\t");
        getchar();
        fgets(name, 32, stdin);

        printf("  ID:\t\t");
        fgets(id, 24, stdin);

        printf("  CGPA:\t\t");
        scanf("%f", &cgpa);

        printf("  Index:\t");
        scanf("%d", &index);
        insert(index, trim(name), trim(id), cgpa, &start);
        break;

      case 2:  // 2. Find Student Record
        printf("  Name:\t");
        getchar();
        name = calloc(32, sizeof(char));
        fgets(name, 32, stdin);

        int loc = find(start, trim(name));
        if (loc == -1) {
          printf("Record not found\n");
        } else {
          printf("The student %s is at position %d\n", trim(name), loc);
        }
        break;

      case 3:  // 3. Delete Student Record
        printf("  Name:\t");
        getchar();
        name = calloc(32, sizeof(char));
        fgets(name, 32, stdin);

        int delete_result = delete (&start, trim(name));
        if (delete_result > 0) {
          printf("Deleted record of %s successfully\n", trim(name));
        } else if (delete_result == 0) {
          printf("Record not found\n");
        } else {
          printf("Underflow condition\n");
        }
        break;

      case 4:  // 4. Display List
        display(start);
        break;

      case 5:  // 5. isEmpty
        if (isEmpty(start))
          printf("Linked List is Empty\n");
        else
          printf("Linked List is Not Empty\n");
        break;

      case 6:  // 6. Size
        printf("Current size of Linked List is %d", size(start));
        break;

      case 7:  // 7. Exit
      default:
        return;
    }
  }
}
