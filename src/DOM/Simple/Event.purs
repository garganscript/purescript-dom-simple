module DOM.Simple.Event
  ( click
  ) where

import Prelude ( Unit )
import Effect ( Effect )
import Effect.Uncurried ( EffectFn2, runEffectFn2 )

import DOM.Simple.Types ( Element )

click :: Element -> Effect Unit
click = runEffectFn2 _event "click"

foreign import _event :: EffectFn2 String Element Unit

