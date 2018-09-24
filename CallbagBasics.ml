(* Source factories *)

let from_obs = CallbagFromObs.from_obs
let from_iter = CallbagFromIter.from_iter
let from_array = CallbagFromIter.from_array
let from_event = CallbagFromEvent.from_event
let from_promise = CallbagFromPromise.from_promise
let interval = CallbagInterval.interval


(* Sink factories *)

let for_each = CallbagForEach.for_each


(* Transformation operators *)

let map = CallbagMap.map
let scan = CallbagScan.scan
let flatten = CallbagFlatten.flatten


(* Filtering operators *)

let take = CallbagTake.take
let skip = CallbagSkip.skip
let filter = CallbagFilter.filter


(* Combination operators *)

let merge = CallbagMerge.merge
let concat = CallbagConcat.concat
let combine = CallbagCombine.combine


(* Utilities *)

let share = CallbagShare.share
