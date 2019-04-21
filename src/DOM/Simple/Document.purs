module DOM.Simple.Document
  ( document, createElement, createElement', createTextNode )
  where

import DOM.Simple.Types ( Document, Element, Text )
import FFI.Simple ( callMethod, applyMethod )
import DOM.Simple.Window ( global ) 

-- | The global document. Will be undefined on node.
document :: Document
document = global "document"

-- | Creates a new DOM element of the given tag using the global document
createElement :: String -> Element
createElement = createElement' document

-- | Creates a new DOM element of the given tag using the provided document
createElement' :: Document -> String -> Element
createElement' d s = applyMethod "createElement" d [s]

createTextNode :: String -> Text
createTextNode = createTextNode' document

-- | Create a text node with the given text
createTextNode' :: Document -> String -> Text
createTextNode' d s = applyMethod "createTextNode" d [s]

