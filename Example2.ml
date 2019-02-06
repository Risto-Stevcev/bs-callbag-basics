open CallbagBasics

let _ =
  interval 1000
  |> for_each Js.log
