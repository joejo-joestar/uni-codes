// import java.util.*;

// class Zoo {
//     private String name;
//     private double gr;
//     private int rc;

//     public Zoo(String n, double gr, int rc) {
//         name = n;
//         this.gr = gr;
//         this.rc = rc;
//     }

//     public String getName() {
//         return name;
//     }

//     public double getGr() {
//         return gr;
//     }

//     public int getRc() {
//         return rc;
//     }
// }

// public class CompreQ {
//     public static void main(String[] args) {
//         ArrayList<Zoo> al = new ArrayList<>();
//         Zoo o1 = new Zoo("a", 3.4, 210);
//         Zoo o2 = new Zoo("b", 4.8, 150);
//         Zoo o3 = new Zoo("c", 4.4, 180);
//         Zoo o4 = new Zoo("d", 3.6, 250);
//         Zoo o5 = new Zoo("e", 3.9, 200);
//         al.add(o1);
//         al.add(o2);
//         al.add(o3);
//         al.add(o4);
//         al.add(o5);
//     }
// }

// class CN implements Comparable<Zoo> {
//     ArrayList<Zoo> a = new ArrayList<>();

//     CN(ArrayList<Zoo> b) {
//         b = a;
//         Collections.sort(b);
//     }

//     @Override
//     public int compareTo(Zoo o) {
//         return this.getName().compareTo(o);
//     }

// }

// class CGr extends Zoo implements Comparator<Zoo>,Comparable<Zoo>{
//     ArrayList<Zoo> a = new ArrayList<>();

//     CGr(ArrayList<Zoo> b) {
//         b = a;
//         Collections.sort(b);
//     }

//     public int compareTo(Zoo o) {
//         return Double.compare(this.getGr(), o.getGr());
//     }

//     @Override
//     public int compare(Zoo o, Zoo o2) {
//         return Double.compare(o.getGr(), o2.getGr());
//     }
// }
