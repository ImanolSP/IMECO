# Lexer Implementation Report
Imanol Santisteban Piñeirua
## Solution Overview

The Elixir module `Lexer` is designed to read a Elixir file, highlight syntax elements using HTML tags, and output the results in an HTML file. The solution processes the file line by line, identifying and styling tokens such as keywords, comments, functions, and more, based on predefined regular expressions.

## Algorithm Efficiency

The main algorithm involves streaming the file line by line and recursively processing each line through a series of regex matches that identify different types of tokens. Each line is processed independently, and regex operations are performed until the line is empty of possible tokens.

**The RegEx used for each token were:**

**Comments:** ^#.*$

**Space:** ^\s+

**Keyword:** ^\b(def|defmodule|fn|defp|do|nil|end|case|cond|if|else|do|when|after|in|catch|rescue|true|false)\b

**Modules**:^\b([A-Z]\w*)

**Functions**: ^\b( \w+ )(?=\s*\()

**Numbers**:^\d+

**Variables**: ^\b\w+\b

**Atoms**: ^:\b\w+\b

**Operators**: ^( \-> | \|> | ! |\-\- | \+\+ | &&| \ | \ | | \* | \+ | \- | \/ | > | < | <> | \( | \) | \= | \ |)

**Symbols**:^[ {} [\] () , . :]

**Strings**: ^(['"])(?:(?=(\\?))\2.)*?\1

**Regex**: ^(\~r.*\/)


### Complexity Analysis

- **Time Complexity:** 

While this process is efficient for most cases, the time complexity int the worst case scenario can reach O(n^2). This arises from the nested loops that are found within the code.

Imagine a loop iterating through each line of the file (n lines). Inside that loop, another loop attempts to match the line's beginning against various patterns for different token types (comments, keywords, etc.). In the worst case, none of these initial patterns might match, leading to further recursive calls that essentially re-analyze the entire remaining line. This creates a nested loop structure, where the number of iterations within the inner loop depends on the input content. With a large number of lines (n) and a high chance of not finding any initial matches, the complexity can now become O(n^2).It's important to denote that this would be the worst case scenario,if the matches are found quickly, the code is fairly optimal.


- **Space Complexity:** The space complexity is primarily determined by the output file size, which grows linearly with the number of tokens identified, \( O(t) \), where \( t \) is the total number of tokens across all lines.

## Ethical Considerations

The development of syntax highlighting tools like the `Lexer` module can improve readability and accessibility of code. However, there are several ethical considerations:

- **Accessibility:** Ensuring that the output formats are accessible to individuals with disabilities, such as color blindness, is crucial.Although my lexer isn't as sophisticated as one may think, the .css file is attached in this same repository, so that anyone that has the files, can choose the colors they want for each token

- **Data Security:** When processing files, it is important to ensure that sensitive data is not inadvertently exposed or misused.



## Conclusion

The Lexer module demonstrates the application of Elixir for syntax highlighting, and the use of regex to find the different tokens. While efficient for small to medium-sized files, scalability concerns might arise with very large files due to the cost of regex operations. Ethically, the tool promotes a more inclusive and accessible programming environment, though it also needs careful consideration of data security. Future improvements could focus on optimizing regex efficiency and enhancing support for a wider range of programming languages.
