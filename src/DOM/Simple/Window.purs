module DOM.Simple.Window
  ( Window, window, global )
  where

import Data.Maybe ( Maybe )
import FFI.Simple as FFI

-- | A DOM Window object
foreign import data Window :: Type

window :: Window
window = FFI.unsafeGlobal "window"

global :: forall a. String -> Maybe a
global = FFI.global
