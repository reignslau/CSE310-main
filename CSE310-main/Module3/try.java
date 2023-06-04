import java.util.Scanner;

public class GradingSystem {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the total number of subjects: ");
        int totalSubjects = scanner.nextInt();

        int[] marks = new int[totalSubjects];

        System.out.println("Enter the marks for each subject:");
        for (int i = 0; i < totalSubjects; i++) {
            System.out.print("Subject " + (i + 1) + ": ");
            marks[i] = scanner.nextInt();
        }

        double averageMarks = calculateAverage(marks);
        char grade = calculateGrade(averageMarks);

        System.out.println("Average Marks: " + averageMarks);
        System.out.println("Grade: " + grade);
    }

    public static double calculateAverage(int[] marks) {
        int sum = 0;
        for (int mark : marks) {
            sum += mark;
        }
        return (double) sum / marks.length;
    }

    public static char calculateGrade(double averageMarks) {
        if (averageMarks >= 90) {
            return 'A';
        } else if (averageMarks >= 80) {
            return 'B';
        } else if (averageMarks >= 70) {
            return 'C';
        } else if (averageMarks >= 60) {
            return 'D';
        } else {
            return 'F';
        }
    }
}
