# Initialize the inventory as an empty list
inventory <- list()

# Function to add an item to the inventory
add_item <- function(item_name, quantity) {
  if (item_name %in% names(inventory)) {
    inventory[[item_name]] <- inventory[[item_name]] + quantity
  } else {
    inventory[[item_name]] <- quantity
  }
  cat(quantity, " ", item_name, "(s) added to the inventory.\n")
}

# Function to update the quantity of an item in the inventory
update_item_quantity <- function(item_name, new_quantity) {
  if (item_name %in% names(inventory)) {
    inventory[[item_name]] <- new_quantity
    cat("Quantity of ", item_name, " updated to ", new_quantity, ".\n")
  } else {
    cat(item_name, " not found in the inventory.\n")
  }
}

# Function to display the current inventory status
show_inventory <- function() {
  if (length(inventory) == 0) {
    cat("Inventory is empty.\n")
  } else {
    cat("Current Inventory Status:\n")
    for (item_name in names(inventory)) {
      cat(item_name, ": ", inventory[[item_name]], "\n")
    }
  }
}

# Main function to interact with the inventory management system
manage_inventory <- function() {
  cat("Welcome to the Inventory Management System!\n")
  
  while (TRUE) {
    cat("\n1. Add item to the inventory\n")
    cat("2. Update item quantity\n")
    cat("3. Show current inventory\n")
    cat("4. Exit\n")
    choice <- as.integer(readline("Enter your choice: "))
    
    if (is.na(choice) || choice < 1 || choice > 4) {
      cat("Invalid choice. Please try again.\n")
    } else if (choice == 1) {
      item_name <- readline("Enter item name: ")
      quantity <- as.integer(readline("Enter quantity: "))
      add_item(item_name, quantity)
    } else if (choice == 2) {
      item_name <- readline("Enter item name: ")
      new_quantity <- as.integer(readline("Enter new quantity: "))
      update_item_quantity(item_name, new_quantity)
    } else if (choice == 3) {
      show_inventory()
    } else {
      cat("Thank you for using the Inventory Management System!\n")
      break
    }
  }
}

# Start the inventory management system
manage_inventory()