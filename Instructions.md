## Problem Statement
Create a quiz app with multiple choice questions. The interface should look similar to this: 

![Alt text](Mockup.png?raw=true "Mockup")

## Material Provided
The project provided to you for this challenge already includes the following to help you get started:
1. `NetworkService`: A very basic implementation of an HTTP REST client that currently supports only GET method.
2. `Question` model: A plain swift struct that represents a Question entity.
3. `ViewController`: A very basic `UIViewController` class that is already hooked up in `main.storyboard`. The basic layout is already designed in the storyboard.
4. `NetworkServiceTests`: A unit test class to understand the usage of NetworkService.
5. Assets: Some assets (radio button) have been added to the project.

### Note: The template project has been created using Xcode 11.5 and Swift 5.2. We highly recommend you to upgrade your environment if it is not already using these versions to ensure your interview goes as smooth as possible.

## Expected Result
Your application should perform the following operations:
- Get a list of questions from a [remote resource](https://gist.githubusercontent.com/monishsyed/7d38bbe2e512ccc2c3708168b99ff5e5/raw/6a967af106fc951979342a4a7bbdb45d8aedc845/SwiftChallenge.json) and decode it.
- Randomly choose one question from the list and render it on the screen.
- Allow users to select an answer from the choices given and submit that answer.
- Show a dialog if the answer was right or wrong.

## Evaluation Criteria
Your finished application will be evaluated for 
1. Quality and completion. Don't spend all your time implementing a perfect architecture, but also don't compromise quality to get to the finish line.
2. Maintainability. Your colleagues and your future self should be able to understand, edit and remove any part of your code without pulling their hair out.
3. Testability. Design your code so each part is testable, for example verifying business logic through unit tests.

## General Guidelines
You will be pairing on this challenge with a Careem engineer. A few final tips to help you succeed:
- Talk through the way you’re tackling the problem. Avoid silent coding.
- Try to approach the question from different angles and showcase your in-depth technical and design knowledge.
- You will need to think of an efficient and optimized solution. Don’t over-engineer either.
- Write elegant, bug-free and clean code.
- Ask the interviewer for help when you are stuck. It's okay to ask for help.
- Feel free to use external libraries (e.g. via Cocoapods, Carthage or SPM).
- Feel free to use Google, Stack Overflow etc for code snippets or API docs.
- Feel free to copy code from the internet (within reason).

## Bonus
Write tests for at least one class/struct.
