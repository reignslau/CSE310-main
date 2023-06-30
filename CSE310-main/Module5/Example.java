import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class InventoryManagementSystem {

    private static List<Product> inventory = new ArrayList<>();

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        boolean running = true;

        while (running) {
            System.out.println("Welcome to the Inventory Management System");
            System.out.println("1. Add a product");
            System.out.println("2. Remove a product");
            System.out.println("3. Search for a product");
            System.out.println("4. Display all products");
            System.out.println("5. Exit");
            System.out.print("Enter your choice: ");
            int choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    addProduct(scanner);
                    break;
                case 2:
                    removeProduct(scanner);
                    break;
                case 3:
                    searchProduct(scanner);
                    break;
                case 4:
                    displayProducts();
                    break;
                case 5:
                    running = false;
                    break;
                default:
                    System.out.println("Invalid choice! Please try again.");
                    break;
            }
            System.out.println();
        }

        System.out.println("Thank you for using the Inventory Management System!");
        scanner.close();
    }

    private static void addProduct(Scanner scanner) {
        System.out.print("Enter the name of the product: ");
        String name = scanner.next();
        System.out.print("Enter the quantity of the product: ");
        int quantity = scanner.nextInt();

        Product product = new Product(name, quantity);
        inventory.add(product);

        System.out.println("Product added successfully!");
    }

    private static void removeProduct(Scanner scanner) {
        System.out.print("Enter the name of the product to remove: ");
        String name = scanner.next();

        boolean found = false;
        for (Product product : inventory) {
            if (product.getName().equals(name)) {
                inventory.remove(product);
                found = true;
                System.out.println("Product removed successfully!");
                break;
            }
        }

        if (!found) {
            System.out.println("Product not found!");
        }
    }

    private static void searchProduct(Scanner scanner) {
        System.out.print("Enter the name of the product to search: ");
        String name = scanner.next();

        boolean found = false;
        for (Product product : inventory) {
            if (product.getName().equals(name)) {
                System.out.println("Product found: " + product.getName() + ", Quantity: " + product.getQuantity());
                found = true;
                break;
            }
        }

        if (!found) {
            System.out.println("Product not found!");
        }
    }

    private static void displayProducts() {
        if (inventory.isEmpty()) {
            System.out.println("No products in the inventory!");
        } else {
            System.out.println("Inventory:");
            for (Product product : inventory) {
                System.out.println("Name: " + product.getName() + ", Quantity: " + product.getQuantity());
            }
        }
    }
}

class Product {
    private String name;
    private int quantity;

    public Product(String name, int quantity) {
        this.name = name;
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public int getQuantity() {
        return quantity;
    }
}