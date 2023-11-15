class Shape {
    private String color = "Red";
    private boolean filled = true;

    public Shape() {
        color = "Green";
        filled = true;

    }

    public Shape(String color, boolean filled) {
        this.color = color;
        this.filled = filled;

    }

    public String getColor() {
        return color;

    }

    public void setColor(String color) {
        this.color = color;

    }

    public boolean isFilled() {
        return filled;

    }

    public void setFilled(boolean filled) {
        this.filled = filled;

    }

    public String toString() {
        if (isFilled()) {
            return "Shape of color " + getColor() + " and filled";

        }

        else {
            return "Shape of color " + getColor() + " and not filled";

        }

    }

}

class Circle extends Shape {
    private double radius;

    public Circle() {
        radius = 1.0;

    }

    public Circle(double radius) {
        super();
        this.radius = radius;

    }

    public Circle(double radius, String color, boolean filled) {
        super(color, filled);
        this.radius = radius;

    }

    public double getRadius() {
        return radius;

    }

    public void setRadius(double radius) {
        this.radius = radius;

    }

    public double getArea() {
        return radius * radius * 3.14;

    }

    public double getCircumference() {
        return radius * 2.0 * 3.14;

    }

    public String toString() {
        return "A Circle with radius = " + getRadius() + ", which is a subclass of " + super.toString();

    }

}

class Rectangle extends Shape {
    private double width;
    private double length;

    public Rectangle() {
        super();
        width = 1.0;
        length = 1.0;

    }

    public Rectangle(double width, double length) {
        super();
        this.width = width;
        this.length = length;

    }

    public Rectangle(double width, double length, String color, boolean filled) {
        super(color, filled);
        this.width = width;
        this.length = length;

    }

    public double getWidth() {
        return width;

    }

    public void setWidth(double width) {
        this.width = width;

    }

    public double getLength() {
        return length;

    }

    public void setLength(double length) {
        this.length = length;

    }

    public double getArea() {
        return length * width;

    }

    public double getPerimeter() {
        return 2 * (length + width);

    }

    public String toString() {
        return "A rectangle with width = " + getWidth() + " and length = " + getLength() + ", which is a subclass of "
                + super.toString();

    }

}

class Square extends Rectangle {
    public Square() {
        super();

    }

    public Square(double side) {
        super(side, side);

    }

    public Square(double side, String color, boolean filled) {
        super(side, side, color, filled);

    }

    public double getSide() {
        return getLength();

    }

    public void setSide(double side) {
        super.setLength(side);

    }

    public void setWidth(double side) {
        super.setWidth(side);

    }

    public void setLength(double length) {
        super.setLength(length);

    }

    public String toString() {
        return "A Square with side = " + getSide() + ", which is a subclass of "
                + super.toString();

    }

}

public class Q3_ShapesTester {
    public static void main(String[] args) {
        Shape s1 = new Shape();
        System.out.println(s1.toString());

        Shape s2 = new Shape("Orange", false);
        System.out.println(s2.toString());

        Shape c1 = new Circle();
        System.out.println(c1.toString());

        Shape c2 = new Circle(2.0);
        System.out.println(c2.toString());

        Shape c3 = new Circle(3.0, "Blue", false);
        System.out.println(c3.toString());

        Shape r1 = new Rectangle();
        System.out.println(r1.toString());

        Shape r2 = new Rectangle(2.0, 3.0);
        System.out.println(r2.toString());

        Shape r3 = new Rectangle(3.0, 4.0, "Yellow", false);
        System.out.println(r3.toString());

        Shape sq1 = new Square();
        System.out.println(sq1.toString());

        Shape sq2 = new Square(2.0);
        System.out.println(sq2.toString());

        Shape sq3 = new Square(3.0, "Grey", false);
        System.out.println(sq3.toString());

    }

}
