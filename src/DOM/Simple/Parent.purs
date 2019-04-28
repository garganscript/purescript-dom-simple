module DOM.Simple.Parent
  ( class ParentNode
  , childCount, children, firstChildElement, lastChildElement
  , append, prepend, querySelector, querySelectorAll
  )
  where

import Prelude ( Unit, ($), (<<<), pure, unit )
import Data.Maybe ( Maybe )
import Data.Nullable ( Nullable, toMaybe )
import Effect ( Effect )
import FFI.Simple ( getProperty, applyMethod, delay )
import FFI.Simple.PseudoArray as Array

import DOM.Simple.Types ( Element, Document, Fragment )

-- | Parent nodes may contain children
class ParentNode n

instance parentNodeElement :: ParentNode Element
instance parentNodeDocument :: ParentNode Document
instance parentNodeFragment :: ParentNode Fragment

-- | Returns the number of child Elements
childCount :: forall n. ParentNode n => n -> Int
childCount = getProperty "childElementCount"

-- | Returns an array of the child Elements
children :: forall n. ParentNode n => n -> Array Element
children = Array.from <<< getProperty "children"

-- | Find the first Element that is a child of the current Node, if any
firstChildElement :: forall n. ParentNode n => n -> Maybe Element
firstChildElement = toMaybe <<< getProperty "firstElementChild"

-- | Find the last Element that is a child of the current Node, if any
lastChildElement :: forall n. ParentNode n => n -> Maybe Element
lastChildElement = toMaybe <<< getProperty "lastElementChild"

-- todo: actually be any node
append :: forall n. ParentNode n => n -> Array Element -> Effect Unit
append n e = pure $ applyMethod "append" n e

prepend :: forall n. ParentNode n => n -> Array Element -> Effect Unit
prepend n e = pure $ applyMethod "prepend" n e

querySelector :: forall n. ParentNode n => n -> String -> Effect (Maybe Element)
querySelector n s = delay unit $ \_ -> pure $ toMaybe $ applyMethod "querySelector" n [s]

querySelectorAll :: forall n. ParentNode n => n -> String -> Effect (Array Element)
querySelectorAll n s = delay unit $ \_ -> pure $ Array.from $ applyMethod "querySelectorAll" n [s]


