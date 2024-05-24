##Imanol Santisteban
## 21/05/24

defmodule Lexer do
  def read_file(file, output) do
    # Open the output file for writing and create if it doesn't exist
    {:ok, out_fd} = File.open(output, [:write, :binary])

    # Write the HTML header once at the beginning
    header = "<!DOCTYPE html>\n<html>\n<head>\n<title>File Content</title>\n<link rel=\"stylesheet\" href=\"style.css\">\n</head>\n<body>\n<div id=\"code-content\">\n"
    IO.binwrite(out_fd, header)

    # Process each line in the file
    File.stream!(file)
    |> Enum.each(fn line -> search_comments(line, out_fd) end)

    # Close the div and the HTML tags at the end of the file
    footer = "</div>\n</body>\n</html>"
    IO.binwrite(out_fd, footer)

    # Close the output file descriptor
    File.close(out_fd)
  end

  defp search_comments(line, out_fd) do
    if String.length(line) > 0  do
      case Regex.run(~r/^#.*$/, line) do
        nil -> search_spaces(line,out_fd)
        [found] ->
          len = String.length(found)
          {first_part, second_part} = String.split_at(line,len)
          insert_into_html(found, "comment", out_fd)
          search_comments(second_part, out_fd)
      end
    end
  end

  defp search_spaces(line,out_fd) do
    if String.length(line) > 0  do
      case Regex.run(~r/^\s+/, line) do
        nil -> search_keywords(line, out_fd)
        [found] ->
          len = String.length(found)
          {first_part, second_part} = String.split_at(line,len)
          insert_into_html(found, "space", out_fd)
          search_comments(second_part, out_fd)
      end
    end
  end

  defp search_keywords(line, out_fd) do
    if String.length(line) > 0  do
      case Regex.run(~r/^\b(def|defmodule|fn|defp|do|nil|end|case|cond|if|else|do|when|after|in|catch|rescue|true|false)\b/, line) do
        nil -> search_modules(line,out_fd) ##no encontro nada
        [found|_rest] ->
          IO.inspect(line)
          IO.inspect(found)
          len = String.length(found)
          {_first_part, second_part} = String.split_at(line, len)
          insert_into_html(found, "keyword", out_fd)
          search_comments(second_part, out_fd)
      end
    end
  end
  defp search_modules(line,out_fd) do
    if String.length(line) > 0  do
      IO.inspect(line)
      case Regex.run(~r/^\b([A-Z]\w*)/, line) do
        nil -> search_function(line,out_fd)
        [found|_rest] ->
            IO.inspect(found)
          len = String.length(found)
          {first_part, second_part} = String.split_at(line,len)
          insert_into_html(found, "module", out_fd)
          search_comments(second_part, out_fd)
      end
    end
  end

  defp search_function(line,out_fd) do
    if String.length(line) > 0  do
      IO.inspect(line)
      case Regex.run(~r/^\b(\w+)(?=\s*\()/, line) do
        nil -> search_nums(line,out_fd)
        [found|_rest] ->
            IO.inspect(found)
          len = String.length(found)
          {first_part, second_part} = String.split_at(line,len)
          insert_into_html(found, "function", out_fd)
          search_comments(second_part, out_fd)
      end
    end
  end

  defp search_nums(line,out_fd)do
    if String.length(line) > 0  do
      IO.inspect(line)
      case Regex.run(~r/^\d+/, line) do
        nil -> search_variables(line,out_fd)
        [found|_rest] ->

          IO.inspect(found)
          len = String.length(found)
          {first_part, second_part} = String.split_at(line,len)
          insert_into_html(found, "number", out_fd)
          search_comments(second_part, out_fd)
      end
    end
  end

  defp search_variables(line,out_fd)do
    if String.length(line) > 0  do
      IO.inspect(line)
      case Regex.run(~r/^\b\w+\b/, line) do
        nil -> search_atoms(line,out_fd)
        [found|_rest] ->
            IO.inspect(found)
          len = String.length(found)
          {first_part, second_part} = String.split_at(line,len)
          insert_into_html(found, "variable", out_fd)
          search_comments(second_part, out_fd)
      end
    end
  end

  defp search_atoms(line,out_fd)do
    if String.length(line) > 0  do
      IO.inspect(line)
      case Regex.run(~r/^:\b\w+\b/, line) do
        nil -> search_operators(line,out_fd)
        [found|_rest] ->
            IO.inspect(found)
          len = String.length(found)
          {first_part, second_part} = String.split_at(line,len)
          insert_into_html(found, "atom", out_fd)
          search_comments(second_part, out_fd)
      end
    end
  end

  defp search_operators(line,out_fd) do

    if String.length(line) > 0  do
      IO.inspect(line)
      case Regex.run(~r/^(\->|\|>|\-\-|\+\+|&&|!|\|\||\*|\+|\-|\/|>|<|<>|\(|\)|\=|\|)/, line) do
        nil -> search_regex(line,out_fd)
        [found|_rest] ->
            IO.inspect(found)
          len = String.length(found)
          {first_part, second_part} = String.split_at(line,len)
          insert_into_html(found, "operator", out_fd)
          search_comments(second_part, out_fd)
      end
    end
  end

  defp search_regex(line,out_fd) do
    if String.length(line) > 0  do
      IO.inspect(line)
      case Regex.run(~r/^(\~r.*\/)/, line) do
        nil -> search_symbols(line,out_fd)
        [found|_rest] ->
            IO.inspect(found)
          len = String.length(found)
          {first_part, second_part} = String.split_at(line,len)
          insert_into_html(found, "regex", out_fd)
          search_comments(second_part, out_fd)
      end
    end
  end

  defp search_symbols(line,out_fd) do

    if String.length(line) > 0  do
      IO.inspect(line)
      case Regex.run(~r/^[{}[\](),.:]/,line) do
        nil -> search_strings(line,out_fd)
        [found|_rest] ->
            IO.inspect(found)
          len = String.length(found)
          {first_part, second_part} = String.split_at(line,len)
          insert_into_html(found, "symbol", out_fd)
          search_comments(second_part, out_fd)
      end
    end
  end

  defp search_strings(line,out_fd) do

    if String.length(line) > 0  do
      IO.inspect(line)
      case Regex.run(~r/^(['"])(?:(?=(\\?))\2.)*?\1/,line) do
        nil -> :ok
        [found|_rest] ->
            IO.inspect(found)
          len = String.length(found)
          {first_part, second_part} = String.split_at(line,len)
          insert_into_html(found, "string", out_fd)
          search_comments(second_part, out_fd)
      end
    end
  end


  defp insert_into_html(match, element, out_fd) do
    content = case element do
      "space" -> "<span class=\"#{element}\">#{match}</span>"
      _ -> "<span class=\"#{element}\">#{match}</span>\n"
    end
    IO.binwrite(out_fd, content)
  end
end

[infile,outfile]=System.argv()
Lexer.read_file(infile,outfile)
