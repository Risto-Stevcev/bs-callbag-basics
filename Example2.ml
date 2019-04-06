open CallbagBasics

let clock: int Observable.t = [%raw {|
  {
    subscribe: (observer) => {
      let i = 0;
      setInterval(() => observer.next(i++), 1000);
    }
  }
|}]

let _ =
  clock
  |> from_obs
  |> filter (fun e -> e mod 2 == 0)
  |> map (fun e -> string_of_int e ^ "!")
  |> for_each (Js.log2 "from_obs+filter+map")

let _ =
  merge (interval 100) (interval 350)
  |> for_each (Js.log2 "interval+merge")

let _ =
  from_array [|1;2;3;4;5|]
  |> scan (+) 0
  |> for_each (Js.log2 "from_array+scan")

let source =
  from_array [|1;2;3;4;5|]
  |> share

let _ =
  from_array [|1;2;3;4;5|]
  |> take 3
  |> for_each (Js.log2 "share+take")

let _ =
  from_array [|1;2;3;4;5|]
  |> skip 3
  |> for_each (Js.log2 "share+skip")

let _ =
  concat (from_array [|"10";"20";"30"|]) (from_array [|"a";"b"|])
  |> for_each (Js.log2 "concat+from_array")

let _ =
  combine (from_array [|10;20;30|]) (from_array [|"a";"b"|])
  |> for_each (Js.log2 "combine+from_array")
