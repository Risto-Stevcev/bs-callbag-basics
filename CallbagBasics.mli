type ('a, 'b) observable = 'b Js.t
  constraint 'b = < subscribe : ('a -> unit) -> unit; .. >
type 'a observable' = ('a, < subscribe : ('a -> unit) -> unit >) observable
type 'a iterable
type 'a unit_fn = 'a Callbag.t -> unit
type ('a, 'b) nat_fn = 'a Callbag.t -> 'b Callbag.t (* natural transformation *)

(* Source factories *)
val from_obs :
  ('a, < subscribe : ('a -> unit) -> unit; .. >) observable -> 'a Callbag.t
val from_iter : 'a iterable -> 'a Callbag.t
val from_array : 'a array -> 'a Callbag.t
val from_event : Dom.element -> string -> Dom.event Callbag.t
val from_promise : 'a Js.Promise.t -> 'a Callbag.t
val interval : int -> int Callbag.t

(* Sink factories *)
val for_each : ('a -> unit) -> 'a unit_fn

(* Transformation operators *)
val map : ('a -> 'b) -> ('a, 'b) nat_fn
val scan : ('acc -> 'e -> 'acc) -> 'acc -> ('e, 'acc) nat_fn
val flatten : 'a Callbag.t Callbag.t -> 'a Callbag.t

(* Filtering operators *)
val take : int -> ('a, 'b) nat_fn
val skip : int -> ('a, 'b) nat_fn
val filter : ('a -> bool) -> ('a, 'b) nat_fn

(* Combination operators *)
val merge : 'a Callbag.t -> 'a Callbag.t -> 'a Callbag.t
val concat : 'a Callbag.t -> 'a Callbag.t -> 'a Callbag.t
val combine : 'a Callbag.t -> 'b Callbag.t -> ('a * 'b) Callbag.t

(* Utilities *)
val share : 'a Callbag.t -> 'a Callbag.t
