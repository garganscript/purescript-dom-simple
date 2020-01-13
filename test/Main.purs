module Test.Main where

import Prelude

import DOM.Simple.Document.Spec as Document
import DOM.Simple.Element.Spec as Element
import DOM.Simple.Parent.Spec as Parent
import Data.Traversable (sequence_)
import Effect (Effect)
import Test.Spec (Spec)
import Test.Spec.Mocha (runMocha)

spec :: Spec Unit
spec = sequence_
  [ Document.spec
  , Element.spec
  , Parent.spec ]

main :: Effect Unit
main = runMocha (pure spec)
