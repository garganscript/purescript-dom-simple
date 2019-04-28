module DOM.Simple.Console where

import Prelude ( Unit, unit, ($), pure )
import Effect ( Effect )
import Effect.Uncurried
  ( EffectFn1, runEffectFn1, EffectFn2, runEffectFn2
  , EffectFn3, runEffectFn3, EffectFn4, runEffectFn4
  , EffectFn5, runEffectFn5, EffectFn6, runEffectFn6
  , EffectFn7, runEffectFn7, EffectFn8, runEffectFn8 )
import FFI.Simple
 ( (...), delay, unsafeGlobal
 , args2, args3, args4, args5, args6, args7, args8 )

foreign import data Console :: Type

console :: Console
console = unsafeGlobal "console"

log :: forall a. a -> Effect Unit
log a = delay unit $ \_ -> pure $ console ... "log" $ [a]
log2 :: forall a b. a -> b -> Effect Unit
log2 a b = delay unit $ \_ -> pure $ console ... "log" $ args2 a b
log3 :: forall a b c. a -> b -> c -> Effect Unit
log3 a b c = delay unit $ \_ -> pure $ console ... "log" $ args3 a b c
log4 :: forall a b c d. a -> b -> c -> d -> Effect Unit
log4 a b c d = delay unit $ \_ -> pure $ console ... "log" $ args4 a b c d
log5 :: forall a b c d e. a -> b -> c -> d -> e -> Effect Unit
log5 a b c d e = delay unit $ \_ -> pure $ console ... "log" $ args5 a b c d e
log6 :: forall a b c d e f. a -> b -> c -> d -> e -> f -> Effect Unit
log6 a b c d e f = delay unit $ \_ -> pure $ console ... "log" $ args6 a b c d e f
log7 :: forall a b c d e f g. a -> b -> c -> d -> e -> f -> g -> Effect Unit
log7 a b c d e f g = delay unit $ \_ -> pure $ console ... "log" $ args7 a b c d e f g
log8 :: forall a b c d e f g h. a -> b -> c -> d -> e -> f -> g -> h -> Effect Unit
log8 a b c d e f g h = delay unit $ \_ -> pure $ console ... "log" $ args8 a b c d e f g h
