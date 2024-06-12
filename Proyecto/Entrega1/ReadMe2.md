# Parallel Lexer Implementation Report
Imanol Santisteban Piñeirua
13/06/2024
### SPEED-UP 

For this activity, we were tasked with creating a program that highlights text depending on the token.This program has 2 approaches, one, is a sequential implementation, whilst the other is a Prallel one, each one calculates the same, the main difference is the speed of each one

The sequential implenetation is using only 1 thread, that means only 1 task at a time is compleated, while on the other hand , the parallel implentation uses multiple threads.

The way the code works, is the following:

 ###### For the sequential implementation
 Open the file on your code editor, open a terminal window, you must be inside the folder to run the program, once you are inside the folder, type "elixir lexer_optimized.exs "Pruebas_y_Output"", once that is all set and done, click enter, this will take a little while if the files you chose are bigger, the bigger the files, the longer it will take, once the operations are complete, the result will appaer isnide the "Pruebas_y_output". While on th terminal, the time it took will be displayed

 ###### For the parallel implementation
Open the file on your code editor, open a terminal window, you must be inside the folder to run the program, once you are inside the folder, type "elixir lexer_optimized_parallel.exs "Pruebas_y_Output" ", once that is all set and done, click enter, this will take a little while if the files you chose are bigger, the bigger the files, the longer it will take, once the operations are complete, the result will appaer isnide the "Pruebas_y_output". While on th terminal, the time it took will be displayed

 ###### Speed-up
 When running both programs with the same files, we found that:

 $S_p=\frac{T_1}{T_p}=0.7255966551$

 $S_p=\frac{1.456327}{1.056706}=1.378176144$


$\bold{p}$: Refers to the number of processors (or cores) used in the parallel computation.

$\bold{T_1}$: This is the execution time of the sequential version of the program, which serves as a baseline for measuring the improvement.

$\bold{T_p}$: Represents the execution time of the parallel version of the program when using p processors.

$\bold{S_p}$: Speedup, calculated by dividing T1 by Tp, indicates how much faster the parallel execution is compared to the sequential execution.

The parallel implementation was done with 12 cores.
### Results Analysis

The sequential version averaged an execution time of 1.45 seconds, while the parallel version averaged 1.05 seconds. This yielded a speedup of approximately 1.38, indicating that the parallel version is 38% faster than the sequential one. This demonstrates the advantage of parallel processing in decreasing the overall time needed to analyze and apply syntax highlighting across multiple files.

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
  