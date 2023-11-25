interface Drawable {
    public void draw();
}

class DCircle implements Drawable {
    public void draw() {
        System.out.println("Circle: ");
        System.out.println("o");

    }

}

class DRectangle implements Drawable {
    public void draw() {
        System.out.println("\nRectangle: ");
        System.out.println("\n _____");
        System.out.println("|_____|");

    }

}

class DTriangle implements Drawable {
    public void draw() {
        System.out.println("\nTriangle:");
        System.out.println("\n /\\");
        System.out.println("/__\\");

    }

}

public class Q2_Shapes {
    public static void main(String[] args) {
        Drawable circle = new DCircle();
        circle.draw();

        Drawable rectangle = new DRectangle();
        rectangle.draw();

        Drawable triangle = new DTriangle();
        triangle.draw();
    }

}
