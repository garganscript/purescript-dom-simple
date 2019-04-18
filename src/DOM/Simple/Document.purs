module DOM.Simple.Document
  ( document, global
  , createElement, createElement', createTextNode )
  where

import DOM.Simple.Types ( Document, Element, Text )
import Data.Function.Uncurried ( Fn2, runFn2 )

-- | The global document. Will be undefined on node.
foreign import global :: Document

-- | The global document. Will be undefined on node.
document :: Document
document = global

-- | Creates a new DOM element of the given tag using the global document
createElement :: String -> Element
createElement = createElement' document

-- | Creates a new DOM element of the given tag using the provided document
createElement' :: Document -> String -> Element
createElement' = runFn2 _createElement

-- | Create a text node with the given text
foreign import createTextNode :: String -> Text

foreign import _createElement :: Fn2 Document String Element

