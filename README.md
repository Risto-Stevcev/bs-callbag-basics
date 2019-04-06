# bs-callbag-basics

Bucklescript bindings for [callbag-basics](https://github.com/staltz/callbag-basics)


## Install

```sh
yarn add @ristostevcev/bs-callbag-basics
```


## Example

```ocaml
open CallbagBasics

let is_even n = n mod 2 == 0

let _ =
  from_array [|1;2;3;4;5|]
  |> map ((+) 3)
  |> filter is_even
  |> scan (+) 0
  |> for_each Js.log
```

The API mirrors callbag-basics, see [CallbagBasics.ml](https://github.com/Risto-Stevcev/bs-callbag-basics/blob/master/CallbagBasics.ml)
