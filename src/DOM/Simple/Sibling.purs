module DOM.Simple.Sibling
  ( class SiblingNode, prevElement, nextElement )
  where

import Prelude ( (<<<) )
import Data.Maybe ( Maybe )
import Data.Nullable ( Nullable, toMaybe )

import DOM.Simple.Types ( Element )
-- | A Node which can have siblings (i.e. elements and cdata)
class SiblingNode n -- DOM name: NonDocumentTypeElementNode

-- instance siblingNodeElement :: SiblingNode Element
-- | Returns the previous Element sibling if any
prevElement :: forall e. SiblingNode e => e -> Maybe Element
prevElement = toMaybe <<< _prevElement

-- | Returns the next Element sibling if any
nextElement :: forall e. SiblingNode e => e -> Maybe Element
nextElement = toMaybe <<< _nextElement

foreign import _prevElement :: forall e. SiblingNode e => e -> Nullable Element
foreign import _nextElement :: forall e. SiblingNode e => e -> Nullable Element

