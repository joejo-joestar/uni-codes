class Car {
    double price;
    int year;

    public Car(double price, int year) {
        this.price = price;
        this.year = year;

    }

    public double calculateSalePrice() {
        return 0.25 * price;

    }

    public String toString() {
        return "[" + "Year: " + year + ", " + "Price: " + calculateSalePrice() + "]";

    }

}

class ClassicCar extends Car {

    public ClassicCar(double price, int year) {
        super(price, year);

    }

    public double calculateSalePrice() {
        return 10000;

    }

}

class SportsCar extends Car {

    public SportsCar(double price, int year) {
        super(price, year);

    }

    public double calculateSalePrice() {
        if (year > 2000) {
            return 0.75 * price;

        } else if (year < 2000 && year > 1995) {
            return 0.5 * price;

        } else {
            return 0.25 * price;

        }

    }

}

public class Q2_CarTester {
    public static void main(String[] args) {
        Car car = new Car(20000, 2014);
        Car classicCar = new ClassicCar(75000, 1950);
        Car sportsCar1 = new SportsCar(10000, 2019);
        Car sportsCar2 = new SportsCar(10000, 1997);
        Car sportsCar3 = new SportsCar(10000, 1950);

        System.out.println((car.toString()));
        System.out.println((classicCar.toString()));
        System.out.println((sportsCar1.toString()));
        System.out.println((sportsCar2.toString()));
        System.out.println((sportsCar3.toString()));

    }

}
