
// // Q1
// public class Lect5 {

//     static int x = 11;
//     private int y = 33;

//     public void method(int x) {
//         Lect5 t = new Lect5();
//         this.x = 22;
//         y = 44;

//         System.out.println("Lect5.x: " + Lect5.x);
//         System.out.println("t.x: " + t.x);
//         System.out.println("t.y: " + t.y);
//         System.out.println("y: " + y);
//     }

//     public static void main(String[] args) {
//        Lect5 t = new Lect5();
//        t.method(5);
//     }
// }

// // Q2
// class Lect5 {
//     public static void main(String args[]) {
//         int x = 0;
//         for (x = 0; x < 4; x++) {
//             System.out.println(x);
//         }
//         System.out.println(x);
//     }
// }

// // Q3
// class Lect5 {

//     public static void main(String args[]) {
//         int a = 5;
//         for (a = 0; a < 5; a++) {
//             System.out.println(a);
//         }
//     }
// }

// // Q4
// public class Lect5 {
//     static int age = 0;

//     public void StudentAge() {
//         age = age + 5;
//     }

//     public static void main(String args[]) {
//         System.out.println("Student age is : " + age);
//     }
// }

// // Q5
// class Lect5 {
//     int a;
//     int b;

//     // Parameterized constructor
//     Lect5(int a, int b) {
//         this.a = a;
//         this.b = b;
//     }

//     void display() {
//         // Displaying value of variables a and b
//         System.out.println("a = " + a + " b = " + b);
//     }

//     public static void main(String[] args) {
//         Lect5 object = new Lect5(10, 20);
//         object.display();
//     }
// }

// // Q6
// class Lect5 {
//     int a;
//     int b;

//     // Default constructor
//     Lect5() {
//         this(10, 20);
//         System.out.println("Inside default constructor\n");
//     }

//     // Parameterized constructor
//     Lect5(int a, int b) {
//         this.a = a;
//         this.b = b;
//         System.out.println("Inside parameterized constructor");
//     }

//     public static void main(String[] args) {
//         Lect5 object = new Lect5();
//     }
// }

// // Q7
// class Lect5 {
//     int a;
//     int b;

//     // Default constructor
//     Lect5() {
//         a = 10;
//         b = 20;
//     }

//     // Method that returns current class instance
//     Lect5 get() {
//         return this;
//     }

//     // Displaying value of variables a and b
//     void display() {
//         System.out.println("a = " + a + " b = " + b);
//     }

//     public static void main(String[] args) {
//         Lect5 object = new Lect5();
//         object.get().display();
//     }
// }

// // Q8
// class Lect5 {
//     int a;
//     int b;

//     // Default constructor
//     Lect5() {
//         a = 10;
//         b = 20;
//     }

//     // Method that receives 'this' keyword as parameter
//     void display(Lect5 obj) {
//         System.out.println("a = " + a + " b = " + b);
//     }

//     // Method that returns current class instance
//     void get() {
//         display(this);
//     }

//     public static void main(String[] args) {
//         Lect5 object = new Lect5();
//         object.get();
//     }
// }


// // Q9
// class Lect5 {
//     void display() {
//         // calling function show()
//         this.show();
//         System.out.println("Inside display function");
//     }
//     void show() {
//         System.out.println("Inside show function");
//     }
//     public static void main(String args[]) {
//         Lect5 t1 = new Lect5();
//         t1.display();
//     }
// }


// // Q10
// class A {
//     Lect5 obj;
//     // Parameterized constructor with object of Lect5
//     // as a parameter
//     A(Lect5 obj) {
//         this.obj = obj;
//         // calling display method of class Lect5
//         obj.display();
//     }
// }
// class Lect5 {
//     int x = 5;
//     // Default Constructor that create a object of A
//     // with passing this as an argument in the
//     // constructor
//     Lect5() {
//         A obj = new A(this);
//     }
//     // method to show value of x
//     void display() {
//         System.out.println("Value of x in Class Lect5 : " + x);
//     }
//     public static void main(String[] args) {
//         Lect5 obj = new Lect5();
//     }
// }

// // Q11 - 1
// public class Lect5 {
//     public static void main(String[] args) {
//         int[] a = new int[5];
//         System.out.println(a[0]);
//         String[] flower = new String[1];
//         System.out.println(flower[0]);
//     }
// }


// // Q11 - 2
// public class Lect5 {
//     public static void main(String[] args) {
//         char[] c = new char[20];
//         boolean[] b = new boolean[2];
//         System.out.println(c[10]);
//         System.out.println(b[0]);
//     }
// }