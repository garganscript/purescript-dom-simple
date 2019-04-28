module DOM.Simple.Child ( remove, before, after, replaceWith ) where

import Prelude ( Unit, ($), pure, unit )
import Effect ( Effect )
import Effect.Uncurried ( EffectFn1, runEffectFn1, EffectFn2, runEffectFn2 )

import DOM.Simple.Types ( class IsChild, Element )
import FFI.Simple ( (...), delay )


-- | Unhook the current node from its parent
remove :: forall n. IsChild n => n -> Effect Unit
remove n = delay unit $ \_ -> pure $ n ... "remove" $ []

-- | Prepend some elements before the current node
before :: forall n. IsChild n => n -> Array Element -> Effect Unit
before n es = delay unit $ \_ -> pure $ n ... "before" $ es

-- | Append some elements after the current node
after :: forall n. IsChild n => n -> Array Element -> Effect Unit
after n es = delay unit $ \_ -> pure $ n ... "after" $ es

-- | Replace the current node with some others
replaceWith :: forall n. IsChild n => n -> Array Element -> Effect Unit
replaceWith n es = delay unit $ \_ -> pure $ n ... "replaceWith" $ es

