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

import Prelude ( Unit, (<<<) )
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

class ElementNode e

instance elementNodeElement :: ElementNode Element

-- instance eventListenerElement :: EventListener Element
-- instance nodeElement :: Node Element

-- | Checks whether an Element has a given attribute
hasAttr :: forall e. ElementNode e => e -> String -> Boolean
hasAttr = runFn2 _hasAttribute

foreign import _hasAttribute :: forall e. Fn2 e String Boolean

-- | Gets the value of an attribute, if the element has it
attr :: forall e. ElementNode e => e -> String -> Maybe String
attr e = toMaybe <<< runFn2 _getAttribute e

foreign import _getAttribute :: forall e. Fn2 e String (Nullable String)

setAttr :: forall e. ElementNode e => e -> String -> String -> Effect Unit
setAttr = runEffectFn3 _setAttribute

foreign import _setAttribute :: forall e. EffectFn3 e String String Unit

-- | Gets the names of the attributes the element possesses
attrNames :: forall e. ElementNode e => e -> Array String
attrNames = _getAttributeNames

foreign import _getAttributeNames :: forall e. e -> Array String

innerHTML :: forall e. ElementNode e => e -> String
innerHTML = _innerHTML

foreign import _innerHTML :: forall e. e -> String
