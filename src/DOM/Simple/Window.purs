module DOM.Simple.Window
  ( Window, window )
  where

-- | A DOM Window object
foreign import data Window :: Type

-- | The global window
foreign import window :: Window

