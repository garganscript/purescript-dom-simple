module DOM.Simple.Child ( class ChildNode, remove, before, after, replaceWith ) where

import Prelude ( Unit )
import Effect ( Effect )
import Effect.Uncurried ( EffectFn1, runEffectFn1, EffectFn2, runEffectFn2 )

import DOM.Simple.Types ( Element )

class ChildNode n

instance childNodeElement :: ChildNode Element

-- | Unhook the current node from its parent
remove :: forall n. ChildNode n => n -> Effect Unit
remove = runEffectFn1 _remove

foreign import _remove :: forall n. ChildNode n => EffectFn1 n Unit

-- | Prepend some elements before the current node
before :: forall n. ChildNode n => n -> Array Element -> Effect Unit
before = runEffectFn2 _before

foreign import _before :: forall n. ChildNode n => EffectFn2 n (Array Element) Unit

-- | Append some elements after the current node
after :: forall n. ChildNode n => n -> Array Element -> Effect Unit
after = runEffectFn2 _after

foreign import _after :: forall n. ChildNode n => EffectFn2 n (Array Element) Unit

-- | Replace the current node with some others
replaceWith :: forall n. ChildNode n => n -> Array Element -> Effect Unit
replaceWith = runEffectFn2 _replaceWith

foreign import _replaceWith :: forall n. ChildNode n => EffectFn2 n (Array Element) Unit




