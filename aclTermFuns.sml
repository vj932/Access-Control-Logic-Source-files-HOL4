(* app load ["aclrulesTheory", "aclsemanticsTheory", "aclfoundationTheory"] *)

structure aclTermFuns :> aclTermFuns = struct

open HolKernel boolLib Parse bossLib
open aclrulesTheory aclsemanticsTheory aclfoundationTheory

(** Declare constants for ACL identifiers **)

val sat = prim_mk_const {Name="sat", Thy="aclrules"}
val prop = prim_mk_const {Name="prop", Thy="aclfoundation"}
val notf = prim_mk_const {Name="notf", Thy="aclfoundation"}
val andf = prim_mk_const {Name="andf", Thy="aclfoundation"}
val orf = prim_mk_const {Name="orf", Thy="aclfoundation"}
val impf = prim_mk_const {Name="impf", Thy="aclfoundation"}
val eqf = prim_mk_const {Name="eqf", Thy="aclfoundation"}
val says = prim_mk_const {Name="says", Thy="aclfoundation"}
val speaks_for = prim_mk_const {Name="speaks_for", Thy="aclfoundation"}
val controls = prim_mk_const {Name="controls", Thy="aclfoundation"}
val reps = prim_mk_const {Name="reps", Thy="aclfoundation"}
val domi = prim_mk_const {Name="domi", Thy="aclfoundation"}
val eqi = prim_mk_const {Name="eqi", Thy="aclfoundation"}
val doms = prim_mk_const {Name="doms", Thy="aclfoundation"}
val eqs = prim_mk_const {Name="eqs", Thy="aclfoundation"}
val eqn = prim_mk_const {Name="eqn", Thy="aclfoundation"}
val lte = prim_mk_const {Name="lte", Thy="aclfoundation"}
val lt = prim_mk_const {Name="lt", Thy="aclfoundation"}
val meet = prim_mk_const {Name="meet", Thy="aclfoundation"}
val quoting = prim_mk_const {Name="quoting", Thy="aclfoundation"}

(** Constructors **)
fun mk_sat (tuple, form) = mk_binop sat (tuple,form)
fun mk_prop term = mk_monop prop term
fun mk_notf term = mk_monop notf term
fun mk_andf (conj1,conj2) = mk_binop andf (conj1,conj2)
fun mk_orf (disj1,disj2) = mk_binop orf (disj1,disj2)
fun mk_impf (assum,conc) = mk_binop impf (assum,conc)
fun mk_eqf (left,right) = mk_binop eqf (left,right)
fun mk_says (princ,form) = mk_binop says (princ,form)
fun mk_speaks_for (princ1,princ2) = mk_binop speaks_for (princ1,princ2)
fun mk_controls (princ,form) = mk_binop controls (princ,form)
fun mk_reps (princ1,princ2,form) = mk_triop reps (princ1,princ2,form)
fun mk_domi (left,right) = mk_binop domi (left,right)
fun mk_eqi (left,right) = mk_binop eqi (left,right)
fun mk_doms (left,right) = mk_binop doms (left,right)
fun mk_eqs (left,right) = mk_binop eqs (left,right)
fun mk_eqn (left,right) = mk_binop eqn (left,right)
fun mk_lte (left,right) = mk_binop lte (left,right)
fun mk_lt (left,right) = mk_binop lt (left,right)
fun mk_meet (princ1,princ2) = mk_binop meet (princ1,princ2)
fun mk_quoting (princ1,princ2) = mk_binop quoting (princ1,princ2)

(** Destructors **)

(* ==== These use the obsolete ERR function to raise exceptions ====

val dest_sat = dest_binop sat (ERR "dest_sat" "not a sat term")
val dest_prop = dest_monop prop (ERR "dest_prop" "not a prop term")
val dest_notf = dest_monop notf (ERR "dest_notf" "not a notf term")
val dest_andf = dest_binop andf (ERR "dest_andf" "not an andf term")
val dest_orf = dest_binop orf (ERR "dest_orf" "not an orf term")
val dest_impf = dest_binop impf (ERR "dest_impf" "not an impf term")
val dest_eqf = dest_binop eqf (ERR "dest_eqf" "not an eqf term")
val dest_says = dest_binop says (ERR "dest_says" "not a says term")
val dest_speaks_for = dest_binop speaks_for (ERR "dest_speaks_for" "not a speaks_for term")
val dest_controls = dest_binop controls (ERR "dest_controls" "not a controls term")
val dest_reps = dest_triop reps (ERR "dest_reps" "not a reps term")
val dest_domi = dest_binop domi (ERR "dest_domi" "not a domi term")
val dest_eqi = dest_binop eqi (ERR "dest_eqi" "not an eqi term")
val dest_doms = dest_binop doms (ERR "dest_doms" "not a doms term")
val dest_eqs = dest_binop eqs (ERR "dest_eqs" "not a eqs term")
val dest_eqn = dest_binop eqn (ERR "dest_eqn" "not a eqn term")
val dest_lte = dest_binop lte (ERR "dest_lte" "not a lte term")
val dest_lt = dest_binop lt (ERR "dest_lt" "not a lt term")
val dest_meet = dest_binop meet (ERR "dest_meet" "not a meet term")
val dest_quoting = dest_binop quoting (ERR "dest_quoting" "not a quoting term")

 ==== end obsolete definitions ==================================== *)
(* ==== Begin obsolete definitions after Trindemossen 1 ====
(* Development version past Trindemossen 1 added locn.locn to error_record *)
(* === updated to do HOL exception with HOL_ERR instead of ERR === *)
val dest_sat =
 dest_binop
  sat
  (HOL_ERR {origin_function = "dest_sat", message = "not a sat term",
            origin_structure = "acl_infRules"})
val dest_prop =
 dest_monop
 prop
 (HOL_ERR {origin_function = "dest_prop", message = "not a prop term",
           origin_structure = "acl_infRules"})
val dest_notf =
 dest_monop
 notf
 (HOL_ERR {origin_function = "dest_notf", message = "not a notf term",
           origin_structure = "acl_infRules"})
val dest_andf =
 dest_binop
 andf
 (HOL_ERR {origin_function = "dest_andf", message = "not an andf term",
           origin_structure = "acl_infRules"})
val dest_orf =
 dest_binop
 orf
 (HOL_ERR {origin_function = "dest_orf", message = "not an orf term",
           origin_structure = "acl_infRules"})
val dest_impf =
 dest_binop
 impf
 (HOL_ERR {origin_function = "dest_impf", message = "not an impf term",
           origin_structure = "acl_infRules"})
val dest_eqf =
 dest_binop
 eqf
 (HOL_ERR {origin_function = "dest_eqf", message = "not an eqf term",
           origin_structure = "acl_infRules"})
val dest_says =
 dest_binop
 says
 (HOL_ERR {origin_function = "dest_says", message = "not a says term",
           origin_structure = "acl_infRules"})
val dest_speaks_for =
 dest_binop
 speaks_for
 (HOL_ERR {origin_function = "dest_speaks_for", message = "not a speaks_for term",
           origin_structure = "acl_infRules"})
val dest_controls =
 dest_binop
 controls
 (HOL_ERR {origin_function = "dest_controls", message = "not a controls term",
           origin_structure = "acl_infRules"})
val dest_reps =
 dest_triop
 reps
 (HOL_ERR {origin_function = "dest_reps", message = "not a reps term",
           origin_structure = "acl_infRules"})
val dest_domi =
 dest_binop
 domi
 (HOL_ERR {origin_function = "dest_domi", message = "not a domi term",
           origin_structure = "acl_infRules"})
val dest_eqi =
 dest_binop
 eqi
 (HOL_ERR {origin_function = "dest_eqi", message = "not an eqi term",
           origin_structure = "acl_infRules"})
val dest_doms =
 dest_binop
 doms
 (HOL_ERR {origin_function = "dest_doms", message = "not a doms term",
           origin_structure = "acl_infRules"})
val dest_eqs =
 dest_binop
 eqs
 (HOL_ERR {origin_function = "dest_eqs", message = "not a eqs term",
           origin_structure = "acl_infRules"})
val dest_eqn =
 dest_binop
 eqn
 (HOL_ERR {origin_function = "dest_eqn", message = "not a eqn term",
           origin_structure = "acl_infRules"})
val dest_lte =
 dest_binop
 lte
 (HOL_ERR {origin_function = "dest_lte", message = "not a lte term",
           origin_structure = "acl_infRules"})
val dest_lt =
 dest_binop
 lt
 (HOL_ERR {origin_function = "dest_lt", message =  "not a lt term",
           origin_structure = "acl_infRules"})
val dest_meet =
 dest_binop
 meet
 (HOL_ERR {origin_function = "dest_meet", message = "not a meet term",
           origin_structure = "acl_infRules"})
val dest_quoting =
 dest_binop
 quoting
 (HOL_ERR {origin_function = "dest_quoting", message = "not a quoting term",
           origin_structure = "acl_infRules"})
 ==== end obsolete definitions after Trindemossen 1 ==== *)

(* === New updated definitions using mk_HOL_ERR === *)
(* === mk_HOL_ERR "Module" "function" "message" === *)
val dest_sat =
 dest_binop
  sat
  (mk_HOL_ERR "acl_infRules" "dest_sat" "not a sat term")

val dest_prop =
 dest_monop
 prop
 (mk_HOL_ERR "acl_infRules" "dest_prop" "not a prop term")

val dest_notf =
 dest_monop
 notf
 (mk_HOL_ERR "acl_infRules" "dest_notf" "not a notf term")

val dest_andf =
 dest_binop
 andf
 (mk_HOL_ERR "acl_infRules" "dest_andf" "not an andf term")

val dest_orf =
 dest_binop
 orf
 (mk_HOL_ERR "acl_infRules" "dest_orf" "not an orf term")

val dest_impf =
 dest_binop
 impf
 (mk_HOL_ERR "acl_infRules" "dest_impf" "not an impf term")

val dest_eqf =
 dest_binop
 eqf
 (mk_HOL_ERR "acl_infRules" "dest_eqf" "not an eqf term")

val dest_says =
 dest_binop
 says
 (mk_HOL_ERR "acl_infRules" "dest_says" "not a says term")

val dest_speaks_for =
 dest_binop
 speaks_for
 (mk_HOL_ERR "acl_infRules" "dest_speaks_for" "not a speaks_for term")

val dest_controls =
 dest_binop
 controls
 (mk_HOL_ERR "acl_infRules" "dest_controls" "not a controls term")

val dest_reps =
 dest_triop
 reps
 (mk_HOL_ERR "acl_infRules" "dest_reps" "not a reps term")

val dest_domi =
 dest_binop
 domi
 (mk_HOL_ERR "acl_infRules" "dest_domi" "not a domi term")

val dest_eqi =
 dest_binop
 eqi
 (mk_HOL_ERR "acl_infRules" "dest_eqi" "not an eqi term")

val dest_doms =
 dest_binop
 doms
 (mk_HOL_ERR "acl_infRules" "dest_doms" "not a doms term")

val dest_eqs =
 dest_binop
 eqs
 (mk_HOL_ERR "acl_infRules" "dest_eqs" "not a eqs term")

val dest_eqn =
 dest_binop
 eqn
 (mk_HOL_ERR "acl_infRules" "dest_eqn" "not a eqn term")

val dest_lte =
 dest_binop
 lte
 (mk_HOL_ERR "acl_infRules" "dest_lte" "not a lte term")

val dest_lt =
 dest_binop
 lt
 (mk_HOL_ERR "acl_infRules" "dest_lt" "not a lt term")

val dest_meet =
 dest_binop
 meet
 (mk_HOL_ERR "acl_infRules" "dest_meet" "not a meet term")
val dest_quoting =
 dest_binop
 quoting
 (mk_HOL_ERR "acl_infRules" "dest_quoting" "not a quoting term")

(** Tests **)

val is_sat = can dest_sat
val is_prop = can dest_prop
val is_notf = can dest_notf
val is_andf = can dest_andf
val is_orf = can dest_orf
val is_impf = can dest_impf
val is_eqf = can dest_eqf
val is_says = can dest_says
val is_speaks_for = can dest_speaks_for
val is_controls = can dest_controls
val is_reps = can dest_reps
val is_domi = can dest_domi
val is_eqi = can dest_eqi
val is_doms = can dest_doms
val is_eqs = can dest_eqs
val is_eqn = can dest_eqn
val is_lte = can dest_lte
val is_lt = can dest_lt
val is_meet = can dest_meet
val is_quoting = can dest_quoting


end
