module DOM.Simple.Element.Spec where

import Prelude
import Data.Maybe ( Maybe(..) )
import Effect.Class ( liftEffect )
-- import Effect.Aff (launchAff_)

import Test.Spec ( Spec, describe, it )
import Test.Spec.Assertions ( shouldEqual )
-- import Test.Spec.QuickCheck (quickCheck')
import DOM.Simple.Document as Document
import DOM.Simple.Element as Element




spec :: Spec Unit
spec =
  describe "Getting and setting attributes" do
    it "should just work" do
      let e = Document.createElement "div"
      Element.hasAttr e "title" `shouldEqual` false
      Element.attr e "title" `shouldEqual` Nothing
      Element.attrNames e `shouldEqual` [ ]
      liftEffect $ Element.setAttr e "title" "hello"
      Element.hasAttr e "title" `shouldEqual` true
      Element.attr e "title" `shouldEqual` Just "hello"
      Element.attrNames e `shouldEqual` [ "title" ]
      liftEffect $ Element.setAttr e "title" "hello world"
      Element.attr e "title" `shouldEqual` Just "hello world"
      Element.attrNames e `shouldEqual` [ "title" ]
