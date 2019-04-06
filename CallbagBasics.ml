type ('a, 'b) observable = (<subscribe: ('a -> unit) -> unit; ..> as 'b) Js.t

module Observable = struct
  type 'a t = ('a, <subscribe: ('a -> unit) -> unit>) observable
end

type 'a iterable
type 'a unit_fn = 'a Callbag.t -> unit
type ('a, 'b) nat_fn = 'a Callbag.t -> 'b Callbag.t (* natural transformation *)

module Internal = struct
  external array_to_iter: 'a array -> 'a iterable = "%identity"
end

(* Source factories *)
external from_obs: ('a, _) observable -> 'a Callbag.t = "fromObs"
[@@bs.module "callbag-basics"]

external from_iter: 'a iterable -> 'a Callbag.t = "fromIter"
[@@bs.module "callbag-basics"]

let from_array arr = arr |> Internal.array_to_iter |> from_iter

external from_event: Dom.element -> string -> Dom.event Callbag.t = "fromEvent"
[@@bs.module "callbag-basics"]

external from_promise: 'a Js.Promise.t -> 'a Callbag.t = "fromPromise"
[@@bs.module "callbag-basics"]

external interval: int -> int Callbag.t = "" [@@bs.module "callbag-basics"]


(* Sink factories *)
external for_each: ('a -> unit) -> 'a unit_fn = "forEach"
[@@bs.module "callbag-basics"]


(* Transformation operators *)
external map: ('a -> 'b) -> ('a, 'b) nat_fn = "" [@@bs.module "callbag-basics"]

external scan: ('acc -> 'e -> 'acc) -> 'acc -> ('e, 'acc) nat_fn = ""
[@@bs.module "callbag-basics"]

external flatten: ('a Callbag.t) Callbag.t -> 'a Callbag.t = ""
[@@bs.module "callbag-basics"]


(* Filtering operators *)
external take: int -> ('a, 'b) nat_fn = "" [@@bs.module "callbag-basics"]

external skip: int -> ('a, 'b) nat_fn = "" [@@bs.module "callbag-basics"]

external filter: ('a -> bool) -> ('a, 'b) nat_fn = ""
[@@bs.module "callbag-basics"]


(* Combination operators *)
external merge: 'a Callbag.t -> 'a Callbag.t -> 'a Callbag.t = ""
[@@bs.module "callbag-basics"]

external concat: 'a Callbag.t -> 'a Callbag.t -> 'a Callbag.t = ""
[@@bs.module "callbag-basics"]

external combine: 'a Callbag.t -> 'b Callbag.t -> ('a * 'b) Callbag.t = ""
[@@bs.module "callbag-basics"]


(* Utilities *)
external share: 'a Callbag.t -> 'a Callbag.t = "" [@@bs.module "callbag-basics"]
