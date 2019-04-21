module DOM.Simple.Child ( class ChildNode, remove, before, after, replaceWith ) where

import Prelude ( Unit, ($), (<<<), pure )
import Effect ( Effect )
import Effect.Uncurried ( EffectFn1, runEffectFn1, EffectFn2, runEffectFn2 )

import DOM.Simple.Types ( Element )
import FFI.Simple ( applyMethod, callMethod )

class ChildNode n

instance childNodeElement :: ChildNode Element

-- | Unhook the current node from its parent
remove :: forall n. ChildNode n => n -> Effect Unit
remove = pure <<< callMethod "remove"

-- | Prepend some elements before the current node
before :: forall n. ChildNode n => n -> Array Element -> Effect Unit
before n = pure <<< applyMethod "before" n

-- | Append some elements after the current node
after :: forall n. ChildNode n => n -> Array Element -> Effect Unit
after n = pure <<< applyMethod "after" n

-- | Replace the current node with some others
replaceWith :: forall n. ChildNode n => n -> Array Element -> Effect Unit
replaceWith n = pure <<< applyMethod "replaceWith" n

