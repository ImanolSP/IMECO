# Lexer Implementation Report

## Solution Overview

The Elixir module `Lexer` is designed to read a Elixir file, highlight syntax elements using HTML tags, and output the results in an HTML file. The solution processes the file line by line, identifying and styling tokens such as keywords, comments, functions, and more, based on predefined regular expressions.

## Algorithm Efficiency

The main algorithm involves streaming the file line by line and recursively processing each line through a series of regex matches that identify different types of tokens. Each line is processed independently, and regex operations are performed until the line is exhausted of recognizable tokens.

**The RegEx used for each token were:**

**Comments:** ^#.*$

**Space:** ^\s+

**Keyword:** ^\b(def|defmodule|fn|defp|do|nil|end|case|cond|if|else|do|when|after|in|catch|rescue|true|false)\b

**Modules**:^\b([A-Z]\w*)

**Functions**: ^\b( \w+ )(?=\s*\()

**Numbers**:^\d+

**Variables**: ^\b\w+\b

**Atoms**: ^:\b\w+\b

**Operators**: ^( \-> | \-\- | \+\+ | &&| \ | \ | | \* | \+ | \- | \/ | > | < | <> | \( | \) | \= | \ |)

**Symbols**:^[ {} [\] () , . :]

**Strings**: ^(['"])(?:(?=(\\?))\2.)*?\1

**Regex**: ^(\~r.*\/)


### Complexity Analysis

- **Time Complexity:** The algorithm has a linear time complexity relative to the number of lines, \( O(n) \), where \( n \) is the number of lines in the file. However, for each line, multiple regex operations (potentially up to the number of different token types) can be executed. This makes the effective complexity \( O(m * k) \), where \( m \) is the average number of tokens per line and \( k \) is the average cost of a regex operation.

- **Space Complexity:** The space complexity is primarily determined by the output file size, which grows linearly with the number of tokens identified, \( O(t) \), where \( t \) is the total number of tokens across all lines.

## Ethical Considerations

The development of syntax highlighting tools like the `Lexer` module can greatly enhance readability and accessibility of code, promoting inclusivity in programming. However, there are several ethical considerations:

- **Bias and Fairness:** Tools should equally support various programming languages and not favor one over another, avoiding bias in development ecosystems.
- **Accessibility:** Ensuring that the output formats are accessible to individuals with disabilities, such as color blindness, is crucial.
- **Data Security:** When processing files, it is important to ensure that sensitive data is not inadvertently exposed or misused.

## Conclusion

The Lexer module effectively demonstrates the application of Elixir for syntax highlighting, leveraging regex for tokenization. While efficient for small to medium-sized files, scalability concerns might arise with very large files due to the cumulative cost of regex operations. Ethically, the tool promotes a more inclusive and accessible programming environment, though it also necessitates careful consideration of bias and data security. Future improvements could focus on optimizing regex efficiency and enhancing support for a wider range of programming languages.
