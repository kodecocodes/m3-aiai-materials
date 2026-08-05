# Prompts

## Lesson 1

```
give me a brief on this project
```

## Lesson 2.1

```
give me more details on the architecture and the views, use code snippets from the project to help explain it.
```

## Lesson 2.2

```
the app is missing the implementation of the streak mode. implement the feature considering the description of this game mode:

Streak mode user takes the risk and continues to play the next rounds. The risk is: A wrong guess ends the run instantly, even if clues remain. For the standard user, a wrong guess is nearly free (you just see the next clue). In Streak mode, every guess is a real gamble: "I'm 80% sure it's Chile… but is 80% enough to bet the whole run?".

This mode has a different scoring and no hints. the scoring is how many correct countries guessed. thus the score hint in the first screen should represent that.
Also there is no hints in the screen guessing the country, the number of clues used shouldn't exist and should instead show the current strike length.
The final screen when the streak ends, should show "length" instead of points and each correct guess to have a checkmark, or an x instead of the score it added. use CF Symbols
```

## Lesson 2.3

```
This app doesn't implement the Blitz mode, implement the feature following the description of this game mode:

Users can see one clue for a maximum time of 1 minute (or less). Once the timer expires - the next clue is shown automatically. Users can’t go back to see the previous clue. The idea is users will have to read the clues in this time and also remember them to make the guess. The point system changes now.

The point system now changes. It will be 40 (end of 1st clue), 30 (end of 2nd clue), 20 (end of 3rd clue), 10 (end of 4th clue). In this mode, the users get an opportunity to score more points. Maximum points for each round will be 40 now (instead of 20 in standard mode).
Make sure the message in the first screen correctly describes this scoring.
```

## Lesson 3

```
run the app on the simulator. start a classic game. guess the country correctly in 2 rounds, then choose the wrong one in the 3rd round, choose it correctly on the next attempt, then end the round.
```
