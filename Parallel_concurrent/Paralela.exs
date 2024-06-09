defmodule Hw.Primes do
  # Function to check if a number is prime
  defp is_prime(n) when n < 2 do
    false
  end
  defp is_prime(2), do: true

  defp is_prime(n) do
    # checamos
    limit = n |> :math.sqrt() |> Float.ceil() |> trunc()
    # If no divisors are found from 2 to limit, then n is prime
    Enum.all?(2..limit, fn i -> rem(n, i) != 0 end)
  end

  # Function to sum primes in a given range
  def sum_primes_range(start_range, end_range) do
    start_range..end_range
    |> Enum.filter(&is_prime/1)  # Wre filter the range with the is_prime function, so all the prime numbers are fileterd
    |> Enum.sum()               # Sum the filtered numbers
  end

  def measure_time(start_range, end_range) do
    {time, result} = :timer.tc(Hw.Primes, :sum_primes_range, [start_range, end_range])
    IO.puts("Execution time: #{time / 1_000_000} seconds")
    IO.puts("Result of summing primes: #{result}")
  end
#################################################################################################
  def parallel_sum_primes(start_range, end_range,cores) do
    num_cores = if cores === 0, do: System.schedulers_online(), else: cores #In case the user doesnt know how many cores the computer has, he will input 0, and the program will find the available cores

    IO.puts(num_cores)  # Number of available cores
    chunk_size = div(end_range - start_range, num_cores) |> max(1)  # Ensure that the chunk doesn't have a 0 value
    total_numbers = end_range - start_range + 1
    num_tasks = min(num_cores, total_numbers)
    0..(num_tasks - 1)
    |> Enum.map(fn i ->
      subrange_start = start_range + i * chunk_size
      subrange_end = if i == num_cores - 1, do: end_range, else: subrange_start + chunk_size - 1
      #IO.puts(subrange_start)
      #IO.inspect(subrange_end)
      Task.async(fn -> sum_primes_range(subrange_start, subrange_end) end)
    end)
    |> Enum.map(&Task.await/1)  # Await results
    |> Enum.sum()  # Sum results from all tasks
  end

  def measure_time2(start_range, end_range,cores) do
    {time, result} = :timer.tc(Hw.Primes, :parallel_sum_primes, [start_range, end_range,cores])
    IO.puts("Execution time: #{time / 1_000_000} seconds")
    IO.puts("Result of summing primes: #{result}")
  end

end
