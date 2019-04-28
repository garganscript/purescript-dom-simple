module DOM.Simple.EventListener
  ( class EventListener, Callback
  , dispatchEvent, addEventListener, removeEventListener
  ) where

import Prelude ( Unit, ($), (<<<), pure, unit )
import DOM.Simple.Types ( Element )
import DOM.Simple.Event ( class IsEvent )
import Effect ( Effect )
import Effect.Uncurried ( EffectFn1, mkEffectFn1 )
import FFI.Simple ( (...), delay, args2 )

class EventListener e

instance eventListenerElement :: EventListener Element

dispatchEvent :: forall l e. EventListener l => l -> e -> Effect Unit
dispatchEvent l e = l ... "dispatchEvent" $ [e]

newtype Callback a = Callback (EffectFn1 a Unit)

callback :: forall a. (a -> Effect Unit) -> Callback a
callback = Callback <<< mkEffectFn1

-- | A little unsafe
addEventListener
  :: forall listener event
  .  EventListener listener
  => IsEvent event
  => listener
  -> String
  -> Callback event
  -> Effect Unit
addEventListener obj name callback =
  delay unit $ \_ -> pure $ obj ... "addEventListener" $ args2 name callback

removeEventListener
  :: forall listener event
  .  EventListener listener
  => IsEvent event
  => listener
  -> String
  -> Callback event
  -> Effect Unit
removeEventListener obj name callback =
  delay unit $ \_ -> pure $ obj ... "removeEventListener" $ args2 name callback
