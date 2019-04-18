module DOM.Simple.Console where

import Data.Unit ( Unit )
import Effect ( Effect )
import Effect.Uncurried
  ( EffectFn1, runEffectFn1, EffectFn2, runEffectFn2
  , EffectFn3, runEffectFn3, EffectFn4, runEffectFn4
  , EffectFn5, runEffectFn5, EffectFn6, runEffectFn6
  , EffectFn7, runEffectFn7, EffectFn8, runEffectFn8 )

log :: forall a. a -> Effect Unit
log = runEffectFn1 _log
log2 :: forall a b. a -> b -> Effect Unit
log2 = runEffectFn2 _log2
log3 :: forall a b c. a -> b -> c -> Effect Unit
log3 = runEffectFn3 _log3
log4 :: forall a b c d. a -> b -> c -> d -> Effect Unit
log4 = runEffectFn4 _log4
log5 :: forall a b c d e. a -> b -> c -> d -> e -> Effect Unit
log5 = runEffectFn5 _log5
log6 :: forall a b c d e f. a -> b -> c -> d -> e -> f -> Effect Unit
log6 = runEffectFn6 _log6
log7 :: forall a b c d e f g. a -> b -> c -> d -> e -> f -> g -> Effect Unit
log7 = runEffectFn7 _log7
log8 :: forall a b c d e f g h. a -> b -> c -> d -> e -> f -> g -> h -> Effect Unit
log8 = runEffectFn8 _log8

foreign import _log :: forall a. EffectFn1 a Unit
foreign import _log2 :: forall a b. EffectFn2 a b Unit
foreign import _log3 :: forall a b c. EffectFn3 a b c Unit
foreign import _log4 :: forall a b c d. EffectFn4 a b c d Unit
foreign import _log5 :: forall a b c d e. EffectFn5 a b c d e Unit
foreign import _log6 :: forall a b c d e f. EffectFn6 a b c d e f Unit
foreign import _log7 :: forall a b c d e f g. EffectFn7 a b c d e f g Unit
foreign import _log8 :: forall a b c d e f g h. EffectFn8 a b c d e f g h Unit
