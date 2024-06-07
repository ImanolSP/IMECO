defmodule Lexer2 do

  def file_input(path)do
    files = File.ls!(path)

    Enum.map(files, fn file ->

      full_path = Path.join(path, file)
      read_file(full_path)
    end)

  end
# Reads a file and writes syntax-highlighted HTML output.
  def read_file(file) do
    output = file <>".html"
    # Opens the output file for writing in binary mode.
    {:ok, out_fd} = File.open(output, [:write, :binary])
    # HTML header setup with a reference to a CSS stylesheet.
    header = "<!DOCTYPE html>\n<html>\n<head>\n<title>File Content</title>\n<link rel=\"stylesheet\" href=\"../style.css\">\n</head>\n<body>\n<div id=\"code-content\">\n"
    # Write the HTML header to the output file.
    IO.binwrite(out_fd, header)
# Stream the input file and process each line for syntax highlighting.

    File.stream!(file)
    |> Enum.each(fn line -> search_comments(line, out_fd) end)
# HTML footer setup.
    footer = "</div>\n</body>\n</html>"
    IO.binwrite(out_fd, footer)
    File.close(out_fd)
  end
# Handles the detection and highlighting of comments.
  defp search_comments(line, out_fd) do
    search(line, out_fd, ~r/^#.*$/, "comment", &search_spaces/2)
  end
# Handles the detection and highlighting of spaces.
  defp search_spaces(line, out_fd) do
    search(line, out_fd, ~r/^\s+/, "space", &search_keywords/2)
  end
# Handles the detection and highlighting of keywords.
  defp search_keywords(line, out_fd) do
    search(line, out_fd, ~r/^\b(def|defmodule|fn|defp|do|nil|end|case|cond|if|else|do|when|after|in|catch|rescue|true|false|use|alias|test|assert)\b/, "keyword", &search_modules/2)
  end
# Handles the detection and highlighting of modules.
  defp search_modules(line, out_fd) do
    search(line, out_fd, ~r/^\b([A-Z]\w*)/, "module", &search_function/2)
  end
# Handles the detection and highlighting of functions.
  defp search_function(line, out_fd) do
    search(line, out_fd, ~r/^\b(\w+)(?=\s*\()/, "function", &search_nums/2)
  end
# Handles the detection and highlighting of nums.
  defp search_nums(line, out_fd) do
    search(line, out_fd, ~r/^\d+/, "number", &search_variables/2)
  end
# Handles the detection and highlighting of variables.
  defp search_variables(line, out_fd) do
    search(line, out_fd, ~r/^\b\w+\b/, "variable", &search_atoms/2)
  end
# Handles the detection and highlighting of atoms.
  defp search_atoms(line, out_fd) do
    search(line, out_fd, ~r/^:\b\w+\b/, "atom", &search_operators/2)
  end
# Handles the detection and highlighting of operatoes.
  defp search_operators(line, out_fd) do
    search(line, out_fd, ~r/^(\->|\|>|\-\-|\+\+|&&|!|\|\||\*|\+|\-|\/\/|\/|>|<|<>|\\|\(|\)|\=|\|)/, "operator", &search_moduleVariables/2)
  end
# Handles the detection and highlighting of moduleVars.
  defp search_moduleVariables(line, out_fd) do
    search(line, out_fd, ~r/(\@\w+)/, "ModuleVar", &search_regex/2)
  end
# Handles the detection and highlighting of regex.
  defp search_regex(line, out_fd) do
    search(line, out_fd, ~r/^(\~r.*\/)/, "regex", &search_symbols/2)
  end
# Handles the detection and highlighting of symbols.
  defp search_symbols(line, out_fd) do
    search(line, out_fd, ~r/^[{}[\](),.:]/, "symbol", &search_strings/2)
  end
# Handles the detection and highlighting of strings.
  defp search_strings(line, out_fd) do
    search(line, out_fd, ~r/^(['"])(?:(?=(\\?))\2.)*?\1/, "string", &search_end/2)
  end
  # Ends the recursive search.
  defp search_end(line, out_fd), do: :ok

    # End recursion

  defp search(line, out_fd, regex, token_type, continuation_function) do
# Debugging: print the current token type to the console

    # Check if the continuation function is not an :ok atom
    if continuation_function != :ok do
    if String.length(line) > 0 do
      case Regex.run(regex, line) do
        # If no match, call the continuation function with the remaining line and output file descriptor.
        nil -> continuation_function.(line, out_fd)
        # If a match is found, handle the found text and the remainder of the line.
        [found | _rest] ->
           # Calculate the length of the matched text.
          len = String.length(found)
          # Split the line into the matched text and the part after the match.
          {_, second_part} = String.split_at(line, len)
           # Insert the matched text into the HTML with proper styling.
          insert_into_html(found, token_type, out_fd)
          # Continue searching for comments in the remainder of the line.If none are found, it will go to the next function
          search_comments(second_part,out_fd)
      end
    end
  end
  end
#Function to insert each elemt with the corresponding tag into the output file
  defp insert_into_html(match, element, out_fd) do
    content = "<span class=\"#{element}\">#{match}</span>\n"
    IO.binwrite(out_fd, content)
  end

  def measure_time(path)do
    {time, result} = :timer.tc(Lexer2, :file_input, [path])
    IO.puts("Execution time: #{time / 1_000_000} seconds")
  end
end
#Usage of the code from terminal without entering elixir interactive shell (iex)
[path]=System.argv()
Lexer2.measure_time(path)
