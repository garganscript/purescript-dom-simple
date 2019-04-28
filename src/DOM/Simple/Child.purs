module DOM.Simple.Child ( class ChildNode, remove, before, after, replaceWith ) where

import Prelude ( Unit, ($), pure, unit )
import Effect ( Effect )
import Effect.Uncurried ( EffectFn1, runEffectFn1, EffectFn2, runEffectFn2 )

import DOM.Simple.Types ( Element )
import FFI.Simple ( (...), delay )

class ChildNode n

instance childNodeElement :: ChildNode Element

-- | Unhook the current node from its parent
remove :: forall n. ChildNode n => n -> Effect Unit
remove n = delay unit $ \_ -> pure $ n ... "remove" $ []

-- | Prepend some elements before the current node
before :: forall n. ChildNode n => n -> Array Element -> Effect Unit
before n es = delay unit $ \_ -> pure $ n ... "before" $ es

-- | Append some elements after the current node
after :: forall n. ChildNode n => n -> Array Element -> Effect Unit
after n es = delay unit $ \_ -> pure $ n ... "after" $ es

-- | Replace the current node with some others
replaceWith :: forall n. ChildNode n => n -> Array Element -> Effect Unit
replaceWith n es = delay unit $ \_ -> pure $ n ... "replaceWith" $ es

