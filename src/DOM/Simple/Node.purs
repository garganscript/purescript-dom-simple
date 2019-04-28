module DOM.Simple.Node
  ( class IsNode
  , name
  ) where

import Prelude ( Unit, ($), pure, unit )
import Effect ( Effect )
import Data.Maybe ( Maybe )
import Data.Nullable ( toMaybe )
import DOM.Simple.Types ( Document, Element )
import FFI.Simple ( (..), (...), getProperty, setProperty, delay )

class IsNode n

instance nodeElement :: IsNode Element

name :: forall n. IsNode n => n -> String
name = getProperty "nodeName"

-- | Gets the previous sibling
prevSibling :: forall n m. IsNode n => IsNode m => n -> m
prevSibling = getProperty "previousSibling"

-- | Gets the next sibling
nextSibling :: forall n m. IsNode n => IsNode m => n -> m
nextSibling = getProperty "nextSibling"

ownerDocument :: forall n m. IsNode n => IsNode m => n -> Document
ownerDocument = getProperty "ownerDocument"

parentNode :: forall n m. IsNode n => IsNode m => n -> m
parentNode = getProperty "parentNode"

parentElement :: forall n. IsNode n => n -> Maybe Element
parentElement n = toMaybe $ n .. "parentElement"

textContent :: forall n. IsNode n => n -> String
textContent = getProperty "textContent"

setTextContent :: forall n. IsNode n => n -> String -> Effect n
setTextContent n t = delay unit $ \_ -> pure $ setProperty "textContent" n t

appendChild :: forall n m. IsNode n => IsNode m => n -> m -> Effect Unit
appendChild n c = delay unit $ \_ -> pure $ n ... "appendChild" $ [c]

clone :: forall n. IsNode n => n -> n
clone n = n ... "cloneNode" $ []

contains :: forall n. IsNode n => n -> n -> Boolean
contains n o = n ... "contains" $ [o]

