module SoundCloud.CSS.Background
  ( backgroundColor'
  , color'
  ) where

import Prelude (($))
import CSS (CSS, key, fromString)

backgroundColor' ∷ String → CSS
backgroundColor' = key $ fromString "background-color"

color' ∷ String → CSS
color' = key $ fromString "color"
