# Imanol Santisteban Piñeirua
# 08/03/2024

defmodule Hw.Ariel1 do
@variable 3
  def invert(list), do: do_invert(list,[])
  defp do_invert([],res), do: res
  defp do_invert([head|tail],res), do: do_invert(tail,[head|res])

  def size(lista), do: size_res(lista,0)
  defp size_res([],a), do: a
  defp size_res(lista,a), do: size_res(lista|>tl,a+1)

  def celciusaF(valor) do

    (valor*9/5) +32
  end

  def fahrenheit_to_celsius(valor)do
    (valor-32)*5/9
  end

  def sign(num) do
  cond do

          num>0 ->1
          num<0 ->-1
          true ->0

        end
      end

  ############
  def roots(a,b,c) do
    val= b**2-(4*a*c)
    if(val>0) do
    (-b + :math.sqrt(val))/(2*a)
    else
      (-b - :math.sqrt(val))/(2*a)
    end

  end

  def bmi(peso,estatura) do
    val= peso/(estatura**2)
     cond do
     val<20 -> :underweight
     val>20 && val<25 -> :normal
     val>25 && val<30 -> :obese1
     val>30 && val<40 -> :obese2
      true -> :obese3

     end
   end

  def factorial(n), do: factorial(n,1)
  defp factorial(n,_a) when n<0, do: :error
  defp factorial(0,a), do: a
  defp factorial(n,a), do: factorial(n-1,a*n)

  def duplicate(list), do: do_duplicate(list,[])
  defp do_duplicate([],res), do: invert(res)
  defp do_duplicate([head|tail], res), do: do_duplicate(tail,[head,head|res])

  def pow(num,power), do: pow_res(num,power)
  defp pow_res(num,1), do: num
  defp pow_res(_num,0), do: 1
  defp pow_res(num,power), do: num * pow_res(num,power-1)


  def fib(num) do
  if num==0 do
      0
  else
    if num==1 do
      1

    else
    fib(num-1)+fib(num-2)
      end
    end
  end

  def fibonacci1(num), do: fibonacci2(num)
  def fibonacci2(0), do: 0
  def fibonacci2(1), do: 1
  def fibonacci2(num) when num > 1 do
    fibonacci2(num - 1) + fibonacci2(num - 2)
  end



  def enlist(list), do: do_enlist(list,[])
  defp do_enlist([],res), do: invert(res)
  defp do_enlist([head|tail],res), do: do_enlist(tail,[[head]|res])

  ##########HOMEWORK################
  def positives(list), do: do_positives(list,[])
  defp do_positives([],res), do: invert(res)
  defp do_positives([head|tail],res) do
  cond do

    head>0 -> do_positives(tail,[head|res])

    true->do_positives(tail,res)

  end

  end
  ##################################

  def add_list(lista), do: do_addlist(lista,0)
  defp do_addlist([],res), do: res
  defp do_addlist([head|tail],res), do:  do_addlist(tail,head+res)
  ##########HOMEWORK################
  def invert_pairs(list), do: do_invert_pairs(list,[])
  defp do_invert_pairs([],res), do: invert(res)
  defp do_invert_pairs([{head, next_head}|tail],res), do: do_invert_pairs(tail,[{next_head,head}|res])
  ##################################
  def is_atom_list(list), do: do_is_atom_list(list,[])
  defp do_is_atom_list([],_res), do: true
  defp do_is_atom_list([head|tail],res) do
  cond do

    is_atom(head) -> do_is_atom_list(tail,[head|res])
    true -> false

  end
  end


  def swapper(list,a,b), do: do_swapper(list,a,b,[])
  defp do_swapper([],_a,_b,res), do: invert(res)
  defp do_swapper([head|tail],a,b,res) do
    cond do
      head==a-> do_swapper(tail,a,b,[b|res])
      head==b-> do_swapper(tail,a,b,[a|res])
      true -> do_swapper(tail,a,b,[head|res])


    end
    end


  ##########HOMEWORK################
  def dot_product(lista, listb), do: do_dot_product(lista, listb, 0)
  defp do_dot_product([], [], res), do: res
  defp do_dot_product([head | tail], [head1 | tail1], res), do: do_dot_product(tail, tail1, res + head * head1)
  ##################################

  def average(list), do: do_average(list,0,size(list))
  defp do_average([],_n,numbe) when numbe==0, do: 0
  defp do_average([],n,numbe), do: n/numbe
  defp do_average([head|tail],n,numbe), do: do_average(tail,n+head,numbe)

  def std_dev(list), do: do_std_dev(list,average(list),size(list),0)
  defp do_std_dev([],_mean,n,_stdev) when n==0, do: 0
  defp do_std_dev([],_mean,n,stdev), do: :math.sqrt(stdev*(1/n))
  defp do_std_dev([head|tail],mean,n,stdev), do: do_std_dev(tail,mean,n,stdev + pow((head-mean),2))
  ##########HOMEWORK################
  def replic(n, lst), do: do_replicate(n, lst, [], n)
  defp do_replicate(_n, [], res, _numb), do: invert(res)
  defp do_replicate(n, lst, res, numb) when n > 0, do: do_replicate(n - 1, lst, [hd(lst) | res], numb)
  defp do_replicate(n, lst, res, numb), do: do_replicate(n + numb, tl(lst), res, numb)
  ##################################
  def expand(lst), do: do_expand(lst, 1, [], 1)
  defp do_expand([], _n, res, _curr), do: invert(res)
  defp do_expand([_head | tail], n, res, curr) when n == 0, do: do_expand(tail, curr + 1, res, curr + 1)
  defp do_expand([head | tail], n, res, curr),  do: do_expand([head | tail], n - 1, [head | res], curr)

  ##########HOMEWORK################
  def binary(n), do: do_binary(n, [])
  defp do_binary(n, res) when n == 0, do: res
  defp do_binary(n, res), do: do_binary(div(n, 2), [rem(n, 2) | res])
  ##################################


  end
  # Imanol Santisteban Piñeirua
# 08/03/2024

defmodule Hw.Ariel1 do
  @variable 3
    def invert(list), do: do_invert(list,[])
    defp do_invert([],res), do: res
    defp do_invert([head|tail],res), do: do_invert(tail,[head|res])

    def size(lista), do: size_res(lista,0)
    defp size_res([],a), do: a
    defp size_res(lista,a), do: size_res(lista|>tl,a+1)

    def celciusaF(valor) do

      (valor*9/5) +32
    end

    def fahrenheit_to_celsius(valor)do
      (valor-32)*5/9
    end

    def sign(num) do
    cond do

            num>0 ->1
            num<0 ->-1
            true ->0

          end
        end

    ############
    def roots(a,b,c) do
      val= b**2-(4*a*c)
      if(val>0) do
      (-b + :math.sqrt(val))/(2*a)
      else
        (-b - :math.sqrt(val))/(2*a)
      end

    end

    def bmi(peso,estatura) do
      val= peso/(estatura**2)
       cond do
       val<20 -> :underweight
       val>20 && val<25 -> :normal
       val>25 && val<30 -> :obese1
       val>30 && val<40 -> :obese2
        true -> :obese3

       end
     end

    def factorial(n), do: factorial(n,1)
    defp factorial(n,_a) when n<0, do: :error
    defp factorial(0,a), do: a
    defp factorial(n,a), do: factorial(n-1,a*n)

    def duplicate(list), do: do_duplicate(list,[])
    defp do_duplicate([],res), do: invert(res)
    defp do_duplicate([head|tail], res), do: do_duplicate(tail,[head,head|res])

    def pow(num,power), do: pow_res(num,power)
    defp pow_res(num,1), do: num
    defp pow_res(_num,0), do: 1
    defp pow_res(num,power), do: num * pow_res(num,power-1)


    def fib(num) do
    if num==0 do
        0
    else
      if num==1 do
        1

      else
      fib(num-1)+fib(num-2)
        end
      end
    end

    def fibonacci1(num), do: fibonacci2(num)
    def fibonacci2(0), do: 0
    def fibonacci2(1), do: 1
    def fibonacci2(num) when num > 1 do
      fibonacci2(num - 1) + fibonacci2(num - 2)
    end



    def enlist(list), do: do_enlist(list,[])
    defp do_enlist([],res), do: invert(res)
    defp do_enlist([head|tail],res), do: do_enlist(tail,[[head]|res])

    ##########HOMEWORK################
    def positives(list), do: do_positives(list,[])
    defp do_positives([],res), do: invert(res)
    defp do_positives([head|tail],res) do
    cond do

      head>0 -> do_positives(tail,[head|res])

      true->do_positives(tail,res)

    end

    end
    ##################################

    def add_list(lista), do: do_addlist(lista,0)
    defp do_addlist([],res), do: res
    defp do_addlist([head|tail],res), do:  do_addlist(tail,head+res)
    ##########HOMEWORK################
    def invert_pairs(list), do: do_invert_pairs(list,[])
    defp do_invert_pairs([],res), do: invert(res)
    defp do_invert_pairs([{head, next_head}|tail],res), do: do_invert_pairs(tail,[{next_head,head}|res])
    ##################################
    def is_atom_list(list), do: do_is_atom_list(list,[])
    defp do_is_atom_list([],_res), do: true
    defp do_is_atom_list([head|tail],res) do
    cond do

      is_atom(head) -> do_is_atom_list(tail,[head|res])
      true -> false

    end
    end


    def swapper(list,a,b), do: do_swapper(list,a,b,[])
    defp do_swapper([],_a,_b,res), do: invert(res)
    defp do_swapper([head|tail],a,b,res) do
      cond do
        head==a-> do_swapper(tail,a,b,[b|res])
        head==b-> do_swapper(tail,a,b,[a|res])
        true -> do_swapper(tail,a,b,[head|res])


      end
      end


    ##########HOMEWORK################
    def dot_product(lista, listb), do: do_dot_product(lista, listb, 0)
    defp do_dot_product([], [], res), do: res
    defp do_dot_product([head | tail], [head1 | tail1], res), do: do_dot_product(tail, tail1, res + head * head1)
    ##################################

    def average(list), do: do_average(list,0,size(list))
    defp do_average([],_n,numbe) when numbe==0, do: 0
    defp do_average([],n,numbe), do: n/numbe
    defp do_average([head|tail],n,numbe), do: do_average(tail,n+head,numbe)

    def std_dev(list), do: do_std_dev(list,average(list),size(list),0)
    defp do_std_dev([],_mean,n,_stdev) when n==0, do: 0
    defp do_std_dev([],_mean,n,stdev), do: :math.sqrt(stdev*(1/n))
    defp do_std_dev([head|tail],mean,n,stdev), do: do_std_dev(tail,mean,n,stdev + pow((head-mean),2))
    ##########HOMEWORK################
    def replic(n, lst), do: do_replicate(n, lst, [], n)
    defp do_replicate(_n, [], res, _numb), do: invert(res)
    defp do_replicate(n, lst, res, numb) when n > 0, do: do_replicate(n - 1, lst, [hd(lst) | res], numb)
    defp do_replicate(n, lst, res, numb), do: do_replicate(n + numb, tl(lst), res, numb)
    ##################################
    def expand(lst), do: do_expand(lst, 1, [], 1)
    defp do_expand([], _n, res, _curr), do: invert(res)
    defp do_expand([_head | tail], n, res, curr) when n == 0, do: do_expand(tail, curr + 1, res, curr + 1)
    defp do_expand([head | tail], n, res, curr),  do: do_expand([head | tail], n - 1, [head | res], curr)

    ##########HOMEWORK################
    def binary(n), do: do_binary(n, [])
    defp do_binary(n, res) when n == 0, do: res
    defp do_binary(n, res), do: do_binary(div(n, 2), [rem(n, 2) | res])
    ##################################


    end

    # Imanol Santisteban Piñeirua
# 08/03/2024

defmodule Hw.Ariel1 do
  @variable 3
    def invert(list), do: do_invert(list,[])
    defp do_invert([],res), do: res
    defp do_invert([head|tail],res), do: do_invert(tail,[head|res])

    def size(lista), do: size_res(lista,0)
    defp size_res([],a), do: a
    defp size_res(lista,a), do: size_res(lista|>tl,a+1)

    def celciusaF(valor) do

      (valor*9/5) +32
    end

    def fahrenheit_to_celsius(valor)do
      (valor-32)*5/9
    end

    def sign(num) do
    cond do

            num>0 ->1
            num<0 ->-1
            true ->0

          end
        end

    ############
    def roots(a,b,c) do
      val= b**2-(4*a*c)
      if(val>0) do
      (-b + :math.sqrt(val))/(2*a)
      else
        (-b - :math.sqrt(val))/(2*a)
      end

    end

    def bmi(peso,estatura) do
      val= peso/(estatura**2)
       cond do
       val<20 -> :underweight
       val>20 && val<25 -> :normal
       val>25 && val<30 -> :obese1
       val>30 && val<40 -> :obese2
        true -> :obese3

       end
     end

    def factorial(n), do: factorial(n,1)
    defp factorial(n,_a) when n<0, do: :error
    defp factorial(0,a), do: a
    defp factorial(n,a), do: factorial(n-1,a*n)

    def duplicate(list), do: do_duplicate(list,[])
    defp do_duplicate([],res), do: invert(res)
    defp do_duplicate([head|tail], res), do: do_duplicate(tail,[head,head|res])

    def pow(num,power), do: pow_res(num,power)
    defp pow_res(num,1), do: num
    defp pow_res(_num,0), do: 1
    defp pow_res(num,power), do: num * pow_res(num,power-1)


    def fib(num) do
    if num==0 do
        0
    else
      if num==1 do
        1

      else
      fib(num-1)+fib(num-2)
        end
      end
    end

    def fibonacci1(num), do: fibonacci2(num)
    def fibonacci2(0), do: 0
    def fibonacci2(1), do: 1
    def fibonacci2(num) when num > 1 do
      fibonacci2(num - 1) + fibonacci2(num - 2)
    end



    def enlist(list), do: do_enlist(list,[])
    defp do_enlist([],res), do: invert(res)
    defp do_enlist([head|tail],res), do: do_enlist(tail,[[head]|res])

    ##########HOMEWORK################
    def positives(list), do: do_positives(list,[])
    defp do_positives([],res), do: invert(res)
    defp do_positives([head|tail],res) do
    cond do

      head>0 -> do_positives(tail,[head|res])

      true->do_positives(tail,res)

    end

    end
    ##################################

    def add_list(lista), do: do_addlist(lista,0)
    defp do_addlist([],res), do: res
    defp do_addlist([head|tail],res), do:  do_addlist(tail,head+res)
    ##########HOMEWORK################
    def invert_pairs(list), do: do_invert_pairs(list,[])
    defp do_invert_pairs([],res), do: invert(res)
    defp do_invert_pairs([{head, next_head}|tail],res), do: do_invert_pairs(tail,[{next_head,head}|res])
    ##################################
    def is_atom_list(list), do: do_is_atom_list(list,[])
    defp do_is_atom_list([],_res), do: true
    defp do_is_atom_list([head|tail],res) do
    cond do

      is_atom(head) -> do_is_atom_list(tail,[head|res])
      true -> false

    end
    end


    def swapper(list,a,b), do: do_swapper(list,a,b,[])
    defp do_swapper([],_a,_b,res), do: invert(res)
    defp do_swapper([head|tail],a,b,res) do
      cond do
        head==a-> do_swapper(tail,a,b,[b|res])
        head==b-> do_swapper(tail,a,b,[a|res])
        true -> do_swapper(tail,a,b,[head|res])


      end
      end


    ##########HOMEWORK################
    def dot_product(lista, listb), do: do_dot_product(lista, listb, 0)
    defp do_dot_product([], [], res), do: res
    defp do_dot_product([head | tail], [head1 | tail1], res), do: do_dot_product(tail, tail1, res + head * head1)
    ##################################

    def average(list), do: do_average(list,0,size(list))
    defp do_average([],_n,numbe) when numbe==0, do: 0
    defp do_average([],n,numbe), do: n/numbe
    defp do_average([head|tail],n,numbe), do: do_average(tail,n+head,numbe)

    def std_dev(list), do: do_std_dev(list,average(list),size(list),0)
    defp do_std_dev([],_mean,n,_stdev) when n==0, do: 0
    defp do_std_dev([],_mean,n,stdev), do: :math.sqrt(stdev*(1/n))
    defp do_std_dev([head|tail],mean,n,stdev), do: do_std_dev(tail,mean,n,stdev + pow((head-mean),2))
    ##########HOMEWORK################
    def replic(n, lst), do: do_replicate(n, lst, [], n)
    defp do_replicate(_n, [], res, _numb), do: invert(res)
    defp do_replicate(n, lst, res, numb) when n > 0, do: do_replicate(n - 1, lst, [hd(lst) | res], numb)
    defp do_replicate(n, lst, res, numb), do: do_replicate(n + numb, tl(lst), res, numb)
    ##################################
    def expand(lst), do: do_expand(lst, 1, [], 1)
    defp do_expand([], _n, res, _curr), do: invert(res)
    defp do_expand([_head | tail], n, res, curr) when n == 0, do: do_expand(tail, curr + 1, res, curr + 1)
    defp do_expand([head | tail], n, res, curr),  do: do_expand([head | tail], n - 1, [head | res], curr)

    ##########HOMEWORK################
    def binary(n), do: do_binary(n, [])
    defp do_binary(n, res) when n == 0, do: res
    defp do_binary(n, res), do: do_binary(div(n, 2), [rem(n, 2) | res])
    ##################################


    end

    # Imanol Santisteban Piñeirua
# 08/03/2024

defmodule Hw.Ariel1 do
  @variable 3
    def invert(list), do: do_invert(list,[])
    defp do_invert([],res), do: res
    defp do_invert([head|tail],res), do: do_invert(tail,[head|res])

    def size(lista), do: size_res(lista,0)
    defp size_res([],a), do: a
    defp size_res(lista,a), do: size_res(lista|>tl,a+1)

    def celciusaF(valor) do

      (valor*9/5) +32
    end

    def fahrenheit_to_celsius(valor)do
      (valor-32)*5/9
    end

    def sign(num) do
    cond do

            num>0 ->1
            num<0 ->-1
            true ->0

          end
        end

    ############
    def roots(a,b,c) do
      val= b**2-(4*a*c)
      if(val>0) do
      (-b + :math.sqrt(val))/(2*a)
      else
        (-b - :math.sqrt(val))/(2*a)
      end

    end

    def bmi(peso,estatura) do
      val= peso/(estatura**2)
       cond do
       val<20 -> :underweight
       val>20 && val<25 -> :normal
       val>25 && val<30 -> :obese1
       val>30 && val<40 -> :obese2
        true -> :obese3

       end
     end

    def factorial(n), do: factorial(n,1)
    defp factorial(n,_a) when n<0, do: :error
    defp factorial(0,a), do: a
    defp factorial(n,a), do: factorial(n-1,a*n)

    def duplicate(list), do: do_duplicate(list,[])
    defp do_duplicate([],res), do: invert(res)
    defp do_duplicate([head|tail], res), do: do_duplicate(tail,[head,head|res])

    def pow(num,power), do: pow_res(num,power)
    defp pow_res(num,1), do: num
    defp pow_res(_num,0), do: 1
    defp pow_res(num,power), do: num * pow_res(num,power-1)


    def fib(num) do
    if num==0 do
        0
    else
      if num==1 do
        1

      else
      fib(num-1)+fib(num-2)
        end
      end
    end

    def fibonacci1(num), do: fibonacci2(num)
    def fibonacci2(0), do: 0
    def fibonacci2(1), do: 1
    def fibonacci2(num) when num > 1 do
      fibonacci2(num - 1) + fibonacci2(num - 2)
    end



    def enlist(list), do: do_enlist(list,[])
    defp do_enlist([],res), do: invert(res)
    defp do_enlist([head|tail],res), do: do_enlist(tail,[[head]|res])

    ##########HOMEWORK################
    def positives(list), do: do_positives(list,[])
    defp do_positives([],res), do: invert(res)
    defp do_positives([head|tail],res) do
    cond do

      head>0 -> do_positives(tail,[head|res])

      true->do_positives(tail,res)

    end

    end
    ##################################

    def add_list(lista), do: do_addlist(lista,0)
    defp do_addlist([],res), do: res
    defp do_addlist([head|tail],res), do:  do_addlist(tail,head+res)
    ##########HOMEWORK################
    def invert_pairs(list), do: do_invert_pairs(list,[])
    defp do_invert_pairs([],res), do: invert(res)
    defp do_invert_pairs([{head, next_head}|tail],res), do: do_invert_pairs(tail,[{next_head,head}|res])
    ##################################
    def is_atom_list(list), do: do_is_atom_list(list,[])
    defp do_is_atom_list([],_res), do: true
    defp do_is_atom_list([head|tail],res) do
    cond do

      is_atom(head) -> do_is_atom_list(tail,[head|res])
      true -> false

    end
    end


    def swapper(list,a,b), do: do_swapper(list,a,b,[])
    defp do_swapper([],_a,_b,res), do: invert(res)
    defp do_swapper([head|tail],a,b,res) do
      cond do
        head==a-> do_swapper(tail,a,b,[b|res])
        head==b-> do_swapper(tail,a,b,[a|res])
        true -> do_swapper(tail,a,b,[head|res])


      end
      end


    ##########HOMEWORK################
    def dot_product(lista, listb), do: do_dot_product(lista, listb, 0)
    defp do_dot_product([], [], res), do: res
    defp do_dot_product([head | tail], [head1 | tail1], res), do: do_dot_product(tail, tail1, res + head * head1)
    ##################################

    def average(list), do: do_average(list,0,size(list))
    defp do_average([],_n,numbe) when numbe==0, do: 0
    defp do_average([],n,numbe), do: n/numbe
    defp do_average([head|tail],n,numbe), do: do_average(tail,n+head,numbe)

    def std_dev(list), do: do_std_dev(list,average(list),size(list),0)
    defp do_std_dev([],_mean,n,_stdev) when n==0, do: 0
    defp do_std_dev([],_mean,n,stdev), do: :math.sqrt(stdev*(1/n))
    defp do_std_dev([head|tail],mean,n,stdev), do: do_std_dev(tail,mean,n,stdev + pow((head-mean),2))
    ##########HOMEWORK################
    def replic(n, lst), do: do_replicate(n, lst, [], n)
    defp do_replicate(_n, [], res, _numb), do: invert(res)
    defp do_replicate(n, lst, res, numb) when n > 0, do: do_replicate(n - 1, lst, [hd(lst) | res], numb)
    defp do_replicate(n, lst, res, numb), do: do_replicate(n + numb, tl(lst), res, numb)
    ##################################
    def expand(lst), do: do_expand(lst, 1, [], 1)
    defp do_expand([], _n, res, _curr), do: invert(res)
    defp do_expand([_head | tail], n, res, curr) when n == 0, do: do_expand(tail, curr + 1, res, curr + 1)
    defp do_expand([head | tail], n, res, curr),  do: do_expand([head | tail], n - 1, [head | res], curr)

    ##########HOMEWORK################
    def binary(n), do: do_binary(n, [])
    defp do_binary(n, res) when n == 0, do: res
    defp do_binary(n, res), do: do_binary(div(n, 2), [rem(n, 2) | res])
    ##################################


    end

    # Imanol Santisteban Piñeirua
# 08/03/2024

defmodule Hw.Ariel1 do
  @variable 3
    def invert(list), do: do_invert(list,[])
    defp do_invert([],res), do: res
    defp do_invert([head|tail],res), do: do_invert(tail,[head|res])

    def size(lista), do: size_res(lista,0)
    defp size_res([],a), do: a
    defp size_res(lista,a), do: size_res(lista|>tl,a+1)

    def celciusaF(valor) do

      (valor*9/5) +32
    end

    def fahrenheit_to_celsius(valor)do
      (valor-32)*5/9
    end

    def sign(num) do
    cond do

            num>0 ->1
            num<0 ->-1
            true ->0

          end
        end

    ############
    def roots(a,b,c) do
      val= b**2-(4*a*c)
      if(val>0) do
      (-b + :math.sqrt(val))/(2*a)
      else
        (-b - :math.sqrt(val))/(2*a)
      end

    end

    def bmi(peso,estatura) do
      val= peso/(estatura**2)
       cond do
       val<20 -> :underweight
       val>20 && val<25 -> :normal
       val>25 && val<30 -> :obese1
       val>30 && val<40 -> :obese2
        true -> :obese3

       end
     end

    def factorial(n), do: factorial(n,1)
    defp factorial(n,_a) when n<0, do: :error
    defp factorial(0,a), do: a
    defp factorial(n,a), do: factorial(n-1,a*n)

    def duplicate(list), do: do_duplicate(list,[])
    defp do_duplicate([],res), do: invert(res)
    defp do_duplicate([head|tail], res), do: do_duplicate(tail,[head,head|res])

    def pow(num,power), do: pow_res(num,power)
    defp pow_res(num,1), do: num
    defp pow_res(_num,0), do: 1
    defp pow_res(num,power), do: num * pow_res(num,power-1)


    def fib(num) do
    if num==0 do
        0
    else
      if num==1 do
        1

      else
      fib(num-1)+fib(num-2)
        end
      end
    end

    def fibonacci1(num), do: fibonacci2(num)
    def fibonacci2(0), do: 0
    def fibonacci2(1), do: 1
    def fibonacci2(num) when num > 1 do
      fibonacci2(num - 1) + fibonacci2(num - 2)
    end



    def enlist(list), do: do_enlist(list,[])
    defp do_enlist([],res), do: invert(res)
    defp do_enlist([head|tail],res), do: do_enlist(tail,[[head]|res])

    ##########HOMEWORK################
    def positives(list), do: do_positives(list,[])
    defp do_positives([],res), do: invert(res)
    defp do_positives([head|tail],res) do
    cond do

      head>0 -> do_positives(tail,[head|res])

      true->do_positives(tail,res)

    end

    end
    ##################################

    def add_list(lista), do: do_addlist(lista,0)
    defp do_addlist([],res), do: res
    defp do_addlist([head|tail],res), do:  do_addlist(tail,head+res)
    ##########HOMEWORK################
    def invert_pairs(list), do: do_invert_pairs(list,[])
    defp do_invert_pairs([],res), do: invert(res)
    defp do_invert_pairs([{head, next_head}|tail],res), do: do_invert_pairs(tail,[{next_head,head}|res])
    ##################################
    def is_atom_list(list), do: do_is_atom_list(list,[])
    defp do_is_atom_list([],_res), do: true
    defp do_is_atom_list([head|tail],res) do
    cond do

      is_atom(head) -> do_is_atom_list(tail,[head|res])
      true -> false

    end
    end


    def swapper(list,a,b), do: do_swapper(list,a,b,[])
    defp do_swapper([],_a,_b,res), do: invert(res)
    defp do_swapper([head|tail],a,b,res) do
      cond do
        head==a-> do_swapper(tail,a,b,[b|res])
        head==b-> do_swapper(tail,a,b,[a|res])
        true -> do_swapper(tail,a,b,[head|res])


      end
      end


    ##########HOMEWORK################
    def dot_product(lista, listb), do: do_dot_product(lista, listb, 0)
    defp do_dot_product([], [], res), do: res
    defp do_dot_product([head | tail], [head1 | tail1], res), do: do_dot_product(tail, tail1, res + head * head1)
    ##################################

    def average(list), do: do_average(list,0,size(list))
    defp do_average([],_n,numbe) when numbe==0, do: 0
    defp do_average([],n,numbe), do: n/numbe
    defp do_average([head|tail],n,numbe), do: do_average(tail,n+head,numbe)

    def std_dev(list), do: do_std_dev(list,average(list),size(list),0)
    defp do_std_dev([],_mean,n,_stdev) when n==0, do: 0
    defp do_std_dev([],_mean,n,stdev), do: :math.sqrt(stdev*(1/n))
    defp do_std_dev([head|tail],mean,n,stdev), do: do_std_dev(tail,mean,n,stdev + pow((head-mean),2))
    ##########HOMEWORK################
    def replic(n, lst), do: do_replicate(n, lst, [], n)
    defp do_replicate(_n, [], res, _numb), do: invert(res)
    defp do_replicate(n, lst, res, numb) when n > 0, do: do_replicate(n - 1, lst, [hd(lst) | res], numb)
    defp do_replicate(n, lst, res, numb), do: do_replicate(n + numb, tl(lst), res, numb)
    ##################################
    def expand(lst), do: do_expand(lst, 1, [], 1)
    defp do_expand([], _n, res, _curr), do: invert(res)
    defp do_expand([_head | tail], n, res, curr) when n == 0, do: do_expand(tail, curr + 1, res, curr + 1)
    defp do_expand([head | tail], n, res, curr),  do: do_expand([head | tail], n - 1, [head | res], curr)

    ##########HOMEWORK################
    def binary(n), do: do_binary(n, [])
    defp do_binary(n, res) when n == 0, do: res
    defp do_binary(n, res), do: do_binary(div(n, 2), [rem(n, 2) | res])
    ##################################


    end

    # Imanol Santisteban Piñeirua
# 08/03/2024

defmodule Hw.Ariel1 do
  @variable 3
    def invert(list), do: do_invert(list,[])
    defp do_invert([],res), do: res
    defp do_invert([head|tail],res), do: do_invert(tail,[head|res])

    def size(lista), do: size_res(lista,0)
    defp size_res([],a), do: a
    defp size_res(lista,a), do: size_res(lista|>tl,a+1)

    def celciusaF(valor) do

      (valor*9/5) +32
    end

    def fahrenheit_to_celsius(valor)do
      (valor-32)*5/9
    end

    def sign(num) do
    cond do

            num>0 ->1
            num<0 ->-1
            true ->0

          end
        end

    ############
    def roots(a,b,c) do
      val= b**2-(4*a*c)
      if(val>0) do
      (-b + :math.sqrt(val))/(2*a)
      else
        (-b - :math.sqrt(val))/(2*a)
      end

    end

    def bmi(peso,estatura) do
      val= peso/(estatura**2)
       cond do
       val<20 -> :underweight
       val>20 && val<25 -> :normal
       val>25 && val<30 -> :obese1
       val>30 && val<40 -> :obese2
        true -> :obese3

       end
     end

    def factorial(n), do: factorial(n,1)
    defp factorial(n,_a) when n<0, do: :error
    defp factorial(0,a), do: a
    defp factorial(n,a), do: factorial(n-1,a*n)

    def duplicate(list), do: do_duplicate(list,[])
    defp do_duplicate([],res), do: invert(res)
    defp do_duplicate([head|tail], res), do: do_duplicate(tail,[head,head|res])

    def pow(num,power), do: pow_res(num,power)
    defp pow_res(num,1), do: num
    defp pow_res(_num,0), do: 1
    defp pow_res(num,power), do: num * pow_res(num,power-1)


    def fib(num) do
    if num==0 do
        0
    else
      if num==1 do
        1

      else
      fib(num-1)+fib(num-2)
        end
      end
    end

    def fibonacci1(num), do: fibonacci2(num)
    def fibonacci2(0), do: 0
    def fibonacci2(1), do: 1
    def fibonacci2(num) when num > 1 do
      fibonacci2(num - 1) + fibonacci2(num - 2)
    end



    def enlist(list), do: do_enlist(list,[])
    defp do_enlist([],res), do: invert(res)
    defp do_enlist([head|tail],res), do: do_enlist(tail,[[head]|res])

    ##########HOMEWORK################
    def positives(list), do: do_positives(list,[])
    defp do_positives([],res), do: invert(res)
    defp do_positives([head|tail],res) do
    cond do

      head>0 -> do_positives(tail,[head|res])

      true->do_positives(tail,res)

    end

    end
    ##################################

    def add_list(lista), do: do_addlist(lista,0)
    defp do_addlist([],res), do: res
    defp do_addlist([head|tail],res), do:  do_addlist(tail,head+res)
    ##########HOMEWORK################
    def invert_pairs(list), do: do_invert_pairs(list,[])
    defp do_invert_pairs([],res), do: invert(res)
    defp do_invert_pairs([{head, next_head}|tail],res), do: do_invert_pairs(tail,[{next_head,head}|res])
    ##################################
    def is_atom_list(list), do: do_is_atom_list(list,[])
    defp do_is_atom_list([],_res), do: true
    defp do_is_atom_list([head|tail],res) do
    cond do

      is_atom(head) -> do_is_atom_list(tail,[head|res])
      true -> false

    end
    end


    def swapper(list,a,b), do: do_swapper(list,a,b,[])
    defp do_swapper([],_a,_b,res), do: invert(res)
    defp do_swapper([head|tail],a,b,res) do
      cond do
        head==a-> do_swapper(tail,a,b,[b|res])
        head==b-> do_swapper(tail,a,b,[a|res])
        true -> do_swapper(tail,a,b,[head|res])


      end
      end


    ##########HOMEWORK################
    def dot_product(lista, listb), do: do_dot_product(lista, listb, 0)
    defp do_dot_product([], [], res), do: res
    defp do_dot_product([head | tail], [head1 | tail1], res), do: do_dot_product(tail, tail1, res + head * head1)
    ##################################

    def average(list), do: do_average(list,0,size(list))
    defp do_average([],_n,numbe) when numbe==0, do: 0
    defp do_average([],n,numbe), do: n/numbe
    defp do_average([head|tail],n,numbe), do: do_average(tail,n+head,numbe)

    def std_dev(list), do: do_std_dev(list,average(list),size(list),0)
    defp do_std_dev([],_mean,n,_stdev) when n==0, do: 0
    defp do_std_dev([],_mean,n,stdev), do: :math.sqrt(stdev*(1/n))
    defp do_std_dev([head|tail],mean,n,stdev), do: do_std_dev(tail,mean,n,stdev + pow((head-mean),2))
    ##########HOMEWORK################
    def replic(n, lst), do: do_replicate(n, lst, [], n)
    defp do_replicate(_n, [], res, _numb), do: invert(res)
    defp do_replicate(n, lst, res, numb) when n > 0, do: do_replicate(n - 1, lst, [hd(lst) | res], numb)
    defp do_replicate(n, lst, res, numb), do: do_replicate(n + numb, tl(lst), res, numb)
    ##################################
    def expand(lst), do: do_expand(lst, 1, [], 1)
    defp do_expand([], _n, res, _curr), do: invert(res)
    defp do_expand([_head | tail], n, res, curr) when n == 0, do: do_expand(tail, curr + 1, res, curr + 1)
    defp do_expand([head | tail], n, res, curr),  do: do_expand([head | tail], n - 1, [head | res], curr)

    ##########HOMEWORK################
    def binary(n), do: do_binary(n, [])
    defp do_binary(n, res) when n == 0, do: res
    defp do_binary(n, res), do: do_binary(div(n, 2), [rem(n, 2) | res])
    ##################################


    end

    # Imanol Santisteban Piñeirua
# 08/03/2024

defmodule Hw.Ariel1 do
  @variable 3
    def invert(list), do: do_invert(list,[])
    defp do_invert([],res), do: res
    defp do_invert([head|tail],res), do: do_invert(tail,[head|res])

    def size(lista), do: size_res(lista,0)
    defp size_res([],a), do: a
    defp size_res(lista,a), do: size_res(lista|>tl,a+1)

    def celciusaF(valor) do

      (valor*9/5) +32
    end

    def fahrenheit_to_celsius(valor)do
      (valor-32)*5/9
    end

    def sign(num) do
    cond do

            num>0 ->1
            num<0 ->-1
            true ->0

          end
        end

    ############
    def roots(a,b,c) do
      val= b**2-(4*a*c)
      if(val>0) do
      (-b + :math.sqrt(val))/(2*a)
      else
        (-b - :math.sqrt(val))/(2*a)
      end

    end

    def bmi(peso,estatura) do
      val= peso/(estatura**2)
       cond do
       val<20 -> :underweight
       val>20 && val<25 -> :normal
       val>25 && val<30 -> :obese1
       val>30 && val<40 -> :obese2
        true -> :obese3

       end
     end

    def factorial(n), do: factorial(n,1)
    defp factorial(n,_a) when n<0, do: :error
    defp factorial(0,a), do: a
    defp factorial(n,a), do: factorial(n-1,a*n)

    def duplicate(list), do: do_duplicate(list,[])
    defp do_duplicate([],res), do: invert(res)
    defp do_duplicate([head|tail], res), do: do_duplicate(tail,[head,head|res])

    def pow(num,power), do: pow_res(num,power)
    defp pow_res(num,1), do: num
    defp pow_res(_num,0), do: 1
    defp pow_res(num,power), do: num * pow_res(num,power-1)


    def fib(num) do
    if num==0 do
        0
    else
      if num==1 do
        1

      else
      fib(num-1)+fib(num-2)
        end
      end
    end

    def fibonacci1(num), do: fibonacci2(num)
    def fibonacci2(0), do: 0
    def fibonacci2(1), do: 1
    def fibonacci2(num) when num > 1 do
      fibonacci2(num - 1) + fibonacci2(num - 2)
    end



    def enlist(list), do: do_enlist(list,[])
    defp do_enlist([],res), do: invert(res)
    defp do_enlist([head|tail],res), do: do_enlist(tail,[[head]|res])

    ##########HOMEWORK################
    def positives(list), do: do_positives(list,[])
    defp do_positives([],res), do: invert(res)
    defp do_positives([head|tail],res) do
    cond do

      head>0 -> do_positives(tail,[head|res])

      true->do_positives(tail,res)

    end

    end
    ##################################

    def add_list(lista), do: do_addlist(lista,0)
    defp do_addlist([],res), do: res
    defp do_addlist([head|tail],res), do:  do_addlist(tail,head+res)
    ##########HOMEWORK################
    def invert_pairs(list), do: do_invert_pairs(list,[])
    defp do_invert_pairs([],res), do: invert(res)
    defp do_invert_pairs([{head, next_head}|tail],res), do: do_invert_pairs(tail,[{next_head,head}|res])
    ##################################
    def is_atom_list(list), do: do_is_atom_list(list,[])
    defp do_is_atom_list([],_res), do: true
    defp do_is_atom_list([head|tail],res) do
    cond do

      is_atom(head) -> do_is_atom_list(tail,[head|res])
      true -> false

    end
    end


    def swapper(list,a,b), do: do_swapper(list,a,b,[])
    defp do_swapper([],_a,_b,res), do: invert(res)
    defp do_swapper([head|tail],a,b,res) do
      cond do
        head==a-> do_swapper(tail,a,b,[b|res])
        head==b-> do_swapper(tail,a,b,[a|res])
        true -> do_swapper(tail,a,b,[head|res])


      end
      end


    ##########HOMEWORK################
    def dot_product(lista, listb), do: do_dot_product(lista, listb, 0)
    defp do_dot_product([], [], res), do: res
    defp do_dot_product([head | tail], [head1 | tail1], res), do: do_dot_product(tail, tail1, res + head * head1)
    ##################################

    def average(list), do: do_average(list,0,size(list))
    defp do_average([],_n,numbe) when numbe==0, do: 0
    defp do_average([],n,numbe), do: n/numbe
    defp do_average([head|tail],n,numbe), do: do_average(tail,n+head,numbe)

    def std_dev(list), do: do_std_dev(list,average(list),size(list),0)
    defp do_std_dev([],_mean,n,_stdev) when n==0, do: 0
    defp do_std_dev([],_mean,n,stdev), do: :math.sqrt(stdev*(1/n))
    defp do_std_dev([head|tail],mean,n,stdev), do: do_std_dev(tail,mean,n,stdev + pow((head-mean),2))
    ##########HOMEWORK################
    def replic(n, lst), do: do_replicate(n, lst, [], n)
    defp do_replicate(_n, [], res, _numb), do: invert(res)
    defp do_replicate(n, lst, res, numb) when n > 0, do: do_replicate(n - 1, lst, [hd(lst) | res], numb)
    defp do_replicate(n, lst, res, numb), do: do_replicate(n + numb, tl(lst), res, numb)
    ##################################
    def expand(lst), do: do_expand(lst, 1, [], 1)
    defp do_expand([], _n, res, _curr), do: invert(res)
    defp do_expand([_head | tail], n, res, curr) when n == 0, do: do_expand(tail, curr + 1, res, curr + 1)
    defp do_expand([head | tail], n, res, curr),  do: do_expand([head | tail], n - 1, [head | res], curr)

    ##########HOMEWORK################
    def binary(n), do: do_binary(n, [])
    defp do_binary(n, res) when n == 0, do: res
    defp do_binary(n, res), do: do_binary(div(n, 2), [rem(n, 2) | res])
    ##################################


    end

    # Imanol Santisteban Piñeirua
# 08/03/2024

defmodule Hw.Ariel1 do
  @variable 3
    def invert(list), do: do_invert(list,[])
    defp do_invert([],res), do: res
    defp do_invert([head|tail],res), do: do_invert(tail,[head|res])

    def size(lista), do: size_res(lista,0)
    defp size_res([],a), do: a
    defp size_res(lista,a), do: size_res(lista|>tl,a+1)

    def celciusaF(valor) do

      (valor*9/5) +32
    end

    def fahrenheit_to_celsius(valor)do
      (valor-32)*5/9
    end

    def sign(num) do
    cond do

            num>0 ->1
            num<0 ->-1
            true ->0

          end
        end

    ############
    def roots(a,b,c) do
      val= b**2-(4*a*c)
      if(val>0) do
      (-b + :math.sqrt(val))/(2*a)
      else
        (-b - :math.sqrt(val))/(2*a)
      end

    end

    def bmi(peso,estatura) do
      val= peso/(estatura**2)
       cond do
       val<20 -> :underweight
       val>20 && val<25 -> :normal
       val>25 && val<30 -> :obese1
       val>30 && val<40 -> :obese2
        true -> :obese3

       end
     end

    def factorial(n), do: factorial(n,1)
    defp factorial(n,_a) when n<0, do: :error
    defp factorial(0,a), do: a
    defp factorial(n,a), do: factorial(n-1,a*n)

    def duplicate(list), do: do_duplicate(list,[])
    defp do_duplicate([],res), do: invert(res)
    defp do_duplicate([head|tail], res), do: do_duplicate(tail,[head,head|res])

    def pow(num,power), do: pow_res(num,power)
    defp pow_res(num,1), do: num
    defp pow_res(_num,0), do: 1
    defp pow_res(num,power), do: num * pow_res(num,power-1)


    def fib(num) do
    if num==0 do
        0
    else
      if num==1 do
        1

      else
      fib(num-1)+fib(num-2)
        end
      end
    end

    def fibonacci1(num), do: fibonacci2(num)
    def fibonacci2(0), do: 0
    def fibonacci2(1), do: 1
    def fibonacci2(num) when num > 1 do
      fibonacci2(num - 1) + fibonacci2(num - 2)
    end



    def enlist(list), do: do_enlist(list,[])
    defp do_enlist([],res), do: invert(res)
    defp do_enlist([head|tail],res), do: do_enlist(tail,[[head]|res])

    ##########HOMEWORK################
    def positives(list), do: do_positives(list,[])
    defp do_positives([],res), do: invert(res)
    defp do_positives([head|tail],res) do
    cond do

      head>0 -> do_positives(tail,[head|res])

      true->do_positives(tail,res)

    end

    end
    ##################################

    def add_list(lista), do: do_addlist(lista,0)
    defp do_addlist([],res), do: res
    defp do_addlist([head|tail],res), do:  do_addlist(tail,head+res)
    ##########HOMEWORK################
    def invert_pairs(list), do: do_invert_pairs(list,[])
    defp do_invert_pairs([],res), do: invert(res)
    defp do_invert_pairs([{head, next_head}|tail],res), do: do_invert_pairs(tail,[{next_head,head}|res])
    ##################################
    def is_atom_list(list), do: do_is_atom_list(list,[])
    defp do_is_atom_list([],_res), do: true
    defp do_is_atom_list([head|tail],res) do
    cond do

      is_atom(head) -> do_is_atom_list(tail,[head|res])
      true -> false

    end
    end


    def swapper(list,a,b), do: do_swapper(list,a,b,[])
    defp do_swapper([],_a,_b,res), do: invert(res)
    defp do_swapper([head|tail],a,b,res) do
      cond do
        head==a-> do_swapper(tail,a,b,[b|res])
        head==b-> do_swapper(tail,a,b,[a|res])
        true -> do_swapper(tail,a,b,[head|res])


      end
      end


    ##########HOMEWORK################
    def dot_product(lista, listb), do: do_dot_product(lista, listb, 0)
    defp do_dot_product([], [], res), do: res
    defp do_dot_product([head | tail], [head1 | tail1], res), do: do_dot_product(tail, tail1, res + head * head1)
    ##################################

    def average(list), do: do_average(list,0,size(list))
    defp do_average([],_n,numbe) when numbe==0, do: 0
    defp do_average([],n,numbe), do: n/numbe
    defp do_average([head|tail],n,numbe), do: do_average(tail,n+head,numbe)

    def std_dev(list), do: do_std_dev(list,average(list),size(list),0)
    defp do_std_dev([],_mean,n,_stdev) when n==0, do: 0
    defp do_std_dev([],_mean,n,stdev), do: :math.sqrt(stdev*(1/n))
    defp do_std_dev([head|tail],mean,n,stdev), do: do_std_dev(tail,mean,n,stdev + pow((head-mean),2))
    ##########HOMEWORK################
    def replic(n, lst), do: do_replicate(n, lst, [], n)
    defp do_replicate(_n, [], res, _numb), do: invert(res)
    defp do_replicate(n, lst, res, numb) when n > 0, do: do_replicate(n - 1, lst, [hd(lst) | res], numb)
    defp do_replicate(n, lst, res, numb), do: do_replicate(n + numb, tl(lst), res, numb)
    ##################################
    def expand(lst), do: do_expand(lst, 1, [], 1)
    defp do_expand([], _n, res, _curr), do: invert(res)
    defp do_expand([_head | tail], n, res, curr) when n == 0, do: do_expand(tail, curr + 1, res, curr + 1)
    defp do_expand([head | tail], n, res, curr),  do: do_expand([head | tail], n - 1, [head | res], curr)

    ##########HOMEWORK################
    def binary(n), do: do_binary(n, [])
    defp do_binary(n, res) when n == 0, do: res
    defp do_binary(n, res), do: do_binary(div(n, 2), [rem(n, 2) | res])
    ##################################


    end

    # Imanol Santisteban Piñeirua
# 08/03/2024

defmodule Hw.Ariel1 do
  @variable 3
    def invert(list), do: do_invert(list,[])
    defp do_invert([],res), do: res
    defp do_invert([head|tail],res), do: do_invert(tail,[head|res])

    def size(lista), do: size_res(lista,0)
    defp size_res([],a), do: a
    defp size_res(lista,a), do: size_res(lista|>tl,a+1)

    def celciusaF(valor) do

      (valor*9/5) +32
    end

    def fahrenheit_to_celsius(valor)do
      (valor-32)*5/9
    end

    def sign(num) do
    cond do

            num>0 ->1
            num<0 ->-1
            true ->0

          end
        end

    ############
    def roots(a,b,c) do
      val= b**2-(4*a*c)
      if(val>0) do
      (-b + :math.sqrt(val))/(2*a)
      else
        (-b - :math.sqrt(val))/(2*a)
      end

    end

    def bmi(peso,estatura) do
      val= peso/(estatura**2)
       cond do
       val<20 -> :underweight
       val>20 && val<25 -> :normal
       val>25 && val<30 -> :obese1
       val>30 && val<40 -> :obese2
        true -> :obese3

       end
     end

    def factorial(n), do: factorial(n,1)
    defp factorial(n,_a) when n<0, do: :error
    defp factorial(0,a), do: a
    defp factorial(n,a), do: factorial(n-1,a*n)

    def duplicate(list), do: do_duplicate(list,[])
    defp do_duplicate([],res), do: invert(res)
    defp do_duplicate([head|tail], res), do: do_duplicate(tail,[head,head|res])

    def pow(num,power), do: pow_res(num,power)
    defp pow_res(num,1), do: num
    defp pow_res(_num,0), do: 1
    defp pow_res(num,power), do: num * pow_res(num,power-1)


    def fib(num) do
    if num==0 do
        0
    else
      if num==1 do
        1

      else
      fib(num-1)+fib(num-2)
        end
      end
    end

    def fibonacci1(num), do: fibonacci2(num)
    def fibonacci2(0), do: 0
    def fibonacci2(1), do: 1
    def fibonacci2(num) when num > 1 do
      fibonacci2(num - 1) + fibonacci2(num - 2)
    end



    def enlist(list), do: do_enlist(list,[])
    defp do_enlist([],res), do: invert(res)
    defp do_enlist([head|tail],res), do: do_enlist(tail,[[head]|res])

    ##########HOMEWORK################
    def positives(list), do: do_positives(list,[])
    defp do_positives([],res), do: invert(res)
    defp do_positives([head|tail],res) do
    cond do

      head>0 -> do_positives(tail,[head|res])

      true->do_positives(tail,res)

    end

    end
    ##################################

    def add_list(lista), do: do_addlist(lista,0)
    defp do_addlist([],res), do: res
    defp do_addlist([head|tail],res), do:  do_addlist(tail,head+res)
    ##########HOMEWORK################
    def invert_pairs(list), do: do_invert_pairs(list,[])
    defp do_invert_pairs([],res), do: invert(res)
    defp do_invert_pairs([{head, next_head}|tail],res), do: do_invert_pairs(tail,[{next_head,head}|res])
    ##################################
    def is_atom_list(list), do: do_is_atom_list(list,[])
    defp do_is_atom_list([],_res), do: true
    defp do_is_atom_list([head|tail],res) do
    cond do

      is_atom(head) -> do_is_atom_list(tail,[head|res])
      true -> false

    end
    end


    def swapper(list,a,b), do: do_swapper(list,a,b,[])
    defp do_swapper([],_a,_b,res), do: invert(res)
    defp do_swapper([head|tail],a,b,res) do
      cond do
        head==a-> do_swapper(tail,a,b,[b|res])
        head==b-> do_swapper(tail,a,b,[a|res])
        true -> do_swapper(tail,a,b,[head|res])


      end
      end


    ##########HOMEWORK################
    def dot_product(lista, listb), do: do_dot_product(lista, listb, 0)
    defp do_dot_product([], [], res), do: res
    defp do_dot_product([head | tail], [head1 | tail1], res), do: do_dot_product(tail, tail1, res + head * head1)
    ##################################

    def average(list), do: do_average(list,0,size(list))
    defp do_average([],_n,numbe) when numbe==0, do: 0
    defp do_average([],n,numbe), do: n/numbe
    defp do_average([head|tail],n,numbe), do: do_average(tail,n+head,numbe)

    def std_dev(list), do: do_std_dev(list,average(list),size(list),0)
    defp do_std_dev([],_mean,n,_stdev) when n==0, do: 0
    defp do_std_dev([],_mean,n,stdev), do: :math.sqrt(stdev*(1/n))
    defp do_std_dev([head|tail],mean,n,stdev), do: do_std_dev(tail,mean,n,stdev + pow((head-mean),2))
    ##########HOMEWORK################
    def replic(n, lst), do: do_replicate(n, lst, [], n)
    defp do_replicate(_n, [], res, _numb), do: invert(res)
    defp do_replicate(n, lst, res, numb) when n > 0, do: do_replicate(n - 1, lst, [hd(lst) | res], numb)
    defp do_replicate(n, lst, res, numb), do: do_replicate(n + numb, tl(lst), res, numb)
    ##################################
    def expand(lst), do: do_expand(lst, 1, [], 1)
    defp do_expand([], _n, res, _curr), do: invert(res)
    defp do_expand([_head | tail], n, res, curr) when n == 0, do: do_expand(tail, curr + 1, res, curr + 1)
    defp do_expand([head | tail], n, res, curr),  do: do_expand([head | tail], n - 1, [head | res], curr)

    ##########HOMEWORK################
    def binary(n), do: do_binary(n, [])
    defp do_binary(n, res) when n == 0, do: res
    defp do_binary(n, res), do: do_binary(div(n, 2), [rem(n, 2) | res])
    ##################################


    end

    # Imanol Santisteban Piñeirua
# 08/03/2024

defmodule Hw.Ariel1 do
  @variable 3
    def invert(list), do: do_invert(list,[])
    defp do_invert([],res), do: res
    defp do_invert([head|tail],res), do: do_invert(tail,[head|res])

    def size(lista), do: size_res(lista,0)
    defp size_res([],a), do: a
    defp size_res(lista,a), do: size_res(lista|>tl,a+1)

    def celciusaF(valor) do

      (valor*9/5) +32
    end

    def fahrenheit_to_celsius(valor)do
      (valor-32)*5/9
    end

    def sign(num) do
    cond do

            num>0 ->1
            num<0 ->-1
            true ->0

          end
        end

    ############
    def roots(a,b,c) do
      val= b**2-(4*a*c)
      if(val>0) do
      (-b + :math.sqrt(val))/(2*a)
      else
        (-b - :math.sqrt(val))/(2*a)
      end

    end

    def bmi(peso,estatura) do
      val= peso/(estatura**2)
       cond do
       val<20 -> :underweight
       val>20 && val<25 -> :normal
       val>25 && val<30 -> :obese1
       val>30 && val<40 -> :obese2
        true -> :obese3

       end
     end

    def factorial(n), do: factorial(n,1)
    defp factorial(n,_a) when n<0, do: :error
    defp factorial(0,a), do: a
    defp factorial(n,a), do: factorial(n-1,a*n)

    def duplicate(list), do: do_duplicate(list,[])
    defp do_duplicate([],res), do: invert(res)
    defp do_duplicate([head|tail], res), do: do_duplicate(tail,[head,head|res])

    def pow(num,power), do: pow_res(num,power)
    defp pow_res(num,1), do: num
    defp pow_res(_num,0), do: 1
    defp pow_res(num,power), do: num * pow_res(num,power-1)


    def fib(num) do
    if num==0 do
        0
    else
      if num==1 do
        1

      else
      fib(num-1)+fib(num-2)
        end
      end
    end

    def fibonacci1(num), do: fibonacci2(num)
    def fibonacci2(0), do: 0
    def fibonacci2(1), do: 1
    def fibonacci2(num) when num > 1 do
      fibonacci2(num - 1) + fibonacci2(num - 2)
    end



    def enlist(list), do: do_enlist(list,[])
    defp do_enlist([],res), do: invert(res)
    defp do_enlist([head|tail],res), do: do_enlist(tail,[[head]|res])

    ##########HOMEWORK################
    def positives(list), do: do_positives(list,[])
    defp do_positives([],res), do: invert(res)
    defp do_positives([head|tail],res) do
    cond do

      head>0 -> do_positives(tail,[head|res])

      true->do_positives(tail,res)

    end

    end
    ##################################

    def add_list(lista), do: do_addlist(lista,0)
    defp do_addlist([],res), do: res
    defp do_addlist([head|tail],res), do:  do_addlist(tail,head+res)
    ##########HOMEWORK################
    def invert_pairs(list), do: do_invert_pairs(list,[])
    defp do_invert_pairs([],res), do: invert(res)
    defp do_invert_pairs([{head, next_head}|tail],res), do: do_invert_pairs(tail,[{next_head,head}|res])
    ##################################
    def is_atom_list(list), do: do_is_atom_list(list,[])
    defp do_is_atom_list([],_res), do: true
    defp do_is_atom_list([head|tail],res) do
    cond do

      is_atom(head) -> do_is_atom_list(tail,[head|res])
      true -> false

    end
    end


    def swapper(list,a,b), do: do_swapper(list,a,b,[])
    defp do_swapper([],_a,_b,res), do: invert(res)
    defp do_swapper([head|tail],a,b,res) do
      cond do
        head==a-> do_swapper(tail,a,b,[b|res])
        head==b-> do_swapper(tail,a,b,[a|res])
        true -> do_swapper(tail,a,b,[head|res])


      end
      end


    ##########HOMEWORK################
    def dot_product(lista, listb), do: do_dot_product(lista, listb, 0)
    defp do_dot_product([], [], res), do: res
    defp do_dot_product([head | tail], [head1 | tail1], res), do: do_dot_product(tail, tail1, res + head * head1)
    ##################################

    def average(list), do: do_average(list,0,size(list))
    defp do_average([],_n,numbe) when numbe==0, do: 0
    defp do_average([],n,numbe), do: n/numbe
    defp do_average([head|tail],n,numbe), do: do_average(tail,n+head,numbe)

    def std_dev(list), do: do_std_dev(list,average(list),size(list),0)
    defp do_std_dev([],_mean,n,_stdev) when n==0, do: 0
    defp do_std_dev([],_mean,n,stdev), do: :math.sqrt(stdev*(1/n))
    defp do_std_dev([head|tail],mean,n,stdev), do: do_std_dev(tail,mean,n,stdev + pow((head-mean),2))
    ##########HOMEWORK################
    def replic(n, lst), do: do_replicate(n, lst, [], n)
    defp do_replicate(_n, [], res, _numb), do: invert(res)
    defp do_replicate(n, lst, res, numb) when n > 0, do: do_replicate(n - 1, lst, [hd(lst) | res], numb)
    defp do_replicate(n, lst, res, numb), do: do_replicate(n + numb, tl(lst), res, numb)
    ##################################
    def expand(lst), do: do_expand(lst, 1, [], 1)
    defp do_expand([], _n, res, _curr), do: invert(res)
    defp do_expand([_head | tail], n, res, curr) when n == 0, do: do_expand(tail, curr + 1, res, curr + 1)
    defp do_expand([head | tail], n, res, curr),  do: do_expand([head | tail], n - 1, [head | res], curr)

    ##########HOMEWORK################
    def binary(n), do: do_binary(n, [])
    defp do_binary(n, res) when n == 0, do: res
    defp do_binary(n, res), do: do_binary(div(n, 2), [rem(n, 2) | res])
    ##################################


    end

    # Imanol Santisteban Piñeirua
# 08/03/2024

defmodule Hw.Ariel1 do
  @variable 3
    def invert(list), do: do_invert(list,[])
    defp do_invert([],res), do: res
    defp do_invert([head|tail],res), do: do_invert(tail,[head|res])

    def size(lista), do: size_res(lista,0)
    defp size_res([],a), do: a
    defp size_res(lista,a), do: size_res(lista|>tl,a+1)

    def celciusaF(valor) do

      (valor*9/5) +32
    end

    def fahrenheit_to_celsius(valor)do
      (valor-32)*5/9
    end

    def sign(num) do
    cond do

            num>0 ->1
            num<0 ->-1
            true ->0

          end
        end

    ############
    def roots(a,b,c) do
      val= b**2-(4*a*c)
      if(val>0) do
      (-b + :math.sqrt(val))/(2*a)
      else
        (-b - :math.sqrt(val))/(2*a)
      end

    end

    def bmi(peso,estatura) do
      val= peso/(estatura**2)
       cond do
       val<20 -> :underweight
       val>20 && val<25 -> :normal
       val>25 && val<30 -> :obese1
       val>30 && val<40 -> :obese2
        true -> :obese3

       end
     end

    def factorial(n), do: factorial(n,1)
    defp factorial(n,_a) when n<0, do: :error
    defp factorial(0,a), do: a
    defp factorial(n,a), do: factorial(n-1,a*n)

    def duplicate(list), do: do_duplicate(list,[])
    defp do_duplicate([],res), do: invert(res)
    defp do_duplicate([head|tail], res), do: do_duplicate(tail,[head,head|res])

    def pow(num,power), do: pow_res(num,power)
    defp pow_res(num,1), do: num
    defp pow_res(_num,0), do: 1
    defp pow_res(num,power), do: num * pow_res(num,power-1)


    def fib(num) do
    if num==0 do
        0
    else
      if num==1 do
        1

      else
      fib(num-1)+fib(num-2)
        end
      end
    end

    def fibonacci1(num), do: fibonacci2(num)
    def fibonacci2(0), do: 0
    def fibonacci2(1), do: 1
    def fibonacci2(num) when num > 1 do
      fibonacci2(num - 1) + fibonacci2(num - 2)
    end



    def enlist(list), do: do_enlist(list,[])
    defp do_enlist([],res), do: invert(res)
    defp do_enlist([head|tail],res), do: do_enlist(tail,[[head]|res])

    ##########HOMEWORK################
    def positives(list), do: do_positives(list,[])
    defp do_positives([],res), do: invert(res)
    defp do_positives([head|tail],res) do
    cond do

      head>0 -> do_positives(tail,[head|res])

      true->do_positives(tail,res)

    end

    end
    ##################################

    def add_list(lista), do: do_addlist(lista,0)
    defp do_addlist([],res), do: res
    defp do_addlist([head|tail],res), do:  do_addlist(tail,head+res)
    ##########HOMEWORK################
    def invert_pairs(list), do: do_invert_pairs(list,[])
    defp do_invert_pairs([],res), do: invert(res)
    defp do_invert_pairs([{head, next_head}|tail],res), do: do_invert_pairs(tail,[{next_head,head}|res])
    ##################################
    def is_atom_list(list), do: do_is_atom_list(list,[])
    defp do_is_atom_list([],_res), do: true
    defp do_is_atom_list([head|tail],res) do
    cond do

      is_atom(head) -> do_is_atom_list(tail,[head|res])
      true -> false

    end
    end


    def swapper(list,a,b), do: do_swapper(list,a,b,[])
    defp do_swapper([],_a,_b,res), do: invert(res)
    defp do_swapper([head|tail],a,b,res) do
      cond do
        head==a-> do_swapper(tail,a,b,[b|res])
        head==b-> do_swapper(tail,a,b,[a|res])
        true -> do_swapper(tail,a,b,[head|res])


      end
      end


    ##########HOMEWORK################
    def dot_product(lista, listb), do: do_dot_product(lista, listb, 0)
    defp do_dot_product([], [], res), do: res
    defp do_dot_product([head | tail], [head1 | tail1], res), do: do_dot_product(tail, tail1, res + head * head1)
    ##################################

    def average(list), do: do_average(list,0,size(list))
    defp do_average([],_n,numbe) when numbe==0, do: 0
    defp do_average([],n,numbe), do: n/numbe
    defp do_average([head|tail],n,numbe), do: do_average(tail,n+head,numbe)

    def std_dev(list), do: do_std_dev(list,average(list),size(list),0)
    defp do_std_dev([],_mean,n,_stdev) when n==0, do: 0
    defp do_std_dev([],_mean,n,stdev), do: :math.sqrt(stdev*(1/n))
    defp do_std_dev([head|tail],mean,n,stdev), do: do_std_dev(tail,mean,n,stdev + pow((head-mean),2))
    ##########HOMEWORK################
    def replic(n, lst), do: do_replicate(n, lst, [], n)
    defp do_replicate(_n, [], res, _numb), do: invert(res)
    defp do_replicate(n, lst, res, numb) when n > 0, do: do_replicate(n - 1, lst, [hd(lst) | res], numb)
    defp do_replicate(n, lst, res, numb), do: do_replicate(n + numb, tl(lst), res, numb)
    ##################################
    def expand(lst), do: do_expand(lst, 1, [], 1)
    defp do_expand([], _n, res, _curr), do: invert(res)
    defp do_expand([_head | tail], n, res, curr) when n == 0, do: do_expand(tail, curr + 1, res, curr + 1)
    defp do_expand([head | tail], n, res, curr),  do: do_expand([head | tail], n - 1, [head | res], curr)

    ##########HOMEWORK################
    def binary(n), do: do_binary(n, [])
    defp do_binary(n, res) when n == 0, do: res
    defp do_binary(n, res), do: do_binary(div(n, 2), [rem(n, 2) | res])
    ##################################


    end

    # Imanol Santisteban Piñeirua
# 08/03/2024

defmodule Hw.Ariel1 do
  @variable 3
    def invert(list), do: do_invert(list,[])
    defp do_invert([],res), do: res
    defp do_invert([head|tail],res), do: do_invert(tail,[head|res])

    def size(lista), do: size_res(lista,0)
    defp size_res([],a), do: a
    defp size_res(lista,a), do: size_res(lista|>tl,a+1)

    def celciusaF(valor) do

      (valor*9/5) +32
    end

    def fahrenheit_to_celsius(valor)do
      (valor-32)*5/9
    end

    def sign(num) do
    cond do

            num>0 ->1
            num<0 ->-1
            true ->0

          end
        end

    ############
    def roots(a,b,c) do
      val= b**2-(4*a*c)
      if(val>0) do
      (-b + :math.sqrt(val))/(2*a)
      else
        (-b - :math.sqrt(val))/(2*a)
      end

    end

    def bmi(peso,estatura) do
      val= peso/(estatura**2)
       cond do
       val<20 -> :underweight
       val>20 && val<25 -> :normal
       val>25 && val<30 -> :obese1
       val>30 && val<40 -> :obese2
        true -> :obese3

       end
     end

    def factorial(n), do: factorial(n,1)
    defp factorial(n,_a) when n<0, do: :error
    defp factorial(0,a), do: a
    defp factorial(n,a), do: factorial(n-1,a*n)

    def duplicate(list), do: do_duplicate(list,[])
    defp do_duplicate([],res), do: invert(res)
    defp do_duplicate([head|tail], res), do: do_duplicate(tail,[head,head|res])

    def pow(num,power), do: pow_res(num,power)
    defp pow_res(num,1), do: num
    defp pow_res(_num,0), do: 1
    defp pow_res(num,power), do: num * pow_res(num,power-1)


    def fib(num) do
    if num==0 do
        0
    else
      if num==1 do
        1

      else
      fib(num-1)+fib(num-2)
        end
      end
    end

    def fibonacci1(num), do: fibonacci2(num)
    def fibonacci2(0), do: 0
    def fibonacci2(1), do: 1
    def fibonacci2(num) when num > 1 do
      fibonacci2(num - 1) + fibonacci2(num - 2)
    end



    def enlist(list), do: do_enlist(list,[])
    defp do_enlist([],res), do: invert(res)
    defp do_enlist([head|tail],res), do: do_enlist(tail,[[head]|res])

    ##########HOMEWORK################
    def positives(list), do: do_positives(list,[])
    defp do_positives([],res), do: invert(res)
    defp do_positives([head|tail],res) do
    cond do

      head>0 -> do_positives(tail,[head|res])

      true->do_positives(tail,res)

    end

    end
    ##################################

    def add_list(lista), do: do_addlist(lista,0)
    defp do_addlist([],res), do: res
    defp do_addlist([head|tail],res), do:  do_addlist(tail,head+res)
    ##########HOMEWORK################
    def invert_pairs(list), do: do_invert_pairs(list,[])
    defp do_invert_pairs([],res), do: invert(res)
    defp do_invert_pairs([{head, next_head}|tail],res), do: do_invert_pairs(tail,[{next_head,head}|res])
    ##################################
    def is_atom_list(list), do: do_is_atom_list(list,[])
    defp do_is_atom_list([],_res), do: true
    defp do_is_atom_list([head|tail],res) do
    cond do

      is_atom(head) -> do_is_atom_list(tail,[head|res])
      true -> false

    end
    end


    def swapper(list,a,b), do: do_swapper(list,a,b,[])
    defp do_swapper([],_a,_b,res), do: invert(res)
    defp do_swapper([head|tail],a,b,res) do
      cond do
        head==a-> do_swapper(tail,a,b,[b|res])
        head==b-> do_swapper(tail,a,b,[a|res])
        true -> do_swapper(tail,a,b,[head|res])


      end
      end


    ##########HOMEWORK################
    def dot_product(lista, listb), do: do_dot_product(lista, listb, 0)
    defp do_dot_product([], [], res), do: res
    defp do_dot_product([head | tail], [head1 | tail1], res), do: do_dot_product(tail, tail1, res + head * head1)
    ##################################

    def average(list), do: do_average(list,0,size(list))
    defp do_average([],_n,numbe) when numbe==0, do: 0
    defp do_average([],n,numbe), do: n/numbe
    defp do_average([head|tail],n,numbe), do: do_average(tail,n+head,numbe)

    def std_dev(list), do: do_std_dev(list,average(list),size(list),0)
    defp do_std_dev([],_mean,n,_stdev) when n==0, do: 0
    defp do_std_dev([],_mean,n,stdev), do: :math.sqrt(stdev*(1/n))
    defp do_std_dev([head|tail],mean,n,stdev), do: do_std_dev(tail,mean,n,stdev + pow((head-mean),2))
    ##########HOMEWORK################
    def replic(n, lst), do: do_replicate(n, lst, [], n)
    defp do_replicate(_n, [], res, _numb), do: invert(res)
    defp do_replicate(n, lst, res, numb) when n > 0, do: do_replicate(n - 1, lst, [hd(lst) | res], numb)
    defp do_replicate(n, lst, res, numb), do: do_replicate(n + numb, tl(lst), res, numb)
    ##################################
    def expand(lst), do: do_expand(lst, 1, [], 1)
    defp do_expand([], _n, res, _curr), do: invert(res)
    defp do_expand([_head | tail], n, res, curr) when n == 0, do: do_expand(tail, curr + 1, res, curr + 1)
    defp do_expand([head | tail], n, res, curr),  do: do_expand([head | tail], n - 1, [head | res], curr)

    ##########HOMEWORK################
    def binary(n), do: do_binary(n, [])
    defp do_binary(n, res) when n == 0, do: res
    defp do_binary(n, res), do: do_binary(div(n, 2), [rem(n, 2) | res])
    ##################################


    end

    # Imanol Santisteban Piñeirua
# 08/03/2024

defmodule Hw.Ariel1 do
  @variable 3
    def invert(list), do: do_invert(list,[])
    defp do_invert([],res), do: res
    defp do_invert([head|tail],res), do: do_invert(tail,[head|res])

    def size(lista), do: size_res(lista,0)
    defp size_res([],a), do: a
    defp size_res(lista,a), do: size_res(lista|>tl,a+1)

    def celciusaF(valor) do

      (valor*9/5) +32
    end

    def fahrenheit_to_celsius(valor)do
      (valor-32)*5/9
    end

    def sign(num) do
    cond do

            num>0 ->1
            num<0 ->-1
            true ->0

          end
        end

    ############
    def roots(a,b,c) do
      val= b**2-(4*a*c)
      if(val>0) do
      (-b + :math.sqrt(val))/(2*a)
      else
        (-b - :math.sqrt(val))/(2*a)
      end

    end

    def bmi(peso,estatura) do
      val= peso/(estatura**2)
       cond do
       val<20 -> :underweight
       val>20 && val<25 -> :normal
       val>25 && val<30 -> :obese1
       val>30 && val<40 -> :obese2
        true -> :obese3

       end
     end

    def factorial(n), do: factorial(n,1)
    defp factorial(n,_a) when n<0, do: :error
    defp factorial(0,a), do: a
    defp factorial(n,a), do: factorial(n-1,a*n)

    def duplicate(list), do: do_duplicate(list,[])
    defp do_duplicate([],res), do: invert(res)
    defp do_duplicate([head|tail], res), do: do_duplicate(tail,[head,head|res])

    def pow(num,power), do: pow_res(num,power)
    defp pow_res(num,1), do: num
    defp pow_res(_num,0), do: 1
    defp pow_res(num,power), do: num * pow_res(num,power-1)


    def fib(num) do
    if num==0 do
        0
    else
      if num==1 do
        1

      else
      fib(num-1)+fib(num-2)
        end
      end
    end

    def fibonacci1(num), do: fibonacci2(num)
    def fibonacci2(0), do: 0
    def fibonacci2(1), do: 1
    def fibonacci2(num) when num > 1 do
      fibonacci2(num - 1) + fibonacci2(num - 2)
    end



    def enlist(list), do: do_enlist(list,[])
    defp do_enlist([],res), do: invert(res)
    defp do_enlist([head|tail],res), do: do_enlist(tail,[[head]|res])

    ##########HOMEWORK################
    def positives(list), do: do_positives(list,[])
    defp do_positives([],res), do: invert(res)
    defp do_positives([head|tail],res) do
    cond do

      head>0 -> do_positives(tail,[head|res])

      true->do_positives(tail,res)

    end

    end
    ##################################

    def add_list(lista), do: do_addlist(lista,0)
    defp do_addlist([],res), do: res
    defp do_addlist([head|tail],res), do:  do_addlist(tail,head+res)
    ##########HOMEWORK################
    def invert_pairs(list), do: do_invert_pairs(list,[])
    defp do_invert_pairs([],res), do: invert(res)
    defp do_invert_pairs([{head, next_head}|tail],res), do: do_invert_pairs(tail,[{next_head,head}|res])
    ##################################
    def is_atom_list(list), do: do_is_atom_list(list,[])
    defp do_is_atom_list([],_res), do: true
    defp do_is_atom_list([head|tail],res) do
    cond do

      is_atom(head) -> do_is_atom_list(tail,[head|res])
      true -> false

    end
    end


    def swapper(list,a,b), do: do_swapper(list,a,b,[])
    defp do_swapper([],_a,_b,res), do: invert(res)
    defp do_swapper([head|tail],a,b,res) do
      cond do
        head==a-> do_swapper(tail,a,b,[b|res])
        head==b-> do_swapper(tail,a,b,[a|res])
        true -> do_swapper(tail,a,b,[head|res])


      end
      end


    ##########HOMEWORK################
    def dot_product(lista, listb), do: do_dot_product(lista, listb, 0)
    defp do_dot_product([], [], res), do: res
    defp do_dot_product([head | tail], [head1 | tail1], res), do: do_dot_product(tail, tail1, res + head * head1)
    ##################################

    def average(list), do: do_average(list,0,size(list))
    defp do_average([],_n,numbe) when numbe==0, do: 0
    defp do_average([],n,numbe), do: n/numbe
    defp do_average([head|tail],n,numbe), do: do_average(tail,n+head,numbe)

    def std_dev(list), do: do_std_dev(list,average(list),size(list),0)
    defp do_std_dev([],_mean,n,_stdev) when n==0, do: 0
    defp do_std_dev([],_mean,n,stdev), do: :math.sqrt(stdev*(1/n))
    defp do_std_dev([head|tail],mean,n,stdev), do: do_std_dev(tail,mean,n,stdev + pow((head-mean),2))
    ##########HOMEWORK################
    def replic(n, lst), do: do_replicate(n, lst, [], n)
    defp do_replicate(_n, [], res, _numb), do: invert(res)
    defp do_replicate(n, lst, res, numb) when n > 0, do: do_replicate(n - 1, lst, [hd(lst) | res], numb)
    defp do_replicate(n, lst, res, numb), do: do_replicate(n + numb, tl(lst), res, numb)
    ##################################
    def expand(lst), do: do_expand(lst, 1, [], 1)
    defp do_expand([], _n, res, _curr), do: invert(res)
    defp do_expand([_head | tail], n, res, curr) when n == 0, do: do_expand(tail, curr + 1, res, curr + 1)
    defp do_expand([head | tail], n, res, curr),  do: do_expand([head | tail], n - 1, [head | res], curr)

    ##########HOMEWORK################
    def binary(n), do: do_binary(n, [])
    defp do_binary(n, res) when n == 0, do: res
    defp do_binary(n, res), do: do_binary(div(n, 2), [rem(n, 2) | res])
    ##################################


    end
