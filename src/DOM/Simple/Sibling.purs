module DOM.Simple.Sibling
  ( class SiblingNode, prevElement, nextElement )
  where

import Prelude ( (<<<) )
import Data.Maybe ( Maybe )
import Data.Nullable ( Nullable, toMaybe )

import FFI.Simple ( getProperty )
import DOM.Simple.Types ( Element )

-- | A Node which can have siblings (i.e. elements and cdata)
class SiblingNode n -- DOM name: NonDocumentTypeElementNode

instance siblingNodeElement :: SiblingNode Element

-- | Returns the previous Element sibling if any
prevElement :: forall e. SiblingNode e => e -> Maybe Element
prevElement = toMaybe <<< getProperty "previousElementSibling"

-- | Returns the next Element sibling if any
nextElement :: forall e. SiblingNode e => e -> Maybe Element
nextElement = toMaybe <<< getProperty "nextElementSibling"

