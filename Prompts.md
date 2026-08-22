# Prompts

## Lesson 1: Getting Started

####Prompt 1: Brief Overview of the Guessing Game using Claude Agent

```text
give me a brief on this project
```

####Prompt 2: Brief Overview of the Guessing Game using Cursor

```text
give me a brief on this project
```

## Lesson 2: Building on the Guessing Game

### Demo 01: Introduction to the Guessing Game

####Prompt 1: Architecture and View Details

```text
give me more details on the architecture and the views, use code snippets from the project to help explain it.
```

####Prompt 2: Navigation Graphs

```text
give me a graph on how the views navigate to each other
```

### Demo 02: Using Xcode to Create Streak Mode

####Prompt 1: Implement Streak Mode Feature

```text
the app is missing the implementation of the streak mode. implement the feature considering the description of this game mode:

Streak mode user takes the risk and continues to play the next rounds.
The risk is: A wrong guess ends the run instantly, even if clues remain.
For the standard user, a wrong guess is nearly free (you just see the next clue).
In Streak mode, every guess is a real gamble: "I'm 80% sure it's Chile… but is 80% enough to bet the whole run?".
```

## Demo 03: Using Cursor to Implement Blitz Mode

####Prompt 1: Implement Blitz Mode Feature

```text
This app doesn't implement the Blitz mode, implement the feature following the description of this game mode:

Users can see one clue for a maximum time of 20 seconds. Once the timer expires - the next clue is shown automatically.
Users can’t go back to see the previous clue. The idea is users will have to read the clues in this time and also remember them to make the guess.
The point system changes now.
It will be 40 (end of 1st clue), 30 (end of 2nd clue), 20 (end of 3rd clue), 10 (end of 4th clue).
In this mode, the users get an opportunity to score more points. Maximum points for each round will be 40 now (instead of 20 in standard mode).
```

## Lesson 3: Connecting the Simulator to your AI Agent

### Demo 01: Using AI Agents to Interact With Your App in the Simulator

####Prompt 1: AI Agent Describes the Running Game

```text
what do you see on the screen of the iPhone 17 Pro simulator
```

####Prompt 2: AI Agent Plays the Game

```text
start a classic game. guess the country correctly in 2 rounds, then choose the wrong one in the 3rd round, choose it correctly on the next attempt, then end the round.
```

### Demo 02: Connecting Cursor to Xcode's MCP

####Prompt 1: Cursor Describing the Game

```text
Run the app using Xcode tools on the iPhone 17 Pro simulator, then describe what you can see on the main screen
```
