# Mastermind Game
My Mastermind project for The Orin Project. Written in Ruby, and built for the command line.

## Features:

- **Dual Gameplay Roles**: Players can choose to be either the code breaker or the code creator.
- **Interactive Feedback System**: Provides detailed feedback on guesses, including correct color and position matches.
- **Broad Palette of Colors**: Offers a diverse range of colors for code creation and guessing.
- **Random Code Generation**: The computer can generate random secret codes for the player to guess.
- **Adaptive Computer Opponent**: In creator mode, the computer attempts to guess the player's code, refining its strategy based on feedback.
- **Clear User Instructions**: The game offers straightforward instructions for gameplay, making it accessible to new players.
- **Replay Option**: Allows players to easily play multiple rounds without restarting the program.
- **Clean User Interface**: Utilizes screen clearing for a clutter-free gaming experience.
- **Modular Design**: The game's logic is organized into separate, focused classes and modules for clarity and extensibility.
- **Strategic Depth**: Combines elements of strategy and luck, especially in selecting guesses and analyzing feedback.
- **Limit of 12 Turns**: Introduces a challenging constraint that adds to the game's excitement and requires thoughtful play.

## Challenges:

- **Feedback Utilization**: Ensuring the computer effectively uses feedback from its previous guesses to refine future guesses.
- **Guess Refinement Strategy**: Developing a strategy for the computer to refine its guesses beyond random selection, particularly when feedback indicates correct colors in incorrect positions.
- **Dynamic Guess Adjustment**: Dynamically adjusting guesses based on a combination of correct and incorrect feedback without making the computer too predictable or too powerful.
- **Feedback Interpretation**: Correctly interpreting feedback to distinguish between colors that are correct in both color and position versus those that are only correct in color.

## Lessons Learned:

- **Feedback Importance**: The critical role feedback plays in guiding the computer's guessing strategy and the need for a methodical approach to incorporate this feedback.
- **Incremental Refinement**: The effectiveness of incrementally refining guesses based on detailed feedback, rather than making large, random changes.
- **Algorithmic Thinking**: The application of simple algorithmic thinking to improve the computer's guess accuracy over time, highlighting the importance of logical structuring and problem-solving.
- **Ruby Skills**: Enhanced familiarity with Ruby's enumerable methods and data structures, such as arrays and symbols, and their manipulation to implement game logic.

## Improvements:

- **Advanced Algorithms**: Implementing more advanced algorithms for the computer's guessing logic, such as genetic algorithms or Knuth's Five-Guess Algorithm, to systematically reduce the pool of possible codes.
- **Player Experience**: Fine-tuning the balance between making the computer an challenging but beatable opponent to enhance player experience and engagement.
- **Code Organization**: Further refactoring to adhere to the Single Responsibility Principle (SRP) and improve code modularity and readability.
- **Feedback Mechanism**: Improving the feedback mechanism to provide more granular information (e.g., identifying which specific guesses are correct) to both the player and the computer.
- **User Interface**: Enhancing the user interface for clearer presentation of guesses, feedback, and instructions, possibly including color-coded output for a more visual experience.
- **Replayability Features**: Adding features to increase replayability, such as difficulty levels, score tracking, and achievements based on game performance.
