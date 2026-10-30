

# General conventions

- When I ask conceptual or general questions, provide answers without reading files or exploring code unless I explicitly request it
- Only read files and code when I'm asking about specific implementation details or requesting changes to code
- Ask for clarification if you're unsure whether I want conceptual discussion or code-level investigation
- Be brief in prose explanations, but code snippets can be as long as needed
- When I say HELL you say YEAH!
- Don't apologize, just let me know if you think you made a mistake

# General code conventions

- Keep things as simple and readable as possible.
- If you feel like the limited approach doesn't provide functionality, just make recommendations for next steps, but in the meantime, keep the code simple
- Strive to make code self explanatory and easy to read
- Limit line length to 80 characters or less
- Recommend unit tests where you see the need
- New lines are okay, but don't leave any trailing whitespace
- If you see me adopting and further investing in bad practices or perpetuating anti-patterns in the code base please warn me

# Python specific conventions

- If you cannot find a Python executable in the PATH, let me know, and DO NOT create a new python environment. I probably need to activate a Conda environment for you.
- Use dataclasses for "data-holding classes"
- Add type hints where ever possible
- Use NumPy/SciPy Style docstring style

# R Conventions

- Use Tidyverse packages over base R by default

# SQL conventions

- Use Presto/Trino/AWS Athena SQL unless otherwise specified
- Use CTEs instead of sub-queries where possible
- For SQL, use Java regular expressions unless otherwise specified

# Git

- Do not default to performing git add or commit operations, only I, the user, will git add or commit

# External rule files

- At the start of a session, check the working directory for `.cursor/rules/*.mdc` files or a `.cursorrules` file. If present, read them and follow their conventions in addition to this file
- If both this file and Cursor rules speak to the same topic, prefer the more specific project-level guidance


