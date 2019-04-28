# purescript-dom-simple

A simpler binding to the DOM

## Status: beta

Brand new, but has tests.

## Rationale

I often don't need to do *much* with the DOM, but doing what I do need
to do can be painful with existing purescript libraries and I grew
tired of copying FFIs between projects.

This library is simple first 

This library is not as complete as the combination of
`purescript-web-dom` and `purescript-web-html` and may never be
libraries which try to achieve a certain amount of safety that makes
the common case (just wanting to `document.createElement` or
`document.getElementById` or such) quite verbose. This library
attempts to do a lot less in a more practical fashion.

## Usage

```purescript
module Example where

import Prelude
import DOM.Simple as DOM
import DOM.Simple.Document as Document
import DOM.Simple.Element as Element
import Effect (Effect)

main :: Effect Unit
main = do
  new <- Document.createElement "a"
  existing <- Document.getElementById("hello")
  Element.append existing new
```

## Contributing

Contributions are welcome, but please keep in line with the `simple`
philosophy. Ask questions if you're not sure :)

## Notes

We choose to export `window` and `document` as globals. Yes, they
might not be there in the case you're running under Node. Don't do
that. How would you even reasonably handle that case?

## Changelog

### 0.2.1

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

### 0.2.0

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

## Copyright and License

Copyright (c) 2019 James Laver

This software is free and open source software licensed under the
terms of the Mozilla Public License (MPL) 2.0

