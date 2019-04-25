module DOM.Simple.Element
  ( class ElementNode
  , hasAttr, attr, attrNames, setAttr
  , innerHTML
  , module DOM.Simple.EventListener
  , module DOM.Simple.Child
  , module DOM.Simple.Node
  , module DOM.Simple.Parent
  , module DOM.Simple.Sibling
  ) where

import Prelude ( Unit, ($), (<<<), pure )
import Data.Function.Uncurried ( Fn2, runFn2 )
import Data.Maybe ( Maybe )
import Data.Nullable ( Nullable, toMaybe )
import Effect ( Effect )
import Effect.Uncurried ( EffectFn3, runEffectFn3 )

import DOM.Simple.Types ( Element )
import DOM.Simple.EventListener ( class EventListener )
import DOM.Simple.Node ( class Node, name )
import DOM.Simple.Sibling ( class SiblingNode, prevElement, nextElement )
import DOM.Simple.Child ( class ChildNode, remove, before, after, replaceWith )
import DOM.Simple.Parent
  ( class ParentNode
  , childCount, children, firstChildElement, lastChildElement
  , append, prepend, querySelector, querySelectorAll
  )
import FFI.Simple ( (...), (..), delay )

class ElementNode e

instance elementNodeElement :: ElementNode Element

-- instance eventListenerElement :: EventListener Element
-- instance nodeElement :: Node Element

-- | Checks whether an Element has a given attribute
hasAttr :: forall e. ElementNode e => e -> String -> Boolean
hasAttr e p = e ... "hasAttribute" $ [p]

-- | Gets the value of an attribute, if the element has it
attr :: forall e. ElementNode e => e -> String -> Maybe String
attr e a = toMaybe $ e ... "getAttribute" $ [a]

setAttr :: forall e. ElementNode e => e -> String -> String -> Effect Unit
setAttr e a v = delay $ \_ -> pure $ e ... "setAttribute" $ [a, v]

-- | Gets the names of the attributes the element possesses
attrNames :: forall e. ElementNode e => e -> Array String
attrNames e = e ... "getAttributeNames" $ []

innerHTML :: forall e. ElementNode e => e -> String
innerHTML e = e .. "innerHTML"
