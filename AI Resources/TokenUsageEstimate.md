# Token Count

This document outlines the approximate token usage in the first module.

## Tools for Measuring Token Count

### Claude Agent in Xcode

In Xcode 27 beta 4, Xcode and Claude don't show the token count. Therefore, [**ccusage**](https://ccusage.com) calculated the tokens.

### Cursor

The Cursor dashboard provides a clear breakdown of token usage.

## Important Caveats Before Proceeding

Here are a few key points:

- The numbers reported here are approximate.
- Token counts can vary significantly depending on the model used.
- AI output can vary on every run.
- Throughout this program, for the Claude Agent in Xcode, it is recommended to use `/usage` in the `Xcode conversation` to know more on your usage quota and incurred costs. 

## Token Count for Claude Agent in Xcode

### Overview, Architecture and Navigation Graphs

Since a single Xcode conversation covered the following topics:

- Brief Overview of the Guessing Game.
- Architecture and View Details.
- Navigation Graphs.

The total token count at the end of the session for all three topics above:

**Total Tokens**: ~227,802 

**Model**: opus-4-8 | **Input**: 8,238 | **Cache Create**: 82,624 | **Cache Read**: 128,706 | **Output:** 8,234 

### Implementing the Streak Mode Feature

**Total Tokens**: ~518,333

**Model**: opus-4-8 | **Input**: 6,532 | **Cache Create**: 47,512 | **Cache Read**: 453,152 | **Output**: 11,137 

### Using AI Agents to Interact With Your App in the Simulator 

Since a single Xcode conversation covered the following topics: 

- AI Agent Describes the Running Game.
- AI Agent Plays the Game.

**Total Tokens**: ~2,082,048

**Model**: sonnet-4-6 | **Input**: 89 | **Cache Create**: 91,473 | **Cache Read**: 1,980,751 | **Output**: 9,735  

## Token Count for Cursor

**Brief Overview of the Guessing Game**

**Token count**: ~74,487

**Model**: cursor-grok-4.6-medium | **Input**: 29,606 | **Cache Read**: 44,160 | **Cache Write**: 0 | **Output**: 721

>**Note**: For comparison, running _just_ this same topic in Claude Agent for Xcode returned: \
>**Total Tokens**:  ~80,493 | **Model**: opus-4-8 | **Input**: 6,063 | **Cache Create**: 28,488 | **Cache Read**: 44,241 | **Output**: 1,701  

### Implementing the Blitz Mode Feature

**Token count**: ~554,498

**Model**: cursor-grok-4.6-medium | **Input**: 173,482 | **Cache Read**: 369,152 | **Cache Write**: 0 | **Output**: 11,864  

### Connecting Cursor to Xcode's MCP

**Token count**: ~568,900

**Model**: cursor-grok-4.6-medium | **Input**: 172,721 | **Cache Read**: 391,424 | **Cache Write**: 0 | **Output**: 4,755 
