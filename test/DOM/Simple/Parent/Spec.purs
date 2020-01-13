module DOM.Simple.Parent.Spec where

import Prelude
import Data.Array as A
import Data.Maybe (isJust)
import Effect.Class ( liftEffect )
-- import Effect.Aff (launchAff_)

import Test.Spec ( Spec, describe, it )
import Test.Spec.Assertions ( shouldEqual )
-- import Test.Spec.QuickCheck (quickCheck')
import DOM.Simple.Document as Document
import DOM.Simple.Parent as Parent

spec :: Spec Unit
spec =
  describe "Adding and retrieving children" do
    it "should just work" do
      let e = Document.createElement "div"
      Parent.childCount e `shouldEqual` 0
      testChildren1 e $ Parent.children e
      testChildren2 e $ Parent.children e
      testChildren3 e $ Parent.children e
      testChildren4 e $ Parent.children e
    where
      testChildren1 e children = do
        A.length children `shouldEqual` 0
        isJust (Parent.firstChildElement e) `shouldEqual` false
        isJust (Parent.lastChildElement e) `shouldEqual` false
        let f = Document.createElement "i"
        liftEffect $ Parent.append e [f]
        Parent.childCount e `shouldEqual` 1
      testChildren2 e children = do
        A.length children `shouldEqual` 1
        let g = Document.createElement "b"
        liftEffect $ Parent.append e [g]
        Parent.childCount e `shouldEqual` 2
      testChildren3 e children = do
        A.length children `shouldEqual` 2
        let h = Document.createElement "span"
        liftEffect $ Parent.prepend e [h]
        Parent.childCount e `shouldEqual` 3
      testChildren4 e children = do
        A.length children `shouldEqual` 3
