module DOM.Simple.Types
  ( class IsEventListener
  , class IsNode
  , class IsParent
  , class IsChild
  , class IsElement
  , class IsSibling
  , Window, Document, Fragment, Text, Element, DOMRect
  ) where

import Prelude ( class Show )

class IsEventListener n
class IsEventListener n <= IsNode n
-- | Parent nodes may contain children
class IsNode n <= IsParent n

-- | A child node may occur within a parent
class IsNode n <= IsChild n

class IsNode n <= IsElement n

-- | A Node which can have siblings (i.e. elements and cdata)
class IsNode n <= IsSibling n

foreign import data Window :: Type

instance windowIsEventListener :: IsEventListener Window

foreign import data Document :: Type

instance documentIsEventListener :: IsEventListener Document
instance documentIsNode :: IsNode Document
instance documentIsParent :: IsParent Document

-- | A document fragment
foreign import data Fragment :: Type

instance fragmentIsEventListener :: IsEventListener Fragment
instance fragmentIsNode :: IsNode Fragment
instance fragmentIsParent :: IsParent Fragment

foreign import data Text :: Type

instance textIsEventListener :: IsEventListener Text
instance textIsNode :: IsNode Text

foreign import data Element :: Type

instance elementIsEventListener :: IsEventListener Element
instance elementIsNode :: IsNode Element
instance elementIsParent :: IsParent Element
instance elementIsChild :: IsChild Element
instance elementIsElement :: IsElement Element
instance elementIsSibling :: IsSibling Element

instance showElement :: Show Element where
  show _ = "<DOM.Simple.Element>"

instance showText :: Show Text where
  show _ = "<DOM.Simple.Text>"

instance showFragment :: Show Fragment where
  show _ = "<DOM.Simple.Fragment>"

instance showDocument :: Show Document where
  show _ = "<DOM.Simple.Document>"

instance showWindow :: Show Window where
  show _ = "<DOM.Simple.Window>"

type DOMRect =
  { x :: Number
  , y :: Number
  , width :: Number
  , height :: Number
  , top :: Number
  , right :: Number
  , bottom :: Number
  , left :: Number }


