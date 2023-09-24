//         // q1.
// class Number {
//         public int i = 15;
// }
// public class Lect3 {
//         public static void main(String[] args) {
//                 Lect3 t = new Lect3();
//                 t.change();
//         }
//         public void change() {
//                 int i = 0;
//                 Number n = new Number();
//                 n.i = 25;
//                 Number n2 = new Number();
//                 n2 = n;
//                 Number n3 = new Number();
//                 n = n3;
//                 System.out.println(n.i + ", " + n2.i + ", " + n3.i);
//         }
// }



//         // q2.
// class Number {
//         public int i = 15;
// }
// public class Lect3 {
//         public static void main(String[] args) {
//                 Lect3 t = new Lect3();
//                 Number n = new Number();
//                 t.change(n);
//         }
//         public void change(Number n) {
//                 int i = 0;
//                 Number n2 = new Number();
//                 n2.i = 20;
//                 n2 = n;
//                 System.out.println(n.i + ", " + n2.i);
//         }
// }



//         // q3.
// class Data {
//         public int i = 15;
//         public static String s = "hello";
// }
// public class Lect3 {
//         public static void main(String[] args) {
//                 Data d = new Data();
//                 System.out.println(d.i);        // stmt 1
//                 System.out.println(d.s);        // stmt 2
//                 System.out.println(Data.s);     // stmt 3
//         }
// }



//      // q4.
// class Data {
//         public static int i = 0;
// }
// public class Lect3 {
//         public int increment() {
//                 return Data.i++;
//         }
//         public static void main(String[] args) {
//                 Lect3 t1 = new Lect3();
//                 Lect3 t2 = new Lect3();
//                 System.out.println(t1.increment());     // stmt 1
//                 System.out.println(t2.increment());     // stmt 2
//                 System.out.println(Data.i);             // stmt 3
//         }
// }



//         // q5.
// class Data {
//         int i = 10;
//         int j = 20;
// }
// public class Lect3 {
//         public void swap(Data d) {
//                 int t = d.i;
//                 d.i = d.j;
//                 d.j = t;
//         }
//         public static void main(String[] args) {
//                 Lect3 t = new Lect3();
//                 Data d = new Data();
//                 t.swap(d);
//                 System.out.println(d.i + ", " + d.j);
//         }
// }



//         // q6.
// class Data {
//         static int i = 10;
//         int j = 20;
//         public void incr() {
//                 i++; j++;
//         }
// }
// public class Lect3 {
//         public static void main(String[] args) {
//                 Data d1 = new Data();
//                 Data d2 = new Data();
//                 d1.incr(); d2.incr();
//                 System.out.println(d1.i + ", " + d1.j + ", " + d2.i + ", " + d2.j);
//         }
// }



//         // q7a.
// class T {
//         int t = 20;
// }
// public class Lect3 {
//         public static void main(String[] args) {
//                 T t1 = new T();
//                 System.out.println(t1.t);
//         }
// }



//         // q7b.
// class T {
//         int t = 20;
//         T() {
//                 t = 40;
//         }
// }
// public class Lect3 {
//         public static void main(String[] args) {
//                 T t1 = new T();
//                 System.out.println(t1.t);
//         }
// }



//         // q9.
// public class Lect3 {
//                 int m_x, m_y;
//                 public Lect3 (int x, int y) {
//                 m_x = x;
//                 m_y = y;
//         }
//         public static void main(String[] args) {
//                 Lect3 p = new Lect3();
//         }
// }
        
        

//         // q10a.
// public class Lect3 {
//         int m_x, m_y;
//         public Lect3 (int x, int y) {
//                 m_x = x;
//                 m_y = y;
//         }
//         public Lect3() {
//                 this(10,10);
//         }
//         public int getX() {
//                 return m_x;
//         }
//         public int getY() {
//                 return m_y;
//         }
//         public static void main(String[] args) {
//                 Lect3 p = new Lect3();
//                 System.out.println(p.getX());
//         }
// }
        
        

//         // q10b.
// final class Complex {
//         private double re, im;
//         public Complex (double re, double im) {
//                 this.re = re;
//                 this.im = im;
//         }
//         Complex (Complex c) {
//                 System.out.println("Copy constructor called");
//                 re = c.re;
//                 im = c.im;
//         }
//         public String toString() {
//                 return"(" + re + " + " + im + "i)";
//         }
// }
// public class Lect3 {
//         public static void main(String[] args) {
//                 Complex c1 = new Complex(10, 15);
//                 Complex c2 = new Complex(c1);
//                 Complex c3 = c1;
//                 System.out.println(c2);
//         }
// }
        
        

//         // q10c.
// public class Lect3 {
//         static int a;
//         static {
//                 a = 4;
//                 System.out.println("inside static block");
//                 System.out.println("a = " + a);
//         }
//         Lect3() {
//                 System.out.println("inside constructor");
//                 a = 10;
//         }
//         public static void func() {
//                 a = a + 1;
//                 System.out.println("a = " + a);
//         }
//         public static void main(String[] args) {
//                 Lect3 obj = new Lect3();
//                 obj.func();
//         }
// }
        
        

//         // q11a.
// import java.util.*;
// public class Lect3 {

//         public static void display(int guess, int win) {
//                 if (guess == win){
//                         System.out.println("You won!");
//                 }
//                 else if (guess > 0 && guess != win && guess < 7){
//                         System.out.println("Oops, Sorry you lost!");
//                 }
//                 else {
//                         System.out.println("Invalid Input");
//                 }
//         }
//         public static void main(String[] args) {
//                 Scanner inp = new Scanner(System.in);
//                 Random rand = new Random();
//                 int winnum = rand.nextInt(1, 6);
//                 System.out.print("Please enter your guess: ");
//                 int guess = inp.nextInt();
//                 display(guess, winnum);
//         }
// }

//      // q11b.
class Complex {
        int real, imag;
        Complex (int re, int im) {
                real = re;
                imag = im;
        }
        Complex (String cmpx) {
                String[] split = cmpx.split("\\s*\\+\\s*|\\s*\\-\\s*|\\s*i\\s*");
                real = Integer.parseInt(split[0]);
                imag = Integer.parseInt(split[2]);
        }
        Complex (Complex c) {
                real = c.real;
                imag = c.imag;
        }
        public void add(Complex c1, Complex c2) {
                String sum;
                sum = "(" + (c1.real + c2.real) + ")" + "(" + (c1.imag + c2.imag) + "i)";
                System.out.println("the sum = " + sum);
        }
        public void sub(Complex c1, Complex c2) {
                String diff;
                diff = "(" + (c1.real - c2.real) + ")" + "(" + (c1.imag - c2.imag) + "i)";
                System.out.println("the difference = " + diff);
        }
        public void mul(Complex c1, Complex c2) {
                String prod;
                prod = "(" + ((c1.real * c2.real) - (c1.imag * c2.imag)) + ")" + "(" + ((c1.real * c2.imag) + (c1.imag * c2.real)) + "i)";
                System.out.println("the product = " + prod);
        }
        public void div(Complex c1, Complex c2) {
                String quo;
                quo = "(" + ((c1.real * c2.real) - (c1.imag * c2.imag)) + ")" + "(" + ((c1.real * c2.imag) + (c1.imag * c2.real)) + "i)";
                System.out.println("the quotient = " + quo);
        }
}
public class Lect3 {
        Complex c1 = new Complex(1, 3);
        Complex c2 = new Complex("2 + 3i");
        Complex c3 = new Complex(c1);
//         c1.add(c1, c2);
//         c1.add(3, 6); // c1 = c1 + complex(3,6);
//         c4 = c1.add(c3); //c4 = c1 + c3
//         c1.display();
}