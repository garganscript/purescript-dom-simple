module DOM.Simple.Document
  ( document, createElement, createElement', createTextNode )
  where

import Prelude ( ($) )
import DOM.Simple.Types ( Document, Element, Text )
import FFI.Simple ( (...), (..) )
import DOM.Simple.Window ( window )

-- | The global document. Will be undefined on node.
document :: Document
document = window .. "document"

-- | Creates a new DOM element of the given tag using the global document
createElement :: String -> Element
createElement = createElement' document

-- | Creates a new DOM element of the given tag using the provided document
createElement' :: Document -> String -> Element
createElement' d s = d ... "createElement" $ [s]

createTextNode :: String -> Text
createTextNode = createTextNode' document

-- | Create a text node with the given text
createTextNode' :: Document -> String -> Text
createTextNode' d s = d ... "createTextNode" $ [s]


