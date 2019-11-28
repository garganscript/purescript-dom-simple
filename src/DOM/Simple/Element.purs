module DOM.Simple.Element
  ( hasAttr, attr, attrNames, setAttr
  , innerHTML, boundingRect
  , module DOM.Simple.EventListener
  , module DOM.Simple.Child
  , module DOM.Simple.Node
  , module DOM.Simple.Parent
  , module DOM.Simple.Sibling
  ) where

import Prelude (Unit, pure, unit, ($))
import Data.Maybe ( Maybe )
import Data.Nullable (toMaybe)
import Effect ( Effect )

import DOM.Simple.Types (class IsElement, DOMRect)
import DOM.Simple.EventListener (Callback, addEventListener, callback, dispatchEvent, removeEventListener)
import DOM.Simple.Node (contains, name, nextSibling, ownerDocument, parentElement, parentNode, prevSibling, textContent)
import DOM.Simple.Sibling (nextElement, prevElement)
import DOM.Simple.Child (after, before, remove, replaceWith)
import DOM.Simple.Parent
import FFI.Simple ( (...), (..), delay )

-- | Checks whether an Element has a given attribute
hasAttr :: forall e. IsElement e => e -> String -> Boolean
hasAttr e p = e ... "hasAttribute" $ [p]

-- | Gets the value of an attribute, if the element has it
attr :: forall e. IsElement e => e -> String -> Maybe String
attr e a = toMaybe $ e ... "getAttribute" $ [a]

setAttr :: forall e. IsElement e => e -> String -> String -> Effect Unit
setAttr e a v = delay unit $ \_ -> pure $ e ... "setAttribute" $ [a, v]

-- | Gets the names of the attributes the element possesses
attrNames :: forall e. IsElement e => e -> Array String
attrNames e = e ... "getAttributeNames" $ []

innerHTML :: forall e. IsElement e => e -> String
innerHTML e = e .. "innerHTML"

boundingRect :: forall e. IsElement e => e -> DOMRect
boundingRect e = e ... "getBoundingClientRect" $ []
