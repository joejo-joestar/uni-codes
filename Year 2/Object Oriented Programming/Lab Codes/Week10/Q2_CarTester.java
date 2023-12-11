class CarSale {
    double price;
    int year;

    public CarSale(double price, int year) {
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

class ClassicCar extends CarSale {

    public ClassicCar(double price, int year) {
        super(price, year);

    }

    public double calculateSalePrice() {
        return 10000;

    }

}

class SportsCar extends CarSale {

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
        CarSale car = new CarSale(20000, 2014);
        CarSale classicCar = new ClassicCar(75000, 1950);
        CarSale sportsCar1 = new SportsCar(10000, 2019);
        CarSale sportsCar2 = new SportsCar(10000, 1997);
        CarSale sportsCar3 = new SportsCar(10000, 1950);

        System.out.println((car.toString()));
        System.out.println((classicCar.toString()));
        System.out.println((sportsCar1.toString()));
        System.out.println((sportsCar2.toString()));
        System.out.println((sportsCar3.toString()));

    }

}
