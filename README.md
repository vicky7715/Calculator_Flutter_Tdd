# calculator

A new Flutter project.

## Getting Started

# StringCalculator Flutter Project

This Flutter project demonstrates a simple implementation of a `StringCalculator` class that processes a string of numbers with custom delimiters and calculates their sum. The project also includes error handling for invalid inputs and custom delimiters.

## Features

- Add numbers separated by commas or custom delimiters.
- Handles newlines between numbers.
- Custom delimiters can be defined at the start of the input string.
- Throws errors for invalid input and negative numbers.

Test Case 1: Handles empty string input (should return 0).
Test Case 2: Handles single number input (should return the number itself).
Test Case 3: Handles multiple numbers with commas (should return the sum).
Test Case 4: Handles multiple numbers with semicolons (should return the sum).
Test Case 5: Handles newline characters between numbers (should return the sum).
Test Case 6: Throws an error for negative numbers.

## Setup

1. Clone the repository to your local machine:

   ```bash
   git clone remote URL
   ```

2. You can run the project from the test folder, which includes all the test scenarios. Simply type flutter test --reporter expanded to execute the tests and view detailed results for each case.

3. You can also run the application from the main.dart file, where you can input strings in the specified format to calculate the sum. A screenshot of the application is also included to show the result in action.
