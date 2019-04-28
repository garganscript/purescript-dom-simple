module DOM.Simple.Types
  ( Window, Document, Fragment, Text, Element, DOMRect
  ) where

import Prelude ( class Show )

foreign import data Window :: Type

foreign import data Document :: Type

-- | A document fragment
foreign import data Fragment :: Type

foreign import data Text :: Type

foreign import data Element :: Type

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


