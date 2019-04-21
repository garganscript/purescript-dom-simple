module DOM.Simple.Node
  ( class Node
  , name
  ) where

import Prelude ( Unit, ($), (<<<), pure )
import Effect ( Effect )
import Data.Maybe ( Maybe )
import Data.Nullable ( toMaybe )
import DOM.Simple.Types ( Document, Element )
import FFI.Simple ( (..), (...), getProperty, setProperty, callMethod )

class Node n

instance nodeElement :: Node Element

name :: forall n. Node n => n -> String
name = getProperty "nodeName"

-- | Gets the previous sibling
prevSibling :: forall n m. Node n => Node m => n -> m
prevSibling = getProperty "previousSibling"

-- | Gets the next sibling
nextSibling :: forall n m. Node n => Node m => n -> m
nextSibling = getProperty "nextSibling"

ownerDocument :: forall n m. Node n => Node m => n -> Document
ownerDocument = getProperty "ownerDocument"

parentNode :: forall n m. Node n => Node m => n -> m
parentNode = getProperty "parentNode"

parentElement :: forall n. Node n => n -> Maybe Element
parentElement n = toMaybe $ n .. "parentElement"

textContent :: forall n. Node n => n -> String
textContent = getProperty "textContent"

setTextContent :: forall n. Node n => n -> String -> Effect n
setTextContent n = pure <<< setProperty "textContent" n

appendChild :: forall n m. Node n => Node m => n -> m -> Effect Unit
appendChild n c = pure $ n ... "appendChild" $ [c]

clone :: forall n. Node n => n -> n
clone = callMethod "cloneNode"

-- compareDocumentPosition
-- getRootNode
-- hasChildNodes
-- insertBefore
-- isDefaultNamespace
-- isEqualNode
-- isSameNode
-- lookupPrefix
-- lookupNamespaceURI
-- normalize
-- removeChild
-- replaceChild
