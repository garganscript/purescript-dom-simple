# Changelog

## 0.4.0

* Migrate to `spago@next`.

## 0.2.1

New:

* `D.S.Event`:
  * `class IsMouseEvent`

Fixes:

* More instances


Breakages:

* `D.S.EventListener`:
  * `class EventListener` -> `class D.S.Types.IsEventListener`
* `D.S.Node`:
  * `class IsNode` -> `class D.S.Types.IsNode`
* `D.S.Element`:
  * `class ElementNode` -> `class D.S.Types.IsElement`
* `D.S.Child`:
  * `class ChildNode` -> `class D.S.Types.IsChild`
* `D.S.Parent`:
  * `class ParentNode` -> `class D.S.Types.IsParent`

## 0.2.0

New:

* `D.S.Node`
  * `contains` to check if a node contains another
* `D.S.Events`
  * Lots! Borderline usable now!
* `D.S.Types`
  * `DOMRect` (for `D.S.Element.boundingRect`)
* `D.S.Element`:
  * `boundingRect`
* `D.S.EventListener`:
  * `Callback` type
  * `addEventListener`
  * `removeEventListener`

Breakages:

* `D.S.Node`
  * `class Node` -> `class IsNode`

Misc:

* Upgrade to `ffi-simple` v0.2.1
* Removed all ffi javascript in favour of `ffi-simple`

