A system prompt (sometimes called a system instruction) is the foundational set of rules, behavioral guidelines, and contextual boundaries given to a Large Language Model _before_ it interacts with a user.

Think of it as setting the AI’s "personality," "job description," and "safety rails" behind the scenes.

Here are structured notes breaking down how they work:

# System Prompts: Architecture & Function

## 1. Core Definition

- **Purpose:** Establishes the operational persona, tone, constraints, and objective of the LLM.
    
- **Authority:** It is designed to have a higher priority than user inputs. The model refers back to the system prompt throughout the entire chat session to ensure it doesn't break character or violate rules.
    
- **Visibility:** Hidden from the end-user in production applications; configured natively by developers via the LLM API (e.g., the `system_instruction` parameter in Gemini or the `system` role in OpenAI).