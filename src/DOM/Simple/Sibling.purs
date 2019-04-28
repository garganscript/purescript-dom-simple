module DOM.Simple.Sibling
  ( prevElement, nextElement )
  where

import Prelude ( (<<<) )
import Data.Maybe ( Maybe )
import Data.Nullable ( Nullable, toMaybe )

import FFI.Simple ( getProperty )
import DOM.Simple.Types ( class IsSibling, Element )

-- | Returns the previous Element sibling if any
prevElement :: forall e. IsSibling e => e -> Maybe Element
prevElement = toMaybe <<< getProperty "previousElementSibling"

-- | Returns the next Element sibling if any
nextElement :: forall e. IsSibling e => e -> Maybe Element
nextElement = toMaybe <<< getProperty "nextElementSibling"

