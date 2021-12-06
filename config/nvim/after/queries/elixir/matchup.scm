; Function definition
(call target: ((identifier) @open.def (#any-of? @open.def "def" "defp"))
 (do_block
  [(rescue_block "rescue" @mid.def.1)
   (catch_block "catch" @mid.def.2)]?
  "end" @close.def)) @scope.def

; case/cond clause
(call target: ((identifier) @open.case (#any-of? @open.case "case" "cond"))
 (do_block
  "end" @close.case)) @scope.case

; if/with clause
(call target: ((identifier) @open.if (#any-of? @open.if "if" "with"))
 (do_block
  (else_block "else" @mid.else.1)?
  "end" @close.if)) @scope.if

; try clause
(call target: ((identifier) @open.try (#eq? @open.try "try"))
 (do_block
  [(rescue_block "rescue" @mid.try.1)
   (catch_block "catch" @mid.try.2)
   (after_block "after" @mid.try.3)]?
  "end" @close.try)) @scope.try

; receive clause
(call target: ((identifier) @open.receive (#eq? @open.receive "receive"))
 (do_block
  (after_block "after" @mid.receive.1)?
  "end" @close.receive)) @scope.receive

; for comprehension
(call target: ((identifier) @open.for (#eq? @open.for "for"))
 (do_block
  "end" @close.for)) @scope.for
