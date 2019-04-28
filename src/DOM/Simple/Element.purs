module DOM.Simple.Element
  ( hasAttr, attr, attrNames, setAttr
  , innerHTML, boundingRect
  , module DOM.Simple.EventListener
  , module DOM.Simple.Child
  , module DOM.Simple.Node
  , module DOM.Simple.Parent
  , module DOM.Simple.Sibling
  ) where

import Prelude ( Unit, ($), (<<<), pure, unit )
import Data.Function.Uncurried ( Fn2, runFn2 )
import Data.Maybe ( Maybe )
import Data.Nullable ( Nullable, toMaybe )
import Effect ( Effect )
import Effect.Uncurried ( EffectFn3, runEffectFn3 )

import DOM.Simple.Types
import DOM.Simple.EventListener
import DOM.Simple.Node
import DOM.Simple.Sibling
import DOM.Simple.Child
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
