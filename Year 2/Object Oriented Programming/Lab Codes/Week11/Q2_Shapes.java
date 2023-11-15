interface Drawable {
    public void draw();
}

class Circle implements Drawable {
    public void draw() {
        System.out.println("Circle: ");
        System.out.println("o");

    }

}

class Rectangle implements Drawable {
    public void draw() {
        System.out.println("\nRectangle: ");
        System.out.println("\n┌┐");
        System.out.println("└┘");

    }

}

class Triangle implements Drawable {
    public void draw() {
        System.out.println("\nTriangle:");
        System.out.println("\n /\\");
        System.out.println("/__\\");

    }

}

public class Q2_Shapes {
    public static void main(String[] args) {
        Drawable circle = new Circle();
        circle.draw();

        Drawable rectangle = new Rectangle();
        rectangle.draw();

        Drawable triangle = new Triangle();
        triangle.draw();
    }

}
