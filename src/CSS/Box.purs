module SoundCloud.CSS.Box
  ( boxShadow_
  , boxShadowInset_
  ) where

import CSS

import CSS.Box (bsInset)
import Data.NonEmpty (singleton)
import Prelude.Unicode ((∘))

boxShadow_ ∷ BoxShadow → CSS
boxShadow_ = boxShadow ∘ singleton

boxShadowInset_ ∷ BoxShadow → CSS
boxShadowInset_ = boxShadow ∘ singleton ∘ bsInset
