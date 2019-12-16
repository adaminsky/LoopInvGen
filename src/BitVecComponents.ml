open Base
open Exceptions
open Expr     
                                    
let all = [
    {
      name = "bv-eq";
      codomain = Type.BOOL;
      domain = [Type.BITVEC _; Type.BITVEC _];
      is_argument_valid = (fun _ -> true);
      evaluate = (function [@warning "-8"] [Value.BitVec v1; Value.BitVec v2] ->
                    Value.Bool ((not (Bitarray.bvult v1 v2)) && (not (Bitarray.bvult v2 v1))));
      to_string = (fun [@warning "-8"] [v1;v2] -> "(= " ^ v1 ^ " " ^ v2 ^ ")");
      global_constraints = (fun _ -> []);
    } ;
    {
      name = "bvnot";
      codomain = Type.BITVEC _;
      domain = [Type.BITVEC _];
      is_argument_valid = (fun _ -> true);
      evaluate = (function [@warning "-8"] [Value.BitVec v] -> Value.BitVec (Bitarray.bvnot v));
      to_string = (fun [@warning "-8"] [a] -> "(bvnot " ^ a ^ ")");
      global_constraints = (fun _ -> []);
    } ;
    {
      name = "bvult";
      codomain = Type.BOOL;
      domain = [Type.BITVEC _; Type.BITVEC _];
      is_argument_valid = (fun _ -> true);
      evaluate = (function [@warning "-8"] [Value.BitVec v1; Value.BitVec v2] ->
                    Value.Bool (Bitarray.bvult v1 v2));
      to_string = (fun [@warning "-8"] [a ; b] -> "(bvult " ^ a ^ " " ^ b ^ ")");
      global_constraints = (fun _ -> []);
    } ;
    {
      name = "bvadd";
      codomain = Type.BITVEC _;
      domain = [Type.BITVEC _; Type.BITVEC _];
      is_argument_valid = (fun _ -> true);
      evaluate = (function [@warning "-8"] [Value.BitVec v1; Value.BitVec v2] ->
                    Value.BitVec (Bitarray.add v1 v2));
      to_string = (fun [@warning "-8"] [a ; b] -> "(bvadd " ^ a ^ " " ^ b ^ ")");
      global_constraints = (fun _ -> []);
    }     
  ]