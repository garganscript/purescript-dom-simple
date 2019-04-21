module DOM.Simple.Window
  ( Window, window, global )
  where

import FFI.Simple

-- | A DOM Window object
foreign import data Window :: Type

-- | The global window
foreign import window :: Window

global :: forall a. String -> a
global n = getProperty n window
