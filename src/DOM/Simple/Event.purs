module DOM.Simple.Event
  ( click
  ) where

import Prelude ( Unit, (<<<), pure )
import Effect ( Effect )
import DOM.Simple.Types ( Element )
import FFI.Simple ( callMethod )

class Event e

click :: Element -> Effect Unit
click = pure <<< callMethod "click"

-- stopPropagation :: forall e. Event e => e -> Effect Unit
-- stopImmediatePropagation :: SyntheticEvent -> Effect Unit
-- preventDefault :: SyntheticEvent -> Effect Unit
-- isPropagationStopped :: SyntheticEvent -> Effect Bool
-- isDefaultPrevented :: SyntheticEvent -> Effect Bool
-- isTrusted :: SyntheticEvent -> Effect Bool
-- defaultPrevented :: SyntheticEvent -> Effect Bool
-- bubbles :: Event -> Effect Bool
-- cancelable :: SyntheticEvent -> Effect Bool
-- eventPhase :: SyntheticEvent -> Effect Integer
-- timestamp :: SyntheticEvent -> Effect Integer
-- type' :: SyntheticEvent -> Effect String
-- currentTarget :: SyntheticEvent -> Nullable DOMElement
-- target :: SyntheticEvent -> Nullable DOMElement
-- nativeEvent :: SyntheticEvent -> ???

