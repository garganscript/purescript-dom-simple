module DOM.Simple.Node
  ( class Node
  , name
  ) where

import DOM.Simple.Types ( Element )

class Node n

instance nodeElement :: Node Element

name :: forall n. Node n => n -> String
name = nodeName

foreign import nodeName :: forall n. n -> String
