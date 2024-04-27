# Imanol Santisteban
# Finite Automatons
# Return a list of the types of tokens
# An automaton is defined by M(Q,SIGMA,DELTA,F,q_0)
# 2024-04-16
defmodule Parsing.TokenList do
  # An aoutoamat argument is expressde as
  # {delta,accept, q0}
  def arithmetic_lexer(string) do
    automata =
      {&Parsing.TokenList.delta_int_arithmetic/2, [:int, :float, :var, :exp, :par_close, :space],
       :start}

    string
    |> String.graphemes()
    |> eval_dfa(automata, [], [])
  end

  def eval_dfa([char | tail], {delta, accept, state}, tokens, temp) do
    [new_state, token_complete, new_temp] = delta.(state, char)

    cond do
      token_complete ->
        eval_dfa(
          tail,
          {delta, accept, new_state},
          [{token_complete, Enum.reverse(temp) |> Enum.join("")} | tokens],
          [new_temp | []]
        )

      true ->
        if state == :space and new_state != :space do
          eval_dfa(tail, {delta, accept, new_state}, tokens, [char])
        else
          eval_dfa(tail, {delta, accept, new_state}, tokens, [char | temp])
        end
    end
  end

  def eval_dfa([], {_delta, accept, state}, tokens, temp) do
    cond do
      Enum.member?(accept, state) and temp != [] and temp != [nil] ->
        Enum.reverse([{state, Enum.reverse(temp) |> Enum.join("")} | tokens])

      Enum.member?(accept, state) ->
        Enum.reverse(tokens)

      true ->
        false
    end
  end

  def delta_int_arithmetic(state, char) do
    case state do
      :start ->
        cond do
          is_digit(char) -> [:int, false, false]
          is_posorneg(char) -> [:sign, false, false]
          is_var(char) -> [:var, false, false]
          is_op_par(char) -> [:par_open, false, false]
          is_space(char) -> [:space, false, nil]
          true -> [:fail, false, false]
        end

      :int ->
        cond do
          is_digit(char) -> [:int, false, false]
          is_operator(char) -> [:oper, :int, char]
          is_dot(char) -> [:dot, false, false]
          is_exp(char) -> [:expo, false, false]
          is_cl_par(char) -> [:par_close, :int, char]
          is_space(char) -> [:space, :int, nil]
          true -> [:fail, false, false]
        end

      :dot ->
        cond do
          is_digit(char) -> [:float, false, false]
          true -> [:fail, false, false]
        end

      :float ->
        cond do
          is_operator(char) -> [:oper, :float, char]
          is_digit(char) -> [:float, false, false]
          is_exp(char) -> [:expo, false, false]
          is_cl_par(char) -> [:par_close, :float, char]
          is_space(char) -> [:space, :float, nil]
          true -> [:fail, false, false]
        end

      :oper ->
        cond do
          is_digit(char) -> [:int, :oper, char]
          # is_operator(char) -> [:sign, :oper, char]
          is_posorneg(char) -> [:sign, :oper, char]
          is_var(char) -> [:var, :oper, char]
          is_op_par(char) -> [:par_open, :oper, char]
          is_space(char) -> [:space, :oper, nil]
          true -> [:fail, false, false]
        end

      :sign ->
        cond do
          is_digit(char) -> [:int, false, false]
          is_var(char) -> [:var, false, false]
          true -> [:fail, false, false]
        end

      :sign2 ->
        cond do
          is_digit(char) -> [:exp, false, false]
          true -> [:fail, false, false]
        end

      :expo ->
        cond do
          is_posorneg(char) -> [:sign2, false, false]
          is_digit(char) -> [:exp, false, false]
          true -> [:fail, false, false]
        end

      :exp ->
        cond do
          is_digit(char) -> [:exp, false, false]
          is_operator(char) -> [:oper, :exp, char]
          is_cl_par(char) -> [:par_close, :exp, char]
          true -> [:fail, false, false]
        end

      :var ->
        cond do
          is_operator(char) -> [:oper, :var, char]
          is_var(char) -> [:var, false, false]
          is_cl_par(char) -> [:par_close, :var, char]
          is_space(char) -> [:space, :var, nil]
          true -> [:fail, false, false]
        end

      :par_open ->
        cond do
          is_posorneg(char) -> [:sign, :par_open, char]
          is_digit(char) -> [:int, :par_open, char]
          is_space(char) -> [:space, :par_open, nil]
          is_var(char) ->[:var,:par_open,char]
          :fail -> [:fail, false, false]
        end

      :par_close ->
        cond do
          is_operator(char) -> [:oper, :par_close, char]
          is_space(char) -> [:space, :par_close, nil]
          :fail -> [:fail, false, false]
        end

      :space ->
        cond do
          is_space(char) -> [:space, false, nil]
          is_operator(char) -> [:oper, false, false]
          is_digit(char) -> [:int, false, false]
          is_var(char) -> [:var, false, false]
          is_op_par(char) -> [:par_open, false, false]
          is_cl_par(char) -> [:par_close, false, false]
          :fail -> [:fail, false, false]
        end

      :fail ->
        [:fail, false, false]
    end
  end

  def is_digit(char) do
    "0123456789"
    |> String.graphemes()
    |> Enum.member?(char)
  end

  def is_operator(sign) do
    Enum.member?(["+", "-", "*", "/", "%", "="], sign)
  end

  def is_posorneg(char) do
    Enum.member?(["+", "-"], char)
  end

  def is_dot(char) do
    Enum.member?(["."], char)
  end

  def is_exp(char) do
    Enum.member?(["E", "e"], char)
  end

  def is_var(char) do
    "abcdefghijklmnopqrstuvwxyz_1234567890"
    |> String.graphemes()
    |> Enum.member?(char)
  end

  def is_op_par(char) do
    Enum.member?(["("], char)
  end

  def is_cl_par(char) do
    Enum.member?([")"], char)
  end

  def is_space(char) do
    Enum.member?([" "], char)
  end
end
