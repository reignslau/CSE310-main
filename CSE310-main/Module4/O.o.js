// Define an array to store the to-do list tasks
let tasks = [];

// Function to add a task to the list
function addTask(task) {
  tasks.push(task);
}

// Function to view all tasks
function viewTasks() {
  if (tasks.length === 0) {
    console.log("No tasks found.");
  } else {
    console.log("Tasks:");
    tasks.forEach((task, index) => {
      const taskStatus = task.completed ? "[x]" : "[ ]";
      console.log(`${index + 1}. ${taskStatus} ${task.description}`);
    });
  }
}

// Function to mark a task as completed
function markTaskAsCompleted(taskIndex) {
  if (taskIndex >= 0 && taskIndex < tasks.length) {
    tasks[taskIndex].completed = true;
    console.log(`Task "${tasks[taskIndex].description}" marked as completed.`);
  } else {
    console.log("Invalid task index.");
  }
}

// Function to update a task
function updateTask(taskIndex, newDescription) {
  if (taskIndex >= 0 && taskIndex < tasks.length) {
    tasks[taskIndex].description = newDescription;
    console.log(`Task ${taskIndex + 1} updated.`);
  } else {
    console.log("Invalid task index.");
  }
}

// Function to delete a task
function deleteTask(taskIndex) {
  if (taskIndex >= 0 && taskIndex < tasks.length) {
    const deletedTask = tasks.splice(taskIndex, 1)[0];
    console.log(`Task "${deletedTask.description}" deleted.`);
  } else {
    console.log("Invalid task index.");
  }
}

// Test the to-do list manager
addTask({ description: "Buy groceries", completed: false });
addTask({ description: "Do laundry", completed: false });
viewTasks();

markTaskAsCompleted(0);
viewTasks();

updateTask(1, "Clean the house");
viewTasks();

deleteTask(0);
viewTasks();