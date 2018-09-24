open CallbagBasics

let is_even n = n mod 2 == 0

let _ =
  from_array [|1;2;3;4;5|]
  |> map ((+) 3)
  |> filter is_even
  |> scan (+) 0
  |> for_each Js.log
