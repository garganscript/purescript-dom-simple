module DOM.Simple.Document.Spec where

import Prelude (Unit, discard, ($))
import Effect.Class ( liftEffect )
import DOM.Simple.Console
-- import Effect.Aff (launchAff_)
import Test.Spec ( Spec, describe, it )
import Test.Spec.Assertions ( shouldEqual )
import DOM.Simple.Document as Document
import DOM.Simple.Node as Node

createElementSpec :: Spec Unit
createElementSpec =
  describe "Creation" do
    it "should be possible to create elements" do
      let e = Document.createElement "i"
      liftEffect $ log2 "element:" e
      (Node.name e) `shouldEqual` "I"
      
spec :: Spec Unit
spec = createElementSpec
