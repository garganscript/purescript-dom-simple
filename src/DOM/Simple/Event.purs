module DOM.Simple.Event
  -- ( class IsEvent
  -- , EventPhase(..)
  -- , Events(..)
  -- , Event
  -- , bubbles, cancelable, composed, trusted
  -- , defaultPrevented, propagationStopped
  -- , eventPhase, timestamp, type'
  -- , target, currentTarget, relatedTarget, stopPropagation
  -- , stopImmediatePropagation, preventDefault

  -- , class HasModifierKeys
  -- , altKey, ctrlKey, shiftKey, metaKey, getModifierState

  -- , AnimationEvent
  -- , ClipboardEvent
  -- , CompositionEvent
  -- , DragEvent
  -- , FocusEvent
  -- , ImageEvent

  -- , KeyboardEvent
  -- , composing, key, locale, location, repeat

  -- , MediaEvent
  -- , MessageEvent

  -- , MouseEvent
  -- , buttons, region
  -- , clientX, clientY
  -- , movementX, movementY
  -- , offsetX, offsetY
  -- , pageX, pageY
  -- , screenX, screenY

  -- , MouseButtonEvent, button

  -- , PageTransitionEvent
  -- , PointerEvent
  -- , ProgressEvent
  -- , SelectionEvent
  -- , ToggleEvent
  -- , TouchEvent
  -- , TransitionEvent
  -- , UIEvent
  -- , WheelEvent
  -- )
  where

import Prelude ( class Show, Unit, ($), (<$>), (<<<), show, pure, unit )
import Effect ( Effect )
import Data.Array as A
import Data.Maybe ( Maybe(..) )
import Data.Nullable ( toMaybe )
import DOM.Simple.Types ( Element )
import FFI.Simple ( (..), (...), delay, unsafeGlobal, instanceOf )
import Unsafe.Coerce ( unsafeCoerce )
class IsEvent e

click :: Element -> Effect Unit
click e = delay unit $ \_ -> e ... "click" $ []

data EventPhase = None | Capturing | AtTarget | Bubbling

foreign import data Event :: Type
foreign import data AnimationEvent :: Type
foreign import data ClipboardEvent :: Type
foreign import data CompositionEvent :: Type
foreign import data DragEvent :: Type
foreign import data FocusEvent :: Type
foreign import data HashChangeEvent :: Type
foreign import data ImageEvent :: Type
foreign import data InputEvent :: Type
foreign import data KeyboardEvent :: Type
foreign import data MediaEvent :: Type
foreign import data MessageEvent :: Type
foreign import data MouseEvent :: Type
-- | A MouseEvent where the `button` property  can be trusted
foreign import data MouseButtonEvent :: Type
foreign import data PageTransitionEvent :: Type
foreign import data PointerEvent :: Type
foreign import data PopStateEvent :: Type
foreign import data ProgressEvent :: Type
foreign import data SelectionEvent :: Type
foreign import data StorageEvent :: Type
foreign import data ToggleEvent :: Type
foreign import data TouchEvent :: Type
foreign import data TransitionEvent :: Type
foreign import data UIEvent :: Type
foreign import data UpdateEvent :: Type
foreign import data WheelEvent :: Type

instance eventIsEvent :: IsEvent Event
instance animationEventIsEvent :: IsEvent AnimationEvent
instance clipboardEventIsEvent :: IsEvent ClipboardEvent
instance compositionEventIsEvent :: IsEvent CompositionEvent
instance dragEventIsEvent :: IsEvent DragEvent
instance focusEventIsEvent :: IsEvent FocusEvent
instance hashChangeEventIsEvent :: IsEvent HashChangeEvent
instance imageEventIsEvent :: IsEvent ImageEvent
instance keyboardEventIsEvent :: IsEvent KeyboardEvent
instance mediaEventIsEvent :: IsEvent MediaEvent
instance messageEventIsEvent :: IsEvent MessageEvent
instance mouseEventIsEvent :: IsEvent MouseEvent
instance mouseButtonEventIsEvent :: IsEvent MouseButtonEvent
instance pageTransitionEventIsEvent :: IsEvent PageTransitionEvent
instance pointerEventIsEvent :: IsEvent PointerEvent
instance popStateEventIsEvent :: IsEvent PopStateEvent
instance progressEventIsEvent :: IsEvent ProgressEvent
instance selectionEventIsEvent :: IsEvent SelectionEvent
instance storageEventIsEvent :: IsEvent StorageEvent
instance toggleEventIsEvent :: IsEvent ToggleEvent
instance touchEventIsEvent :: IsEvent TouchEvent
instance transitionEventIsEvent :: IsEvent TransitionEvent
instance uiEventIsEvent :: IsEvent UIEvent
instance wheelEventIsEvent :: IsEvent WheelEvent

data Events
  = Basic Event
  | Animation AnimationEvent
  | Clipboard ClipboardEvent
  | Composition CompositionEvent
  | Drag DragEvent
  | Focus FocusEvent
  | HashChange HashChangeEvent
  | Image ImageEvent
  | Keyboard KeyboardEvent
  | Media MediaEvent
  | Message MessageEvent
  | Mouse MouseEvent
  | MouseButton MouseButtonEvent
  | PageTransition PageTransitionEvent
  | Pointer PointerEvent
  | PopState PopStateEvent
  | Progress ProgressEvent
  | Selection SelectionEvent
  | Storage StorageEvent
  | Toggle ToggleEvent
  | Touch TouchEvent
  | Transition TransitionEvent
  | UI UIEvent
  | Wheel WheelEvent
 
event :: forall a. a
event = unsafeGlobal "Event"
animationEvent :: forall a. a
animationEvent = unsafeGlobal "AnimationEvent"
clipboardEvent :: forall a. a
clipboardEvent = unsafeGlobal "ClipboardEvent"
compositionEvent :: forall a. a
compositionEvent = unsafeGlobal "CompositionEvent"
dragEvent :: forall a. a
dragEvent = unsafeGlobal "DragEvent"
hashChangeEvent :: forall a. a
hashChangeEvent = unsafeGlobal "HashChangeEvent"
historyEvent :: forall a. a
historyEvent = unsafeGlobal "HistoryEvent"
imageEvent :: forall a. a
imageEvent = unsafeGlobal "ImageEvent"
focusEvent :: forall a. a
focusEvent = unsafeGlobal "FocusEvent"
keyboardEvent :: forall a. a
keyboardEvent = unsafeGlobal "KeyboardEvent"
mediaEvent :: forall a. a
mediaEvent = unsafeGlobal "MediaEvent"
mouseEvent :: forall a. a
mouseEvent = unsafeGlobal "MouseEvent"
pageTransitionEvent :: forall a. a
pageTransitionEvent = unsafeGlobal "PageTransitionEvent"
pointerEvent :: forall a. a
pointerEvent = unsafeGlobal "PointerEvent"
popStateEvent :: forall a. a
popStateEvent = unsafeGlobal "PopStateEvent"
progressEvent :: forall a. a
progressEvent = unsafeGlobal "ProgressEvent"
selectionEvent :: forall a. a
selectionEvent = unsafeGlobal "SelectionEvent"
storageEvent :: forall a. a
storageEvent = unsafeGlobal "StorageEvent"
toggleEvent :: forall a. a
toggleEvent = unsafeGlobal "ToggleEvent"
touchEvent :: forall a. a
touchEvent = unsafeGlobal "TouchEvent"
transitionEvent :: forall a. a
transitionEvent = unsafeGlobal "TransitionEvent"
uiEvent :: forall a. a
uiEvent = unsafeGlobal "UIEvent"
wheelEvent :: forall a. a
wheelEvent = unsafeGlobal "WheelEvent"

-- | Attempt to cast to a type given a constructor for it
downcast :: forall ctor from to. ctor -> from -> Maybe to
downcast ctor from =
  if from `instanceOf` ctor
  then Just (unsafeCoerce from)
  else Nothing

-- | Looks up the `type` of an Event and attempts to match it against
-- | a known list, cast it to the relevant subclass and return as an
-- | ADT type for matching. Reference:
-- | https://developer.mozilla.org/en-US/docs/Web/Events
subclass :: forall e. IsEvent e => e -> Maybe Events
subclass e = h (type' e) where
  h "abort" =
    case downcast progressEvent e of
      Just r -> Just $ Progress r
      Nothing -> Basic <$> downcast event e
  h "afterprint"         = Basic <$> downcast event e
  h "animationstart"     = Animation <$> downcast animationEvent e
  h "animationend"       = Animation <$> downcast animationEvent e
  h "animationiteration" = Animation <$> downcast animationEvent e
  h "auxclick"           = (MouseButton <<< unsafeCoerce) <$> downcast mouseEvent e

  h "beforeprint"  = Basic <$> downcast event e
  h "beforeunload" = Basic <$> downcast event e
  h "blur"         = Focus <$> downcast focusEvent e

  h "click"             = (MouseButton <<< unsafeCoerce) <$> downcast mouseEvent e
  h "close"             = Basic <$> downcast event e
  h "compositionstart"  = Composition <$> downcast compositionEvent e
  h "compositionupdate" = Composition <$> downcast compositionEvent e
  h "compositionend"    = Composition <$> downcast compositionEvent e
  h "contextmenu"       = Mouse <$> downcast mouseEvent e
  h "copy"              = Clipboard <$> downcast clipboardEvent e
  h "cut"               = Clipboard <$> downcast clipboardEvent e

  h "dblclick"    = (MouseButton <<< unsafeCoerce) <$> downcast mouseEvent e
  h "drag"      = Drag <$> downcast dragEvent e
  h "dragend"   = Drag <$> downcast dragEvent e
  h "dragenter" = Drag <$> downcast dragEvent e
  h "dragstart" = Drag <$> downcast dragEvent e
  h "dragleave" = Drag <$> downcast dragEvent e
  h "dragover"  = Drag <$> downcast dragEvent e
  h "drop"      = Drag <$> downcast dragEvent e

  h "error" =
    case downcast uiEvent e of
      Just r -> Just $ UI r
      Nothing -> Basic <$> downcast event e

  h "focus"            = Focus <$> downcast focusEvent e
  h "fullscreenchange" = Basic <$> downcast event e
  h "fullscreenerror"  = Basic <$> downcast event e

  h "hashchange" = HashChange <$> downcast hashChangeEvent e

  h "invalid" = Basic <$> downcast event e

  h "keydown"  = Keyboard <$> downcast keyboardEvent e
  h "keypress" = Keyboard <$> downcast keyboardEvent e
  h "keyup"    = Keyboard <$> downcast keyboardEvent e

  h "load" =
    case downcast progressEvent e of
      Just r -> Just $ Progress r
      Nothing -> Basic <$> downcast event e
  h "loadend"   = Progress <$> downcast progressEvent e
  h "loadstart" = Progress <$> downcast progressEvent e 

  h "message"     = Basic <$> downcast event e
  h "mousedown"   = (MouseButton <<< unsafeCoerce) <$> downcast mouseEvent e
  h "mouseenter"  = Mouse <$> downcast mouseEvent e
  h "mouseleave"  = Mouse <$> downcast mouseEvent e
  h "mousemove"   = Mouse <$> downcast mouseEvent e
  h "mouseover"   = Mouse <$> downcast mouseEvent e
  h "mouseout"    = Mouse <$> downcast mouseEvent e
  h "mouseup"     = (MouseButton <<< unsafeCoerce) <$> downcast mouseEvent e

  h "offline" = Basic <$> downcast event e
  h "online"  = Basic <$> downcast event e
  h "open"    = Basic <$> downcast event e

  h "pagehide"          = PageTransition <$> downcast pageTransitionEvent e
  h "pageshow"          = PageTransition <$> downcast pageTransitionEvent e
  h "paste"             = Clipboard <$> downcast clipboardEvent e
  h "pointerlockchange" = Basic <$> downcast event e
  h "pointerlockerror"  = Basic <$> downcast event e
  h "popstate"          = PopState <$> downcast popStateEvent e
  h "progress"          = Progress <$> downcast progressEvent e

  h "readystatechange" = Basic <$> downcast event e
  h "reset"            = Basic <$> downcast event e
  h "resize"           = UI <$> downcast uiEvent e

  h "scroll" = Basic <$> downcast event e
  h "select" =
    case downcast uiEvent e of
      Just r -> Just $ UI r
      Nothing -> Basic <$> downcast event e
  h "submit" = Basic <$> downcast event e

  h "timeout"          = Progress <$> downcast progressEvent e
  h "transitionstart"  = Transition <$> downcast transitionEvent e
  h "transitioncancel" = Transition <$> downcast transitionEvent e
  h "transitionend"    = Transition <$> downcast transitionEvent e
  h "transitionrun"    = Transition <$> downcast transitionEvent e

  h "unload" = Basic <$> downcast event e

  h "wheel" = Wheel <$> downcast wheelEvent e

  h _ = Nothing

-- | Whether the event bubbles
bubbles :: forall e. IsEvent e => e -> Boolean
bubbles e = e .. "bubbles"

-- | Whether the event is cancelable
cancelable :: forall e. IsEvent e => e -> Boolean
cancelable e = e .. "cancelable"

-- | Whether the event is a composed event (shadow DOM)
composed :: forall e. IsEvent e => e -> Boolean
composed e = e .. "composed"

-- | Whether the event is browser-generated
trusted :: forall e. IsEvent e => e -> Boolean
trusted e = e .. "isTrusted"

-- | Whether the default action has been prevented
defaultPrevented :: forall e. IsEvent e => e -> Boolean
defaultPrevented e = e .. "defaultPrevented"

-- | Whether propagation has been stopped
propagationStopped :: forall e. IsEvent e => e -> Effect Unit
propagationStopped e = e ... "isPropagationStopped" $ []

-- | The phase the event is currently in
eventPhase :: forall e. IsEvent e => e -> EventPhase
eventPhase e = phase $ e .. "eventPhase"
  where phase :: Int -> EventPhase
        phase 1 = Capturing
        phase 2 = AtTarget
        phase 3 = Bubbling
        phase _ = None

-- | When the event was generated
timestamp :: forall e. IsEvent e => e -> Number
timestamp e = e .. "timeStamp"

-- | A string descriptor of the event name (lowercase, no `on`)
type' :: forall e. IsEvent e => e -> String
type' e = e .. "type"

-- | Returns the `Element` the event was dispatched against
target :: forall e. IsEvent e => e -> Element
target e = e .. "target"

-- | Returns the `Element` the event is currently bubbling through
currentTarget :: forall e. IsEvent e => e -> Element
currentTarget e = e .. "currentTarget"

-- | For drag and drop and such, a related Element
relatedTarget :: forall e. IsEvent e => e -> Maybe Element
relatedTarget e = toMaybe $ e .. "target"

-- | Stops propagation of the event
stopPropagation :: forall e. IsEvent e => e -> Effect Unit
stopPropagation e = delay unit $ \_ -> pure $ e ... "stopPropagation" $ []

-- | Stops immediate propagation of the event
stopImmediatePropagation :: forall e. IsEvent e => e -> Effect Unit
stopImmediatePropagation e = delay unit $ \_ -> pure $ e ... "stopImmediatePropagation" $ []

-- | Prevents the default action from being executed after propagation
preventDefault :: forall e. IsEvent e => e -> Effect Unit
preventDefault e = delay unit $ \_ -> pure $ e ... "preventDefault" $ []

-- | Events with information about modifier keys (Mouse, Keyboard, Touch)
class HasModifierKeys e

instance mouseEventHasModifierKeys :: HasModifierKeys MouseEvent
instance mouseButtonEventHasModifierKeys :: HasModifierKeys MouseButtonEvent
instance keyboardEventHasModifierKeys :: HasModifierKeys KeyboardEvent
-- instance touchEventHasModifierKeys :: HasModifierKeys TouchEvent

-- | Was the alt key held down?
altKey :: forall e. HasModifierKeys e => e -> Boolean
altKey e = e .. "altKey"

-- | Was the ctrl key held down?
ctrlKey :: forall e. HasModifierKeys e => e -> Boolean
ctrlKey e = e .. "ctrlKey"

-- | Was the shift key held down?
shiftKey :: forall e. HasModifierKeys e => e -> Boolean
shiftKey e = e .. "shiftKey"

-- | Was the meta key held down?
metaKey :: forall e. HasModifierKeys e => e -> Boolean
metaKey e = e .. "metaKey"

data ModifierKey
  = Alt
  | AltGraph
  | CapsLock
  | Control
  | Fn
  | FnLock
  | Hyper
  | Meta
  | NumLock
  | ScrollLock
  | Shift
  | Super
  | Symbol
  | SymbolLock

instance showModifierKey :: Show ModifierKey where
  show Alt = "Alt"
  show AltGraph = "AltGraph"
  show CapsLock = "CapsLock"
  show Control = "Control"
  show Fn = "Fn"
  show FnLock = "FnLock"
  show Hyper = "Hyper"
  show Meta = "Meta"
  show NumLock = "NumLock"
  show ScrollLock = "ScrollLock"
  show Shift = "Shift"
  show Super = "Super"
  show Symbol = "Symbol"
  show SymbolLock = "SymbolLock"

-- | Returns whether the given `ModifierKey` was pressed
getModifierState :: forall e. HasModifierKeys e => e -> ModifierKey -> Boolean
getModifierState e s = e ... "getModifierState" $ [ show s ]

-- Clipboard events
-- Composition Events
-- Focus Events
-- Form Events

-- Keyboard Events

-- | Returns whether the event is composing (shadow dom)
composing :: KeyboardEvent -> Boolean
composing e = e .. "isComposing"

-- | Returns a string describing the key
-- | List: https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/key/Key_Values
key :: KeyboardEvent -> String
key e = e .. "key"

-- | The locale string of the user's keyboard at present, which may or
-- | may not be the locale of the data
locale :: KeyboardEvent -> String
locale e = e .. "locale"

-- | An index of the key on the input device
location :: KeyboardEvent -> Number
location e = e .. "location"

-- | Returns whether this event was generated while the key was held down
repeat :: KeyboardEvent -> Boolean
repeat e = e .. "repeat"

-- Mouse Events

buttons :: MouseEvent -> Number
buttons e = e .. "buttons"

region :: MouseEvent -> Maybe String
region e = toMaybe $ e .. "region"

clientX :: MouseEvent -> Number
clientX e = e .. "clientX"

clientY :: MouseEvent -> Number
clientY e = e .. "clientY"

movementX :: MouseEvent -> Number
movementX e = e .. "movementX"

movementY :: MouseEvent -> Number
movementY e = e .. "movementY"

offsetX :: MouseEvent -> Number
offsetX e = e .. "offsetX"

offsetY :: MouseEvent -> Number
offsetY e = e .. "offsetY"

pageX :: MouseEvent -> Number
pageX e = e .. "pageX"

pageY :: MouseEvent -> Number
pageY e = e .. "pageY"

screenX :: MouseEvent -> Number
screenX e = e .. "screenX"

screenY :: MouseEvent -> Number
screenY e = e .. "screenY"

-- Mouse Button Events

-- | Which button was pressed to trigger the event
-- | Reference: https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent/button
button :: MouseButtonEvent -> Int
button e = e .. "button"

-- Pointer Events
-- Selection Events
-- Touch Events
-- UI Events
-- Wheel Events
-- Media Events
-- Image Events
-- Animation Events
-- Transition Events
-- Toggle Events
