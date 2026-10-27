# Token Usage

This document outlines the approximate token usage in the **Getting Started** module.

## Tools for Measuring Token Count

### Claude Agent in Xcode

In Xcode 27 beta 4, Xcode and Claude don't show the token count. Therefore, [**ccusage**](https://ccusage.com) calculated the tokens.

### Cursor

The Cursor dashboard provides a clear breakdown of token count.

## Important Caveats Before Proceeding

Here are a few key points:

- The numbers reported here are approximate.
- Token counts can vary significantly depending on the model used.
- AI output can vary on every run.
- Estimated costs use pay-as-you-go API prices in USD as of October 2026. If you use a Claude or Cursor subscription plan, your usage counts against the plan's allowance instead.
- Throughout this course, use `/usage` in an Xcode conversation with Claude Agent to learn more about your usage quota and costs.

## Token Usage for Claude Agent in Xcode

### Overview, Architecture and Navigation Graphs

Since a single Xcode conversation covered the following topics:

- Brief overview of the guessing game
- Architecture and view details
- Navigation graphs

The approximate total token count at the end of the session for all three interactions was:

| Model | Input | Cache Create | Cache Read | Output | Total Tokens | Est. Cost |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: |
|opus-4-8 | 8,238 | 82,624 | 128,706 | 8,234 | **~227,802** | **~$0.83** |

### Implementing the Streak Mode Feature

| Model | Input | Cache Create | Cache Read | Output | Total Tokens | Est. Cost |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: |
|opus-4-8 | 6,532 | 47,512 | 453,152 | 11,137 | **~518,333** | **~$0.83** |

### Using AI Agents to Interact With Your App in the Simulator

Since a single Xcode conversation covered the following topics:

- AI agent describes the running game
- AI agent plays the game

The approximate total token count at the end of both interactions was:

| Model | Input | Cache Create | Cache Read | Output | Total Tokens | Est. Cost |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: |
|sonnet-4-6 | 89 | 91,473 | 1,980,751 | 9,735 | **~2,082,048** | **~$1.08** |

## Token Usage for Cursor

**Brief Overview of the Guessing Game**

| Model | Input | Cache Read | Cache Write | Output | Total | Est. Cost |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: |
|cursor-grok-4.6-medium | 29,606 | 44,160 | 0 | 721 | **~74,487** | **~$0.09** |

> **Note**: For comparison, running _just_ this same topic in Claude Agent for Xcode returned:
>
> | Model | Input | Cache Create | Cache Read | Output | Total Tokens | Est. Cost |
> | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
> |opus-4-8 | 6,063 | 28,488 | 44,241 | 1,701 | **~80,493** | **~$0.27** |

### Implementing the Blitz Mode Feature

| Model | Input | Cache Read | Cache Write | Output | Total | Est. Cost |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: |
|cursor-grok-4.6-medium | 173,482 | 369,152 | 0 | 11,864 | **~554,498** | **~$0.60** |

### Connecting Cursor to Xcode's MCP

| Model | Input | Cache Read | Cache Write | Output | Total | Est. Cost |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: |
|cursor-grok-4.6-medium | 172,721 | 391,424 | 0 | 4,755 | **~568,900** | **~$0.57** |
