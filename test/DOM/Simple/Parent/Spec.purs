module DOM.Simple.Parent.Spec where

import Prelude
import Data.Array as A
import Data.Maybe ( Maybe(..), isJust )
import Data.Traversable ( traverse, sequence_ )
import Data.Tuple ( Tuple(..) )
import Effect ( Effect )
import Effect.Class ( liftEffect )
-- import Effect.Aff (launchAff_)

import Test.Spec ( Spec, describe, it )
import Test.Spec.Assertions ( shouldEqual )
-- import Test.Spec.QuickCheck (quickCheck')
import DOM.Simple.Document as Document
import DOM.Simple.Element as Element
import DOM.Simple.Parent as Parent

spec :: Spec Unit
spec =
  describe "Adding and retrieving children" do
    it "should just work" do
      let e = Document.createElement "div"
      Parent.childCount e `shouldEqual` 0
      let children = Parent.children e
      A.length children `shouldEqual` 0
      isJust (Parent.firstChildElement e) `shouldEqual` false
      isJust (Parent.lastChildElement e) `shouldEqual` false
      let f = Document.createElement "i"
      liftEffect $ Parent.append e [f]
      Parent.childCount e `shouldEqual` 1
      let children = Parent.children e
      A.length children `shouldEqual` 1
      let g = Document.createElement "b"
      liftEffect $ Parent.append e [g]
      Parent.childCount e `shouldEqual` 2
      let children = Parent.children e
      A.length children `shouldEqual` 2
      let h = Document.createElement "span"
      liftEffect $ Parent.prepend e [h]
      Parent.childCount e `shouldEqual` 3
      let children = Parent.children e
      A.length children `shouldEqual` 3
