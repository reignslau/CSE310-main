// Get references to HTML elements
const taskInput = document.getElementById('taskInput');
const addButton = document.getElementById('addButton');
const taskList = document.getElementById('taskList');

// Function to create a new task
function createTask() {
  const taskDescription = taskInput.value;

  if (taskDescription !== '') {
    const listItem = document.createElement('li');
    listItem.innerText = taskDescription;

    // Add click event listener to toggle task completion
    listItem.addEventListener('click', function() {
      this.classList.toggle('completed');
    });

    // Add a button to remove the task
    const removeButton = document.createElement('button');
    removeButton.innerText = 'X';
    removeButton.addEventListener('click', function(event) {
      event.stopPropagation();
      taskList.removeChild(listItem);
    });

    listItem.appendChild(removeButton);
    taskList.appendChild(listItem);

    // Clear the input field
    taskInput.value = '';
  }
}

// Add event listener to the add button
addButton.addEventListener('click', createTask);

// Add event listener to the Enter key
taskInput.addEventListener('keyup', function(event) {
  if (event.key === 'Enter') {
    createTask();
  }
});