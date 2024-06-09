### SPEED-UP 

For this activity, we were tasked with creating a program that sums the prime nubers inside a specified range.This program has 2 approaches, one, is a sequential implementation, whilst the other is a Prallel one, each one calculates the same, the main difference is the speed of each one

The sequential implenetation is using only 1 thread, that means only 1 task at a time is compleated, while on the other hand , the parallel implentation uses multiple threads.

The way the code works, is the following:

 ###### For the sequential implementation
 Open the file on your code editor, open a terminal window, you must be inside the folder to run the program, once you are inside the folder, type "iex<filename\>", this will open elixir's interactive shell, once isnide, you will run the program with "Hw.Primes.measure_time(start_range,end_range)", the values of start, and end range are at your disposal, once that is all set and done, click enter, this will take a little while if the range you chose is bigger, the bigger the range, the longer it will take, once the operations are complete, the output will diplay the result of summing all the primes isnide the range, and the time it took to execute it.

 ###### For the parallel implementation
 Open the file on your code editor, open a terminal window, you must be inside the folder to run the program, once you are inside the folder, type "iex<filename\>", this will open elixir's interactive shell, once isnide, you will run the program with "Hw.Primes.measure_time2(start_range,end_range,cores)", the values of start, and end range are at your disposal,for people who are now to the cores and multithreading, is best if you input 0 in the cores field, this filed is used to ask the user how many cores they want to use in order to run the program, when the input is 0, it will automatically dinf all available cores. Once that is all set and done, click enter, this will take a little while if the range you chose is bigger,or if the amount of cores is smaller, the bigger the range and lesser the amount of cores, the longer it will take, once the operations are complete, the output will diplay the result of summing all the primes isnide the range, and the time it took to execute it.

 ###### Speed-up
 When running both programs with the same range (0-5000000), we found that:

 $S_p=\frac{T_1}{T_p}=5.728896935$

$\bold{p}$: Refers to the number of processors (or cores) used in the parallel computation.

$\bold{T_1}$: This is the execution time of the sequential version of the program, which serves as a baseline for measuring the improvement.

$\bold{T_p}$: Represents the execution time of the parallel version of the program when using p processors.

$\bold{S_p}$: Speedup, calculated by dividing T1 by Tp, indicates how much faster the parallel execution is compared to the sequential execution.

The parallel implementation was done with 12 cores.