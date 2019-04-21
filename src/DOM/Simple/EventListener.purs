module DOM.Simple.EventListener
  ( class EventListener
  , dispatchEvent -- , addEventListener, removeEventListener
  ) where

import Prelude ( Unit, ($) )
import DOM.Simple.Types ( Element )
import Effect ( Effect )
import Effect.Uncurried ( EffectFn2, runEffectFn2 )
import FFI.Simple ( (...) )

class EventListener e

instance eventListenerElement :: EventListener Element

dispatchEvent :: forall l e. EventListener l => l -> e -> Effect Unit
dispatchEvent l e = l ... "dispatchEvent" $ [e]

-- addEventListener
-- removeEventListener
