module SoundCloud.CSS.Caret
  ( caretColor
  ) where

import Prelude

import CSS (Color, CSS, fromString, key)

caretColor ∷ Color → CSS
caretColor = key $ fromString "caret-color"
