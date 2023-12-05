class Test1 implements Runnable{

    public void run(){
    System.out.println("Test1 run");
    }

}

class Test2 extends Thread{
    public void run(){
        System.out.println("Test2 run");
    }
}

public class ThreadTester {
    public static void main(String[] args) {
        Test1 r1 = new Test1();
        Thread t1 = new Thread(r1);
        t1.start();

        Test2 r2 = new Test2();
        r2.start();
        
    }
    
}
