module SoundCloud.HTML.Util.Prop
  ( css
  ) where

import Prelude

import Halogen.HTML (AttrName(..), ClassName(..), IProp, attr)
import Halogen.HTML.Properties (classes)
import Prelude.Unicode ((∘))

type WithClass r i = IProp ("class" ∷ String | r) i

css ∷ ∀ r i. Array String → WithClass r i
css = classes ∘ map ClassName

className ∷ ∀ p i. String → IProp p i
className = attr $ AttrName "class"
