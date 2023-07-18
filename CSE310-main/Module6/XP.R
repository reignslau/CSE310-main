# Initialize the student records as an empty list
students <- list()

# Function to add a new student
add_student <- function(student_id, name, age, score) {
  student <- list(
    student_id = student_id,
    name = name,
    age = age,
    score = score
  )
  students[[student_id]] <- student
  cat("Student added successfully.\n")
}

# Function to display student information
display_student_info <- function(student_id) {
  if (student_id %in% names(students)) {
    student <- students[[student_id]]
    cat("Student ID: ", student$student_id, "\n")
    cat("Name: ", student$name, "\n")
    cat("Age: ", student$age, "\n")
    cat("Score: ", student$score, "\n")
  } else {
    cat("Student not found.\n")
  }
}

# Function to update student records
update_student <- function(student_id, name = NULL, age = NULL, score = NULL) {
  if (student_id %in% names(students)) {
    student <- students[[student_id]]
    if (!is.null(name)) {
      student$name <- name
    }
    if (!is.null(age)) {
      student$age <- age
    }
    if (!is.null(score)) {
      student$score <- score
    }
    cat("Student record updated successfully.\n")
  } else {
    cat("Student not found.\n")
  }
}

# Function to calculate statistics
calculate_statistics <- function() {
  if (length(students) == 0) {
    cat("No students in the records.\n")
  } else {
    total_students <- length(students)
    total_scores <- sapply(students, function(student) student$score)
    average_score <- mean(total_scores)
    max_score <- max(total_scores)
    min_score <- min(total_scores)
    
    cat("Statistics:\n")
    cat("Total Students: ", total_students, "\n")
    cat("Average Score: ", average_score, "\n")
    cat("Max Score: ", max_score, "\n")
    cat("Min Score: ", min_score, "\n")
  }
}

# Main function to interact with the student record system
student_record_system <- function() {
  cat("Welcome to the Student Record System!\n")
  
  while (TRUE) {
    cat("\n1. Add student\n")
    cat("2. Display student information\n")
    cat("3. Update student records\n")
    cat("4. Calculate statistics\n")
    cat("5. Exit\n")
    choice <- as.integer(readline("Enter your choice: "))
    
    if (is.na(choice) || choice < 1 || choice > 5) {
      cat("Invalid choice. Please try again.\n")
    } else if (choice == 1) {
      student_id <- as.integer(readline("Enter student ID: "))
      name <- readline("Enter student name: ")
      age <- as.integer(readline("Enter student age: "))
      score <- as.numeric(readline("Enter student score: "))
      add_student(student_id, name, age, score)
    } else if (choice == 2) {
      student_id <- as.integer(readline("Enter student ID: "))
      display_student_info(student_id)
    } else if (choice == 3) {
      student_id <- as.integer(readline("Enter student ID: "))
      name <- readline("Enter new student name (leave blank to keep current): ")
      age <- as.integer(readline("Enter new student age (leave blank to keep current): "))
      score <- as.numeric(readline("Enter new student score (leave blank to keep current): "))
      update_student(student_id, name, age, score)
    } else if (choice == 4) {
      calculate_statistics()
    } else {
      cat("Thank you for using the Student Record System!\n")
      break
    }
  }
}

# Start the student record system
student_record_system()