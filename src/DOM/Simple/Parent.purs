module DOM.Simple.Parent
  ( class ParentNode
  , childCount, children, firstChildElement, lastChildElement
  , append, prepend, querySelector, querySelectorAll
  )
  where

import Prelude ( Unit, (<<<), (<$>) )
import Data.Maybe ( Maybe )
import Data.Nullable ( Nullable, toMaybe )
import Effect ( Effect )
import Effect.Uncurried ( EffectFn2, runEffectFn2 )

import DOM.Simple.Types ( Element, Document, Fragment )

-- | Parent nodes may contain children
class ParentNode n

instance parentNodeElement :: ParentNode Element
instance parentNodeDocument :: ParentNode Document
instance parentNodeFragment :: ParentNode Fragment

-- | Returns the number of child Elements
childCount :: forall n. ParentNode n => n -> Int
childCount = _childCount

foreign import _childCount :: forall n. n -> Int

-- | Returns an array of the child Elements
children :: forall n. ParentNode n => n -> Array Element
children = _children

foreign import _children :: forall n. n -> Array Element

-- | Find the first Element that is a child of the current Node, if any
firstChildElement :: forall n. ParentNode n => n -> Maybe Element
firstChildElement = toMaybe <<< _firstElementChild

foreign import _firstElementChild :: forall n. n -> Nullable Element

-- | Find the last Element that is a child of the current Node, if any
lastChildElement :: forall n. ParentNode n => n -> Maybe Element
lastChildElement = toMaybe <<< _lastElementChild

foreign import _lastElementChild :: forall n. n -> Nullable Element

-- todo: actually be any node
append :: forall n. ParentNode n => n -> Array Element -> Effect Unit
append = runEffectFn2 _append

foreign import _append :: forall n. EffectFn2 n (Array Element) Unit

prepend :: forall n. ParentNode n => n -> Array Element -> Effect Unit
prepend = runEffectFn2 _prepend

foreign import _prepend :: forall n. EffectFn2 n (Array Element) Unit

querySelector :: forall n. ParentNode n => n -> String -> Effect (Maybe Element)
querySelector n s = toMaybe <$> runEffectFn2 _querySelector n s

foreign import _querySelector :: forall n. EffectFn2 n String (Nullable Element)

querySelectorAll :: forall n. ParentNode n => n -> String -> Effect (Array Element)
querySelectorAll = runEffectFn2 _querySelectorAll

foreign import _querySelectorAll :: forall n. EffectFn2 n String (Array Element)


