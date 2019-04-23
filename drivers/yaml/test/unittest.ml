module Driver = struct
  include Protocol_conv_yaml.Yaml
  let of_driver_exn = of_yaml_exn
  let of_driver = of_yaml
  let to_driver = to_yaml
  let sexp_of_t : t -> Sexplib.Sexp.t = fun t ->
    Sexplib.Std.sexp_of_string (to_string_hum t)
end
module Unittest = Test.Unittest.Make (Driver)
let () = Unittest.run ~name:"yaml" ()
