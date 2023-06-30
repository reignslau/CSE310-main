import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

class BankingSystem {
    private Map<String, Double> accounts;

    public BankingSystem() {
        accounts = new HashMap<>();
    }

    public void run() {
        Scanner scanner = new Scanner(System.in);
        boolean running = true;

        while (running) {
            System.out.println("Welcome to the Banking System");
            System.out.println("1. Create an account");
            System.out.println("2. Deposit funds");
            System.out.println("3. Withdraw funds");
            System.out.println("4. Check balance");
            System.out.println("5. Exit");
            System.out.print("Enter your choice: ");
            int choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    createAccount(scanner);
                    break;
                case 2:
                    depositFunds(scanner);
                    break;
                case 3:
                    withdrawFunds(scanner);
                    break;
                case 4:
                    checkBalance(scanner);
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

        System.out.println("Thank you for using the Banking System!");
        scanner.close();
    }

    private void createAccount(Scanner scanner) {
        System.out.print("Enter your name: ");
        String name = scanner.next();
        System.out.print("Enter initial deposit amount: ");
        double amount = scanner.nextDouble();

        if (accounts.containsKey(name)) {
            System.out.println("An account with the same name already exists!");
        } else {
            accounts.put(name, amount);
            System.out.println("Account created successfully!");
        }
    }

    private void depositFunds(Scanner scanner) {
        System.out.print("Enter your name: ");
        String name = scanner.next();

        if (accounts.containsKey(name)) {
            System.out.print("Enter the amount to deposit: ");
            double amount = scanner.nextDouble();
            double currentBalance = accounts.get(name);
            accounts.put(name, currentBalance + amount);
            System.out.println("Funds deposited successfully!");
        } else {
            System.out.println("Account not found!");
        }
    }

    private void withdrawFunds(Scanner scanner) {
        System.out.print("Enter your name: ");
        String name = scanner.next();

        if (accounts.containsKey(name)) {
            System.out.print("Enter the amount to withdraw: ");
            double amount = scanner.nextDouble();
            double currentBalance = accounts.get(name);

            if (currentBalance >= amount) {
                accounts.put(name, currentBalance - amount);
                System.out.println("Funds withdrawn successfully!");
            } else {
                System.out.println("Insufficient funds!");
            }
        } else {
            System.out.println("Account not found!");
        }
    }

    private void checkBalance(Scanner scanner) {
        System.out.print("Enter your name: ");
        String name = scanner.next();

        if (accounts.containsKey(name)) {
            double currentBalance = accounts.get(name);
            System.out.println("Account balance: " + currentBalance);
        } else {
            System.out.println("Account not found!");
        }
    }
}

