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

| Model | Input | Cache Create | Cache Read | Output | Total Tokens |
| ---: | ---: | ---: | ---: | ---: | ---: |
|opus-4-8 | 8,238 | 82,624 | 128,706 | 8,234 | **~227,802** |

### Implementing the Streak Mode Feature

| Model | Input | Cache Create | Cache Read | Output | Total Tokens |
| ---: | ---: | ---: | ---: | ---: | ---: |
|opus-4-8 | 6,532 | 47,512 | 453,152 | 11,137 | **~518,333** |

### Using AI Agents to Interact With Your App in the Simulator 

Since a single Xcode conversation covered the following topics: 

- AI Agent Describes the Running Game.
- AI Agent Plays the Game.

| Model | Input | Cache Create | Cache Read | Output | Total Tokens |
| ---: | ---: | ---: | ---: | ---: | ---: |
|sonnet-4-6 | 89 | 91,473 | 1,980,751 | 9,735 | **~2,082,048** |

## Token Count for Cursor

**Brief Overview of the Guessing Game**

| Model | Input | Cache Read | Cache Write | Output | Total Count |
| ---: | ---: | ---: | ---: | ---: | ---: |
|cursor-grok-4.6-medium | 29,606 | 44,160 | 0 | 721 | **~74,487** |

>**Note**: For comparison, running _just_ this same topic in Claude Agent for Xcode returned: \
>| Model | Input | Cache Create | Cache Read | Output | Total Tokens |
>| ---: | ---: | ---: | ---: | ---: | ---: |
>|opus-4-8 | 6,063 | 28,488 | 44,241 | 1,701 | **~80,493** |

### Implementing the Blitz Mode Feature

| Model | Input | Cache Read | Cache Write | Output | Total Count |
| ---: | ---: | ---: | ---: | ---: | ---: |
|cursor-grok-4.6-medium | 173,482 | 369,152 | 0 | 11,864 | **~554,498** |

### Connecting Cursor to Xcode's MCP

| Model | Input | Cache Read | Cache Write | Output | Total Count |
| ---: | ---: | ---: | ---: | ---: | ---: |
|cursor-grok-4.6-medium | 172,721 | 391,424 | 0 | 4,755 | **~568,900** | 
