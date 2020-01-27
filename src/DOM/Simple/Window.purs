module DOM.Simple.Window
  ( window, global )
  where

import Data.Maybe ( Maybe )
import FFI.Simple as FFI
import DOM.Simple.Types (Window)

window :: Window
window = FFI.unsafeGlobal "window"

global :: forall a. String -> Maybe a
global = FFI.global
