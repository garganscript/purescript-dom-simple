module DOM.Simple.EventListener
  ( Callback
  , dispatchEvent, addEventListener, removeEventListener
  ) where

import Prelude ( Unit, ($), (<<<), pure, unit )
import DOM.Simple.Types ( class IsEventListener, Element )
import DOM.Simple.Event ( class IsEvent )
import Effect ( Effect )
import Effect.Uncurried ( EffectFn1, mkEffectFn1 )
import FFI.Simple ( (...), delay, args2 )

dispatchEvent :: forall l e. IsEventListener l => l -> e -> Effect Unit
dispatchEvent l e = l ... "dispatchEvent" $ [e]

newtype Callback a = Callback (EffectFn1 a Unit)

callback :: forall a. (a -> Effect Unit) -> Callback a
callback = Callback <<< mkEffectFn1

-- | A little unsafe
addEventListener
  :: forall listener event
  .  IsEventListener listener
  => IsEvent event
  => listener
  -> String
  -> Callback event
  -> Effect Unit
addEventListener obj name callback =
  delay unit $ \_ -> pure $ obj ... "addEventListener" $ args2 name callback

removeEventListener
  :: forall listener event
  .  IsEventListener listener
  => IsEvent event
  => listener
  -> String
  -> Callback event
  -> Effect Unit
removeEventListener obj name callback =
  delay unit $ \_ -> pure $ obj ... "removeEventListener" $ args2 name callback
