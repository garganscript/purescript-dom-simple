module Test.Main where

import Prelude

import DOM.Simple.Document.Spec as Document
import DOM.Simple.Element.Spec as Element
import DOM.Simple.Parent.Spec as Parent
import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)

main :: Effect Unit
main = launchAff_ $ do
  runSpec reporter Document.spec
  runSpec reporter Element.spec
  runSpec reporter Parent.spec
  where
    reporter = [consoleReporter]
