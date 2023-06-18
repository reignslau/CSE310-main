// Function to calculate the factorial
function calculateFactorial(number) {
    if (number === 0 || number === 1) {
      return 1;
    } else {
      let factorial = 1;
      for (let i = 2; i <= number; i++) {
        factorial *= i;
      }
      return factorial;
    }
  }
  
  // Prompt the user for input
  const userInput = prompt("Enter a number:");
  
  // Convert the user input to a number
  const number = parseInt(userInput);
  
  // Calculate the factorial
  const result = calculateFactorial(number);
  
  // Display the result
  console.log(`The factorial of ${number} is ${result}.`);