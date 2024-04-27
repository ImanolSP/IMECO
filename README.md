# IMECO
## Lexer
### Created by Imanol Santisteban
#### 26/04/2024
This Repository contains the arithmetic lexer, this lexer parses the different elements of an input and detects if is an int, var, space, exponential,parenthesis,float, etc.

For this project, the device must have Elixir installed in order to work correctly.Once installed, the user shall move through the terminal until reaching the folder that contains the 06_dfa.exs file, once in the same folder, go to the terminal and type "iex file_name", once this is done, the elixir interactive shell will open, now, to try out the code use "Parsing.TokenList.arithemtic_lexer()". In the parameter, enter the expression to be evaluated inside double quotations "". And voilà.

## Transition function
$Q$= { :var, :int, :par_op, :par_cl, :space, :exp}

$\delta$=

| Current | :var      | :int  | :par_op | :par_cl | :space | :exp  | :dot  | :op   | :sign |
|---------|-----------|-------|---------|---------|--------|-------|-------|-------|-------|
| :start  | :var      | :int  | :par_op | :fail   | :space | :fail | :fail  | :fail   | :sign |
| :var    | :var      | :fail | :fail   | :par_cl | :space | :fail | :fail | :op   | :fail |
| :int    | :fail     | :int  | :fail   | :par_cl | :space | :expo | :dot  | :op   | :fail |
| :par_op | :var      | :int  | :fail   | :fail   | :space | :fail | :dot  | :fail | :sign |
| :par_cl | :fail     | :fail | :fail   | :fail   | :space | :fail | :fail | :op   | :fail |
| :space  | :var      | :int  | :par_op | :fail   | :space | :fail | :dot  | :op   | :sign |
| :dot    | :fail     | :float| :fail   | :fail   | :space | :fail | :fail | :fail | :fail |
| :float  | :fail     | :float| :fail   | :par_cl | :space | :expo | :fail | :op   | :fail |
| :op     | :var      | :int  | :par_op | :fail   | :space | :fail | :dot  | :fail | :sign |
| :sign   | :fail     | :int  | :fail   | :fail   | :space | :fail | :dot  | :fail | :fail |
| :sign2  | :fail     | :exp  | :fail   | :fail   | :space | :fail | :fail | :fail | :fail |
| :expo   | :fail     | :exp  | :fail   | :fail   | :space | :fail | :fail | :op   | :sign2|
| :exp    | :fail     | :exp  | :fail   | :par_cl | :space | :fail | :fail | :op   | :fail |
| :fail   | :fail     | :fail | :fail   | :fail   | :fail  | :fail | :fail | :fail | :fail |

$q0$={:start}

$\Sigma$= {var, int, par_op, par_cl, space, exp,dot}

$F$={:int, :float, :var, :exp, :par_close, :space}

The automata for this work is in the State_diagaram.pdf file.

