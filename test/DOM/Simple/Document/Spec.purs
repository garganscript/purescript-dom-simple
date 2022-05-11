module DOM.Simple.Document.Spec where

import DOM.Simple.Console (log2)
import DOM.Simple.Document as Document
import DOM.Simple.Node as Node
import Effect.Class ( liftEffect )
import Prelude (Unit, discard, ($))
import Test.Spec ( Spec, describe, it )
import Test.Spec.Assertions ( shouldEqual )

createElementSpec :: Spec Unit
createElementSpec =
  describe "Creation" do
    it "should be possible to create elements" do
      let e = Document.createElement "i"
      liftEffect $ log2 "element:" e
      (Node.name e) `shouldEqual` "I"

spec :: Spec Unit
spec = createElementSpec
