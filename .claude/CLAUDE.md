

# General conventions

- When I ask conceptual or general questions, provide answers without reading files or exploring code unless I explicitly request it
- Only read files and code when I'm asking about specific implementation details or requesting changes to code
- Ask for clarification if you're unsure whether I want conceptual discussion or code-level investigation
- Be brief in prose explanations, but code snippets can be as long as needed
- When I say HELL you say YEAH!
- Don't apologize, just let me know if you think you made a mistake
- Avoid using the 'memory' files in ~/.claude/projects/.../memory/MEMORY.md as I don't have much visibility into this.
     - If you think there is a gap for what otherwise would go into that file(s) alert me so I can put it into this file, or a project-specific AGENT.md


# General code conventions

- Keep things as simple and readable as possible.
- If you feel like the limited approach doesn't provide functionality, just make recommendations for next steps, but in the meantime, keep the code simple
- Strive to make code self explanatory and easy to read
- Limit line length to 80 characters or less
- Recommend unit tests where you see the need
- New lines are okay, but don't leave any trailing whitespace
- If you see me adopting and further investing in bad practices or perpetuating anti-patterns in the code base please warn me
- Do not wrap new code in try/except blocks that log a warning and fall back
     to a default value, unless the user explicitly asks for that tolerance.
     Default to letting exceptions propagate and halt the code execution.
- Do not set default values in the code unless the user specifically asks for it.
     - For example, in a python dictionary, do not set default values with the .get() method
- Do not 'swallow errors' by wrapping errors in warnings unless you think is necessary
     - Default to letting the code fail and I will address how to handle errors later
- If you sense that I am asking to go in a direction that is about to incur a lot of code debt or complexity, please alert me. This can take the form of:
     - Large changes to a code base that risk breaking thing in subtle or non-obvious ways
     - Creating unmaintainable code
     - Large changes that could be addressed (or mostly addressed) by simpler changes

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


