module SoundCloud.CSS.Transform
  ( scale_
  , translate_
  , skew_
  ) where

import Prelude

import CSS (Transformation(..), fromString, value)

scale_ ∷ Number → Transformation
scale_ a = Transformation $ fromString "(" <> value a <> fromString ")"

translate_ ∷ Number → Transformation
translate_ a = Transformation $ fromString "(" <> value a <> fromString ")"

skew_ ∷ Number → Transformation
skew_ a = Transformation $ fromString "(" <> value a <> fromString ")"
